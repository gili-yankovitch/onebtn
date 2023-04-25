EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Crystal Y1
U 1 1 63E2A139
P 2450 3050
F 0 "Y1" V 2404 3181 50  0000 L CNN
F 1 "Crystal" V 2495 3181 50  0000 L CNN
F 2 "FOXLF-16_20:FOXSLF16020" H 2450 3050 50  0001 C CNN
F 3 "~" H 2450 3050 50  0001 C CNN
	1    2450 3050
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 63E2B957
P 2250 2900
F 0 "C1" V 1998 2900 50  0000 C CNN
F 1 "20pF" V 2089 2900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2288 2750 50  0001 C CNN
F 3 "~" H 2250 2900 50  0001 C CNN
	1    2250 2900
	0    1    1    0   
$EndComp
Text GLabel 1900 3500 3    50   Input ~ 0
GND
Wire Wire Line
	2100 3200 1900 3200
Wire Wire Line
	1900 3200 1900 3500
Wire Wire Line
	2100 2900 1900 2900
Wire Wire Line
	1900 2900 1900 3200
Connection ~ 1900 3200
Wire Wire Line
	2950 3100 2750 3100
Wire Wire Line
	2750 3100 2750 3200
Wire Wire Line
	2750 2900 2750 3000
Wire Wire Line
	2750 3000 2950 3000
$Comp
L Device:R R3
U 1 1 63E2ECCC
P 5800 1250
F 0 "R3" V 5593 1250 50  0000 C CNN
F 1 "22" V 5684 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5730 1250 50  0001 C CNN
F 3 "~" H 5800 1250 50  0001 C CNN
	1    5800 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 63E30102
P 5800 950
F 0 "R2" V 5593 950 50  0000 C CNN
F 1 "22" V 5684 950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5730 950 50  0001 C CNN
F 3 "~" H 5800 950 50  0001 C CNN
	1    5800 950 
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 63E30562
P 2650 3050
F 0 "R1" H 2580 3004 50  0000 R CNN
F 1 "1M" H 2580 3095 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2580 3050 50  0001 C CNN
F 3 "~" H 2650 3050 50  0001 C CNN
	1    2650 3050
	-1   0    0    1   
$EndComp
Connection ~ 2450 2900
Wire Wire Line
	2450 2900 2400 2900
Connection ~ 2450 3200
Wire Wire Line
	2450 3200 2400 3200
Wire Wire Line
	2450 2900 2650 2900
Wire Wire Line
	2450 3200 2650 3200
Connection ~ 2650 3200
Connection ~ 2650 2900
Wire Wire Line
	2650 3200 2750 3200
Wire Wire Line
	2650 2900 2750 2900
Wire Wire Line
	5550 1500 5550 1250
Wire Wire Line
	5550 1250 5650 1250
Wire Wire Line
	5450 1500 5450 950 
Wire Wire Line
	5450 950  5650 950 
Wire Wire Line
	5950 950  6200 950 
Wire Wire Line
	5950 1250 6200 1250
Text GLabel 6200 1250 2    50   Input ~ 0
D-
Text GLabel 6200 950  2    50   Input ~ 0
D+
$Comp
L Device:C C2
U 1 1 63E2C8CC
P 2250 3200
F 0 "C2" V 1998 3200 50  0000 C CNN
F 1 "20pF" V 2089 3200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2288 3050 50  0001 C CNN
F 3 "~" H 2250 3200 50  0001 C CNN
	1    2250 3200
	0    1    1    0   
$EndComp
Text GLabel 8050 2550 0    50   Input ~ 0
GND
Text GLabel 8050 2450 0    50   Input ~ 0
VCC
Text GLabel 4850 1500 1    50   Input ~ 0
MOSI
Text GLabel 4950 1500 1    50   Input ~ 0
SCK
Text GLabel 5150 1500 1    50   Input ~ 0
VCC
$Comp
L Device:C C3
U 1 1 63E52274
P 5350 650
F 0 "C3" V 5098 650 50  0000 C CNN
F 1 "1uF" V 5189 650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5388 500 50  0001 C CNN
F 3 "~" H 5350 650 50  0001 C CNN
	1    5350 650 
	0    -1   -1   0   
$EndComp
Text GLabel 5700 650  2    50   Input ~ 0
GND
Text GLabel 4750 1500 1    50   Input ~ 0
MISO
$Comp
L Device:R R4
U 1 1 63E55D84
P 2700 2500
F 0 "R4" H 2630 2454 50  0000 R CNN
F 1 "10k" H 2630 2545 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2630 2500 50  0001 C CNN
F 3 "~" H 2700 2500 50  0001 C CNN
	1    2700 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2700 2700 2700 2650
