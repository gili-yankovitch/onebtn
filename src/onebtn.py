#!/usr/bin/python

from PIL import Image
import argparse
from serial import Serial
from struct import pack

SCREEN_WIDTH = 128
SCREEN_HEIGHT = 64
RATIO = 1
CROP_PERCENTAGE = 0.1
FRAMES = 6

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

        # print("Bytes per line", len(line))
        content += line

    if (bitIdx < 8):
        byte = byte << (8 - bitIdx)        
        line.append(f"0b{byte:08b}")
        bitIdx = 0
        byte = 0

    return content
    # return "{ %s }" % ", ".join(content)

def parse(filename, frames = None):
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
    return None
        # print("%d, %d" % (frame.width, frame.height))
        # final = "static const unsigned char PROGMEM animation[{FRAMES}][{IMGSIZE}] = {{ {CONTENT} }};".format(IMGSIZE = int(frame.width * frame.height / 8), FRAMES = FRAMES, CONTENT = ", ".join(arr))
        # return final

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

MSG_TYPE_IMAGE = 0

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

def sendImage(s, x, y, filename):
    with Image.open(filename) as image:
        # print("%d, %d" % (image.width, image.height))
        CROP_WIDTH = image.width * CROP_PERCENTAGE
        CROP_HEIGHT = image.height * CROP_PERCENTAGE

        frame = image.crop((CROP_WIDTH, CROP_HEIGHT, image.width - CROP_WIDTH, image.height - CROP_HEIGHT))
                
        frame.thumbnail((SCREEN_WIDTH * RATIO, SCREEN_HEIGHT * RATIO), Image.Resampling.LANCZOS)

        result = writeArray(frame)

        # Build the message to send
        msg = pack("B", MSG_TYPE_IMAGE) + \
        pack("H", x & 0xffff) + \
        pack("H", y & 0xffff) +\
        pack("H", frame.width) + \
        pack("H", frame.height) + \
        pack("H", len(result))

        print(frame.width, frame.height)

        # Append the data
        #print(len(result))
        #print(pack("H", len(result)))
        #print(msg + bytes(result))

        s.write(msg)
        sendDataInChunks(s, bytes(result))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Send image to OneBtn')
    parser.add_argument("port", help = "Serial port (COM/ttyS)")
    parser.add_argument("img", help = "Image to send")

    args = parser.parse_args()

    s = Serial(
        port = args.port,
        baudrate = 115200,
        timeout = 2)

    if (handshake(s)):
        sendImage(s, 30, -15, args.img)

    s.close()