#!/usr/bin/python

import argparse
from PIL import Image
from os import path
from serial import Serial
from struct import pack
from time import sleep
from json import load
from time import sleep

from win32gui import GetForegroundWindow, GetWindowText
from win32process import GetWindowThreadProcessId, GetModuleFileNameEx
from win32con import PROCESS_QUERY_INFORMATION
from win32api import OpenProcess, CloseHandle

SCREEN_WIDTH = 128
SCREEN_HEIGHT = 64
RATIO = 0.8
CROP_PERCENTAGE = 0.1
FRAMES = 6
CONFIG_FOLDER = None

def animate(filename, frames = None):
    with Image.open(filename) as image:
        # print("%d, %d" % (image.width, image.height))
        CROP_WIDTH = image.width * CROP_PERCENTAGE
        CROP_HEIGHT = image.height * CROP_PERCENTAGE

        arr = []

        if frames is None:
            frames = image.n_frames

        for idx in range(frames):
            if idx % (image.n_frames // FRAMES) == 0:
                # print("Frame #%d" % idx)
                image.seek(idx)
                
                frame = image.crop((CROP_WIDTH, CROP_HEIGHT, image.width - CROP_WIDTH, image.height - CROP_HEIGHT))
                
                frame.thumbnail((SCREEN_WIDTH * RATIO, SCREEN_HEIGHT * RATIO), Image.Resampling.LANCZOS)

                arr.append(writeArray(frame))

        return arr

def writeArray(frame):
    bitIdx = 0
    byte = 0
    content = []

    frame = frame.convert("1")
    
    for y in range(frame.height):
        line = []
        for x in range(frame.width):
            if (frame.getpixel((x,y)) > 0):
                b = 0
            else:
                b = 1
            byte = (byte << 1) | b
            bitIdx += 1

            if (bitIdx == 8):
                #line.append(f"0b{byte:08b}")
                line.append(byte)
                byte = 0
                bitIdx = 0

        content += line

    if (bitIdx < 8):
        byte = byte << (8 - bitIdx)
        byte |= (1 << (8 - bitIdx)) - 1
        #line.append(f"0b{byte:08b}")
        line.append(byte)
        bitIdx = 0
        byte = 0

    return content

MAGIC = 0x4242
def handshake(s):
    SERIAL_MAGIC = pack("H", MAGIC)
    
    s.write(SERIAL_MAGIC)

    try:
        result = s.read(len(SERIAL_MAGIC))
    except:
        print("Error in magic value!")
        return False

    if (SERIAL_MAGIC == result):
        return True
    else:
        print("Error in magic value:", result)
        return False

CHUNK_SIZE = 16
CHUNK_ACK = 0x42

def sendDataInChunks(s, data):
    i = 0

    while (i * CHUNK_SIZE < len(data)):
        # Send chunk
        if (i + 1) * CHUNK_SIZE > len(data):
            s.write(data[i * CHUNK_SIZE :])
        else:
            s.write(data[i * CHUNK_SIZE : (i + 1) * CHUNK_SIZE])

        ack = s.read(1)
        # Wait for ACK
        if ack != bytes([0x42]):
            print("Error in chunk ACK", ack)

            return False
        else:
            i += 1
    
    return True

MSG_TYPE_IMAGE = 0
MSG_TYPE_KEYS = 1
MSG_TYPE_RESET = 2

def sendImage(s, x, y, filename):
    with Image.open(filename) as image:
        # print("%d, %d" % (image.width, image.height))
        CROP_WIDTH = image.width * CROP_PERCENTAGE
        CROP_HEIGHT = image.height * CROP_PERCENTAGE

        # frame = image.crop((CROP_WIDTH, CROP_HEIGHT, image.width - CROP_WIDTH, image.height - CROP_HEIGHT))                
        image.thumbnail((SCREEN_HEIGHT * RATIO, SCREEN_HEIGHT * RATIO), Image.Resampling.LANCZOS)
        final = Image.new(mode="1", size = (SCREEN_HEIGHT, SCREEN_HEIGHT), color = (1))
        final.paste(image)

        result = writeArray(final)

        # Build the message to send
        msg = pack("B", MSG_TYPE_IMAGE) + \
        pack("H", x & 0xffff) + \
        pack("H", y & 0xffff) +\
        pack("H", final.width) + \
        pack("H", final.height) + \
        pack("H", len(result))

        s.write(msg)
        return sendDataInChunks(s, bytes(result))

def sendKeys(s, keys):
    SPECIAL = {
        "CTRL": 0x80,
        "SHIFT": 0x81,
        "ALT": 0x82,
        "WIN": 0x83,
        "UP": 0xDA,
        "DOWN": 0xD9,
        "LEFT": 0xD8,
        "RIGHT": 0xD7,
        "BACKSPACE": 0xB2,
        "TAB": 0xB3,
        "RETURN": 0xB0,
        "MENU": 0xED,
        "ESC": 0xB1,
        "INSERT": 0xD1,
        "DELETE": 0xD4,
        "PAGE_UP": 0xD3,
        "PAGE_DOWN": 0xD6,
        "HOME": 0xD2,
        "END": 0xD5,
        "CAPS": 0xC1,
        "PRINT_SCREEN": 0xCE,
        "PAUSE": 0xD0,
        "NUMLOCK": 0xDB,
        "F1": 0xC2,
        "F2": 0xC3,
        "F3": 0xC4,
        "F4": 0xC5,
        "F5": 0xC6,
        "F6": 0xC7,
        "F7": 0xC8,
        "F8": 0xC9,
        "F9": 0xCA,
        "F10": 0xCB,
        "F11": 0xCC,
        "F12": 0xCD
    }

    numbers = [ a for a in map(lambda x: SPECIAL[x] if x in SPECIAL else ord(x), keys) ]
    
    msg = pack("B", MSG_TYPE_KEYS) + \
    pack("B", len(numbers)) + \
    bytes(numbers)
    
    s.write(msg)

def sendReset(s):
    msg = pack("B", MSG_TYPE_RESET)
    s.write(msg)

def getCurrentWindow():
    activeWindow = GetForegroundWindow()
    tid, pid = GetWindowThreadProcessId(activeWindow)
    proc = OpenProcess(PROCESS_QUERY_INFORMATION, False, pid)
    fullpath = GetModuleFileNameEx(proc, 0)
    title = GetWindowText(activeWindow)
    CloseHandle(proc)

    return {"proc": path.basename(fullpath),
            "title": title}

def daemon(config):
    lastCfg = None

    while True:
        found = False
        try:
            window = getCurrentWindow()
        except:
            window = None

        if window is not None:
            for c in config["configs"]:
                if "proc" not in c or \
                    "title" not in c or \
                    "image" not in c or \
                    "x" not in c or \
                    "y" not in c or \
                    "keys" not in c:
                    continue

                if window["proc"].lower() != c["proc"].lower():
                    continue

                if c["title"] != "" and c["title"].lower() not in window["title"].lower():
                    continue

                img = path.sep.join((CONFIG_FOLDER, c["image"]))

                if not path.exists(img):
                    continue

                found = True

                # Don't update
                if lastCfg == c:
                    break

                print("RULE: ", window)

                lastCfg = c

                s = Serial(
                    port = config["port"],
                    baudrate = 115200,
                    timeout = 2)
                
                if handshake(s):
                    if sendImage(s, c["x"], c["y"], img):
                        sendKeys(s, c["keys"])
                
                s.close()

                break

        if not found and lastCfg != None:
            print("RULE: IDLE")

            lastCfg = None

            s = Serial(
                port = config["port"],
                baudrate = 115200,
                timeout = 2)
            
            if handshake(s):
                sendReset(s)
            
            s.close()

        sleep(2)

if __name__ == "__main__":
    CONFIG_FOLDER = path.sep.join((path.dirname(__file__), "config"))

    # Find config folder
    if not path.exists(path.sep.join((CONFIG_FOLDER, "config.json"))):
        CONFIG_FOLDER = path.sep.join((path.dirname(__file__), "..", "config"))

        if not path.exists(path.sep.join((CONFIG_FOLDER, "config.json"))):
            print("Did not find config folder")
            exit(1)

    print("Config folder:", CONFIG_FOLDER)
        
    with open(path.sep.join((CONFIG_FOLDER, "config.json")), "r") as f:
        config = load(f)

    daemon(config)