Text GLabel 2700 2050 1    50   Input ~ 0
VCC
Text GLabel 8050 3400 0    50   Input ~ 0
VCC
Text GLabel 8050 3800 0    50   Input ~ 0
GND
Text GLabel 8050 3600 0    50   Input ~ 0
MOSI
Text GLabel 8050 3500 0    50   Input ~ 0
SCK
Text GLabel 8050 3300 0    50   Input ~ 0
MISO
Text GLabel 2300 1400 2    50   Input ~ 0
VCC
Text GLabel 2300 1900 2    50   Input ~ 0
GND
Text GLabel 2300 2100 2    50   Input ~ 0
GND
Text GLabel 2300 1600 2    50   Input ~ 0
D-
Text GLabel 900  1700 0    50   Input ~ 0
D-
Text GLabel 2300 1700 2    50   Input ~ 0
D+
Text GLabel 900  1600 0    50   Input ~ 0
D+
$Comp
L NFP1306-82:FFC-8 U1
U 1 1 63E75780
P 8150 2700
F 0 "U1" V 8199 2828 50  0000 L CNN
F 1 "FFC-8" V 8290 2828 50  0000 L CNN
F 2 "OLED-0.65Pitch-16Pins:OLED-0.6Pitch-8Pins" H 8150 2700 50  0001 C CNN
F 3 "" H 8150 2700 50  0001 C CNN
	1    8150 2700
	0    1    1    0   
$EndComp
NoConn ~ 8050 3050
NoConn ~ 8050 3150
Text GLabel 2500 2550 1    50   Input ~ 0
RST
Text GLabel 8050 2650 0    50   Input ~ 0
OLED_RST
Wire Wire Line
	2700 2050 2700 2350
Text GLabel 8050 3700 0    50   Input ~ 0
RST
Text GLabel 4950 5000 3    50   Input ~ 0
OLED_RST
$Comp
L ATMEGA32U4-AU:ATMEGA32U4-AU IC1
U 1 1 63EAD6D0
P 5750 1500
F 0 "IC1" V 7304 2644 50  0000 L CNN
F 1 "ATMEGA32U4-AU" V 7395 2644 50  0000 L CNN
F 2 "ATMEGA32U4-AU:QFP80P1200X1200X120-44N" H 8800 2400 50  0001 L CNN
F 3 "http://www.atmel.com/images/atmel-7766-8-bit-avr-atmega16u4-32u4_summary.pdf" H 8800 2300 50  0001 L CNN
F 4 "MCU AVR 32K FLASH 16MHZ 44-TQFP Atmel ATMEGA32U4-AU, 8bit AVR Microcontroller, 16MHz, 1 kB, 32 kB Flash, 44-Pin TQFP" H 8800 2200 50  0001 L CNN "Description"
F 5 "1.2" H 8800 2100 50  0001 L CNN "Height"
F 6 "556-ATMEGA32U4-AU" H 8800 2000 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Microchip-Technology-Atmel/ATMEGA32U4-AU?qs=SSucg2PyLi7mKWjHIsNJ3w%3D%3D" H 8800 1900 50  0001 L CNN "Mouser Price/Stock"
F 8 "Microchip" H 8800 1800 50  0001 L CNN "Manufacturer_Name"
F 9 "ATMEGA32U4-AU" H 8800 1700 50  0001 L CNN "Manufacturer_Part_Number"
	1    5750 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 2700 2950 2700
Connection ~ 2700 2700
Text GLabel 8050 2750 0    50   Input ~ 0
SDA
Text GLabel 8050 2850 0    50   Input ~ 0
SCL
NoConn ~ 8050 2950
Text GLabel 2950 3300 0    50   Input ~ 0
SDA
Text GLabel 2950 3200 0    50   Input ~ 0
SCL
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 6400ACF0
P 4950 4850
F 0 "JP2" H 4950 5055 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 4950 4964 50  0000 C CNN
F 2 "SolderJumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4950 4850 50  0001 C CNN
F 3 "~" H 4950 4850 50  0001 C CNN
	1    4950 4850
	0    -1   -1   0   
$EndComp
$Comp
L CSP-USC16-TR:CSP-USC16-TR J1
U 1 1 6400B71E
P 1600 1800
F 0 "J1" H 1600 2467 50  0000 C CNN
F 1 "CSP-USC16-TR" H 1600 2376 50  0000 C CNN
F 2 "CSP-USC16-TR:VALCON_CSP-USC16-TR-Fixed" H 1600 1800 50  0001 L BNN
F 3 "" H 1600 1800 50  0001 L BNN
F 4 "A0" H 1600 1800 50  0001 L BNN "PARTREV"
F 5 "3.26mm" H 1600 1800 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "Manufacturer recommendations" H 1600 1800 50  0001 L BNN "STANDARD"
F 7 "VALCON" H 1600 1800 50  0001 L BNN "MANUFACTURER"
	1    1600 1800
	1    0    0    -1  
