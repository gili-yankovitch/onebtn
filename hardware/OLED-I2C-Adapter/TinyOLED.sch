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
NoConn ~ 7250 2350
NoConn ~ 7250 2450
NoConn ~ 7250 2550
NoConn ~ 7250 2650
Text GLabel 7150 3850 0    50   Input ~ 0
VCC
NoConn ~ 7250 3750
Text GLabel 7150 3650 0    50   Input ~ 0
SDAout
Text GLabel 7150 3550 0    50   Input ~ 0
SDAin
Text GLabel 7150 3450 0    50   Input ~ 0
SCL
Wire Wire Line
	7250 3550 7200 3550
Wire Wire Line
	7250 3850 7200 3850
Wire Wire Line
	7200 3850 7200 3800
Wire Wire Line
	7200 3850 7150 3850
Connection ~ 7200 3850
Wire Wire Line
	7200 3550 7150 3550
Connection ~ 7200 3550
Wire Wire Line
	7200 3800 8150 3800
Wire Wire Line
	7250 3650 7200 3650
Wire Wire Line
	7200 3650 7200 3550
Wire Wire Line
	7200 3650 7150 3650
Connection ~ 7200 3650
Wire Wire Line
	7250 3350 7150 3350
Text GLabel 7150 3350 0    50   Input ~ 0
GND
Wire Wire Line
	7250 3250 7150 3250
Text GLabel 7150 3250 0    50   Input ~ 0
RES
Wire Wire Line
	7250 3150 7150 3150
Text GLabel 7150 3150 0    50   Input ~ 0
GND
Wire Wire Line
	7250 3050 7200 3050
Wire Wire Line
	7200 3050 7200 3000
Wire Wire Line
	7200 3000 8150 3000
Wire Wire Line
	7250 2950 7200 2950
Wire Wire Line
	7200 2950 7200 2900
Wire Wire Line
	7200 2900 8150 2900
Wire Wire Line
	8150 2900 8150 3000
Connection ~ 8150 3000
Wire Wire Line
	7250 2850 7150 2850
Text GLabel 7150 2850 0    50   Input ~ 0
GND
Wire Wire Line
	7250 2750 7200 2750
Wire Wire Line
	7200 2750 7200 2700
Wire Wire Line
	7200 2700 8150 2700
Wire Wire Line
	8150 2700 8150 2900
Connection ~ 8150 2900
Text GLabel 6450 2850 2    50   Input ~ 0
GND
Text GLabel 6450 2750 2    50   Input ~ 0
VCC
Text GLabel 6450 2950 2    50   Input ~ 0
RES
$Comp
L NFP1306-82:FFC-8 U1
U 1 1 63CC8477
P 6350 3200
F 0 "U1" V 7015 3192 50  0000 C CNN
F 1 "FFC-8" V 6924 3192 50  0000 C CNN
F 2 "OLED-0.65Pitch-16Pins:OLED-0.8Pitch-8Pins-Effective-Connector" H 6350 3200 50  0001 C CNN
F 3 "" H 6350 3200 50  0001 C CNN
	1    6350 3200
	0    -1   -1   0   
$EndComp
$Comp
L NFP1306-82:NFP1306-82 U2
U 1 1 63C2D95F
P 7250 3100
F 0 "U2" V 7199 3578 50  0000 L CNN
F 1 "NFP1306-82" V 7290 3578 50  0000 L CNN
F 2 "OLED-0.65Pitch-16Pins:OLED-0.65Pitch-16Pins" H 7250 3100 50  0001 C CNN
F 3 "" H 7250 3100 50  0001 C CNN
	1    7250 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 3450 7250 3450
Wire Wire Line
	8150 3000 8150 3800
Text GLabel 6450 3050 2    50   Input ~ 0
SDAin
Text GLabel 6450 3150 2    50   Input ~ 0
SCL
NoConn ~ 6450 3250
NoConn ~ 6450 3350
NoConn ~ 6450 3450
$EndSCHEMATC
