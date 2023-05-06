# OneBtn
This is the OneBtn. A context-aware multi-purpose macro pad to control everything with  a push of a (single) button.


<p align="center">
  <img src="https://raw.githubusercontent.com/gili-yankovitch/onebtn/master/hardware/Mainboard/Mainboard-front.png" height="200"> <img src="https://raw.githubusercontent.com/gili-yankovitch/onebtn/master/hardware/Mainboard/Mainboard-back.png" height="200">
</p>

## Prerequisits
### Software
Please install the following software to be able to flash software to the device:
* [Arduino SDK](https://www.arduino.cc/en/software)
* [Platformio](https://platformio.org/install/cli) or VScode with Platformio AddOn

### Hardware
All PCB specs are provided here under [hardware/](https://github.com/gili-yankovitch/onebtn/tree/master/hardware). This can be easily manufactured as well as paneled for a larger volume. There are no special requirements for this board's manufacturing process.

#### Bill of Materials
| Quantity | Component Description | Mfr. No | Datasheet |
|----------|-----------------------|---------|-----------|
| 2 | SMD 1/4W 22 OHM 1% | RK73H2ATTD22R0F | [Datasheet](https://www.mouser.co.il/datasheet/2/219/RK73H-1825326.pdf) |
| 1 | SMD 1 kOhms 125 mW 0805 5% | RC0805JR-071KL | [Datasheet](https://www.mouser.co.il/datasheet/2/447/PYu_RC_Group_51_RoHS_L_11-1984063.pdf) |
| 1 | SMD 1/4watts 10Kohms 5% | RK73B2ATTD103J | [Datasheet](https://www.mouser.co.il/datasheet/2/219/RK73B-1825463.pdf) |
| 1 | SMD 1M ohm 1% 50 ppm Thin Film | RT0805FRE101ML | [Datasheet](https://www.mouser.co.il/datasheet/2/447/PYu_RT_1_to_0_01_RoHS_L_12-3003070.pdf) |
| 1 | SMD/SMT 100V 20pF C0G 0805 5% | CC0805JRNPO0BN200 | [Datasheet](https://www.mouser.co.il/datasheet/2/447/UPY_NP0X7R_MV_100_to_630V_24-2604388.pdf) |
| 1 | SMD/SMT CAP ,MLCC ,0805,25V ,X7R,1.0UF20% ,T&R | MCAST21GSB7105MTNB25 | [Datasheet](https://www.mouser.co.il/datasheet/2/396/Taiyo_Yuden_1102023_MC_mlcc_all_e-3081584.pdf) |
| 1 | SMD/SMT 50V 0.1uF X7R 0805 10% | C0805C104K5RAC7411 | [Datasheet](https://www.mouser.co.il/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf) |
| 1 | Type C 16Pins SMT Socket Connector USB 3.1 Type-C Female MD DIP | [Link](https://www.aliexpress.com/item/4001076043694.html?spm=a2g0o.order_list.0.0.2e2f1802zEBigU) | [Datasheet](https://ae01.alicdn.com/kf/H1e697b3dd3c54072b04ede95a2d44105H.jpg) |
| 1 | 0.2W Intelligent external control surface mount SMD LED | SK6812Mini-E | [Datasheet](https://cdn-shop.adafruit.com/product-files/4960/4960_SK6812MINI-E_REV02_EN.pdf) |
| 1 | Crystals Crystals 16MHz 20pF | FOXSDLF/160-20 | [Datasheet](https://www.mouser.co.il/datasheet/2/3/C4SD-2141100.pdf) |
| 1 | 8-bit Microcontrollers - MCU 8-bit Microcontrollers - MCU AVR USB 32K FLASH | ATMEGA32U4-AU | [Datasheet](https://www.mouser.co.il/datasheet/2/268/Atmel_7766_8_bit_AVR_ATmega16U4_32U4_Datasheet-1315135.pdf) |
| 1 | OLED Display LCD 0.42" White LCD Screen Display Module | [Link](https://www.aliexpress.com/item/1005004674483621.html?spm=a2g0o.order_list.order_list_main.53.3f8418028cM6Vv) | [Datasheet](https://www.vishay.com/docs/37902/oled128o064dbpp3n00000.pdf) |
| 1 | Transparent Cover Key Keycaps Double-layer Custom Switch | [Link](https://www.aliexpress.com/item/1005002716375572.html?spm=a2g0o.order_list.order_list_main.137.3f8418028cM6Vv) |  |
| 1 | Outemu Switch Mechanical Keyboard Switch 3Pin | [Link](https://www.aliexpress.com/item/1005002378701948.html?spm=a2g0o.order_list.order_list_main.242.3f8418028cM6Vv) |  |

# Software
## Building
To build this project, usage of PlatformIO is recommended although the Arduino IDE will probably work as well. To use PlatformIO, simply run:
```
pio run --environment leonardo
```

## Flashing
This device accepts software in two ways: First through the ICSP port and the other through USB (after flashing Arduino Leonardo bootloader).

To flash using the ICSP port, simply use any Arduino device, flash it with the Arduino as ISP example from the Arduino IDE and use it to flash firmware to this device. While doing that, one might wish to use the Arduino IDE further by simply flashing the Arduino Bootloader to the device. Once this is done, USB flashing will be available. To flash the software using USB, simply run:
```
pio run --environment leonardo --target upload
```