$EndComp
Text GLabel 900  1900 0    50   Input ~ 0
GND
Text GLabel 900  1400 0    50   Input ~ 0
VCC
NoConn ~ 2300 1500
NoConn ~ 900  1500
NoConn ~ 900  1800
NoConn ~ 2300 1800
Wire Wire Line
	2500 2700 2500 2550
Wire Wire Line
	2500 2700 2700 2700
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 640177ED
P 2000 2700
F 0 "JP1" H 2000 2905 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 2000 2814 50  0000 C CNN
F 2 "SolderJumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2000 2700 50  0001 C CNN
F 3 "~" H 2000 2700 50  0001 C CNN
	1    2000 2700
	1    0    0    -1  
$EndComp
Connection ~ 2500 2700
Wire Wire Line
	2500 2700 2150 2700
Text GLabel 1850 2700 0    50   Input ~ 0
OLED_RST
$Comp
L Connector:Conn_01x06_Female J2
U 1 1 6401BFFF
P 8250 3500
F 0 "J2" H 8278 3476 50  0000 L CNN
F 1 "Conn_01x06_Female" H 8278 3385 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x03_P2.54mm_Vertical" H 8250 3500 50  0001 C CNN
F 3 "~" H 8250 3500 50  0001 C CNN
	1    8250 3500
	1    0    0    -1  
$EndComp
Text GLabel 6200 1400 2    50   Input ~ 0
VCC
Wire Wire Line
	5250 750  5200 750 
Wire Wire Line
	5200 750  5200 650 
Wire Wire Line
	5250 750  5250 1500
Wire Wire Line
	5500 650  5500 750 
Wire Wire Line
	5500 750  5350 750 
Wire Wire Line
	5350 750  5350 1500
Wire Wire Line
	5500 650  5700 650 
Connection ~ 5500 650 
Wire Wire Line
	6200 1400 5650 1400
Wire Wire Line
	5650 1400 5650 1500
Text GLabel 2950 2800 0    50   Input ~ 0
VCC
Text GLabel 2950 2900 0    50   Input ~ 0
GND
Text GLabel 4850 4700 3    50   Input ~ 0
VCC
Text GLabel 6850 2600 2    50   Input ~ 0
VCC
Text GLabel 6850 3600 2    50   Input ~ 0
VCC
Text GLabel 4750 4700 3    50   Input ~ 0
GND
Text GLabel 6850 3500 2    50   Input ~ 0
GND
Text GLabel 6850 2700 2    50   Input ~ 0
GND
Text GLabel 6850 2800 2    50   Input ~ 0
VCC
$Comp
L Switch:SW_Push SW1
U 1 1 6403E638
P 7500 2050
F 0 "SW1" H 7500 2335 50  0000 C CNN
F 1 "SW_Push" H 7500 2244 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 7500 2250 50  0001 C CNN
F 3 "~" H 7500 2250 50  0001 C CNN
	1    7500 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 64041E6E
P 7800 1700
F 0 "R5" V 7593 1700 50  0000 C CNN
F 1 "1K" V 7684 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7730 1700 50  0001 C CNN
F 3 "~" H 7800 1700 50  0001 C CNN
	1    7800 1700
	-1   0    0    1   
$EndComp
Text GLabel 7300 2050 0    50   Input ~ 0
GND
Text GLabel 7800 1550 1    50   Input ~ 0
VCC
Text GLabel 5050 4700 3    50   Input ~ 0
btnInput
Text GLabel 7900 2050 2    50   Input ~ 0
btnInput
Wire Wire Line
	7800 1850 7800 2050
Wire Wire Line
	7800 2050 7900 2050
Wire Wire Line
	7800 2050 7700 2050
Connection ~ 7800 2050
Text GLabel 9000 5000 3    50   Input ~ 0
GND
Text GLabel 9000 4400 1    50   Input ~ 0
VCC
Text GLabel 5150 4700 3    50   Input ~ 0
LED
Text GLabel 8200 4700 0    50   Input ~ 0
LED
$Comp
L Device:C C4
U 1 1 640B5B5C
P 8500 4700
F 0 "C4" V 8248 4700 50  0000 C CNN
F 1 "0.1uF" V 8339 4700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8538 4550 50  0001 C CNN
F 3 "~" H 8500 4700 50  0001 C CNN
	1    8500 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 4700 8200 4700
Wire Wire Line
	9000 4400 8500 4400
Wire Wire Line
	8500 4400 8500 4550
Wire Wire Line
	9000 5000 8500 5000
Wire Wire Line
	8500 5000 8500 4850
$Comp
L LED:SK6812 D1
U 1 1 640C2C5E
P 9000 4700
F 0 "D1" H 9344 4746 50  0000 L CNN
F 1 "SK6812" H 9344 4655 50  0000 L CNN
F 2 "SK6812MINI:LED-3535" H 9050 4400 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 9100 4325 50  0001 L TNN
	1    9000 4700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
