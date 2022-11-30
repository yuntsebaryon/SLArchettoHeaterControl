EESchema Schematic File Version 5
EELAYER 36 0
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
Comment5 ""
Comment6 ""
Comment7 ""
Comment8 ""
Comment9 ""
$EndDescr
Connection ~ 4100 4250
Connection ~ 4100 5550
Wire Wire Line
	1650 5300 1650 5550
Wire Wire Line
	1650 5550 4100 5550
Wire Wire Line
	1850 4150 1850 4900
Wire Wire Line
	1850 4150 2250 4150
Wire Wire Line
	2550 4150 3050 4150
Wire Wire Line
	3450 4250 4100 4250
Wire Wire Line
	4100 4250 4100 4700
Wire Wire Line
	4100 4250 6500 4250
Wire Wire Line
	4100 5000 4100 5550
Wire Wire Line
	4100 5550 10700 5550
Wire Wire Line
	6200 2850 6200 3250
Wire Wire Line
	6200 3450 6200 3850
Wire Wire Line
	6200 3850 6500 3850
Wire Wire Line
	7300 3850 7750 3850
Wire Wire Line
	7300 4350 9400 4350
Wire Wire Line
	7750 2850 7750 3850
Wire Wire Line
	8200 2650 8250 2650
Wire Wire Line
	9700 4350 10700 4350
Wire Wire Line
	10700 5550 10700 4350
Wire Notes Line
	1000 3050 1000 5950
Wire Notes Line
	1000 5950 7950 5950
Wire Notes Line
	5650 2000 5650 2050
Wire Notes Line
	5650 2050 5650 2850
Wire Notes Line
	5650 2850 8200 2850
Wire Notes Line
	7950 3050 1000 3050
Wire Notes Line
	7950 5950 7950 3050
Wire Notes Line
	8200 2000 5650 2000
Wire Notes Line
	8200 2850 8200 2000
Text Notes 1300 3400 0    79   ~ 0
Electrical Box
Text Notes 6100 2750 0    50   ~ 0
Digital 8
Text Notes 6650 2500 0    50   ~ 0
Arduino Uno
Text Notes 7400 7250 0    50   ~ 0
Gas Heater Control
Text Notes 7400 7500 0    50   ~ 0
Gas Heater Control Circuit
Text Notes 7700 2750 0    50   ~ 0
GND
Text Notes 8150 7650 0    50   ~ 0
11/20/2022
Text Notes 10600 7650 0    50   ~ 0
1
$Comp
L power:Earth #PWR?
U 1 1 00000000
P 8250 2650
F 0 "#PWR?" H 8250 2400 50  0001 C CNN
F 1 "Earth" H 8250 2500 50  0001 C CNN
F 2 "" H 8250 2650 50  0001 C CNN
F 3 "~" H 8250 2650 50  0001 C CNN
	1    8250 2650
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse F0
U 1 1 60D1AD78
P 2400 4150
AR Path="/60D1AD78" Ref="F0"  Part="1" 
AR Path="/60D1AD78" Ref="F0"  Part="1" 
F 0 "F0" V 2203 4150 50  0000 C CNN
F 1 "Fuse" V 2294 4150 50  0000 C CNN
F 2 "" V 2330 4150 50  0001 C CNN
F 3 "250VAC/10A" V 2518 4150 50  0000 C CNN
F 4 "I" H 2400 4150 50  0001 C CNN "Spice_Primitive"
F 5 "ac 250" H 2400 4150 50  0001 C CNN "Spice_Model"
F 6 "Y" H 2400 4150 50  0001 C CNN "Spice_Netlist_Enabled"
	1    2400 4150
	0    1    1    0   
$EndComp
$Comp
L Device:Heater R12
U 1 1 60D38C69
P 9550 4350
AR Path="/60D38C69" Ref="R12"  Part="1" 
AR Path="/60D38C69" Ref="R1"  Part="1" 
F 0 "R1" V 9343 4350 50  0000 C CNN
F 1 "Heater" V 9434 4350 50  0000 C CNN
F 2 "" V 9480 4350 50  0001 C CNN
F 3 "120V/1200W" V 9668 4350 50  0000 C CNN
	1    9550 4350
	0    1    1    0   
$EndComp
$Comp
L power:+VDC 5V
U 1 1 00000000
P 6200 3450
F 0 "5V" H 6200 3350 50  0000 C CNN
F 1 "+VDC" H 6200 3750 50  0000 C CNN
F 2 "" H 6200 3450 50  0001 C CNN
F 3 "" H 6200 3450 50  0001 C CNN
	1    6200 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC 5V
U 1 1 00000000
P 8200 2250
F 0 "5V" V 8200 2150 50  0000 C CNN
F 1 "+VDC" V 8200 2500 50  0000 L CNN
F 2 "" H 8200 2250 50  0001 C CNN
F 3 "" H 8200 2250 50  0001 C CNN
	1    8200 2250
	0    1    1    0   
$EndComp
$Comp
L Device:LED D0
U 1 1 60D3A87C
P 4100 4850
AR Path="/60D3A87C" Ref="D0"  Part="1" 
AR Path="/60D3A87C" Ref="D0"  Part="1" 
F 0 "D0" V 4139 4732 50  0000 R CNN
F 1 "LED" V 4048 4732 50  0000 R CNN
F 2 "" H 4100 4850 50  0001 C CNN
F 3 "~" H 4100 4850 50  0001 C CNN
	1    4100 4850
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_SPDT SW0
U 1 1 60D37B27
P 3250 4150
AR Path="/60D37B27" Ref="SW0"  Part="1" 
AR Path="/60D37B27" Ref="SW0"  Part="1" 
F 0 "SW0" H 3250 4435 50  0000 C CNN
F 1 "SW_SPDT" H 3250 4344 50  0000 C CNN
F 2 "" H 3250 4150 50  0001 C CNN
F 3 "~" H 3250 4150 50  0001 C CNN
	1    3250 4150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_WallPlug_Earth P0
U 1 1 60D5CCAF
P 1550 5000
AR Path="/60D5CCAF" Ref="P0"  Part="1" 
AR Path="/60D5CCAF" Ref="P0"  Part="1" 
F 0 "P0" H 1617 5325 50  0000 C CNN
F 1 "Conn_WallPlug_Earth" H 1617 5234 50  0000 C CNN
F 2 "" H 1950 5000 50  0001 C CNN
F 3 "~" H 1950 5000 50  0001 C CNN
	1    1550 5000
	1    0    0    -1  
$EndComp
$Comp
L Relay:RAYEX-L90 K1
U 1 1 60D238E6
P 6900 4050
AR Path="/60D238E6" Ref="K1"  Part="1" 
AR Path="/60D238E6" Ref="K1"  Part="1" 
F 0 "K1" V 6333 4050 50  0000 C CNN
F 1 "Finder 46.61.9.024.0040" V 6424 4050 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_RAYEX-L90" H 7350 4000 50  0001 L CNN
F 3 "https://a3.sofastcdn.com/attachment/7jioKBjnRiiSrjrjknRiwS77gwbf3zmp/L90-SERIES.pdf" H 7250 5050 50  0001 L CNN
	1    6900 4050
	0    1    1    0   
$EndComp
$EndSCHEMATC
