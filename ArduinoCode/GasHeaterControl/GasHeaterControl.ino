// Basic example using one-shot measurement.
// The call to readThermocoupleTemperature() is blocking for O(100ms)

// Update: Yun-Tse Tsai
// Date: 2022.12.8
// Add the modbus

// Ethernet libraries
#include <SPI.h>
#include <Ethernet.h>

#include <ArduinoRS485.h> // ArduinoModbus depends on the ArduinoRS485 library
#include <ArduinoModbus.h>

// Adafruit library
#include <Adafruit_MAX31856.h>

// Set up MAC address and IP
byte mac[] = {0xB2, 0x07, 0xD5, 0xEB, 0xAD, 0xE3};
IPAddress ip(172, 21, 103, 34);
IPAddress netmask(255, 255, 254, 0);
IPAddress gateway(172, 21, 102, 1);

EthernetServer ethServer(502);
ModbusTCPServer modbusTCPServer;

// Use software SPI: CS, DI, DO, CLK
Adafruit_MAX31856 maxthermo = Adafruit_MAX31856(13, 12, 11, 10);
// use hardware SPI, just pass in the CS pin
//Adafruit_MAX31856 maxthermo = Adafruit_MAX31856(10);

// Relay for the heater power circuit
const int heater = 8;

float switchTemp = 40;
uint8_t relayStatus = 0;

void setup() {
  Serial.begin(115200);
  while (!Serial) delay(10);
  Serial.println("MAX31856 thermocouple test");

  maxthermo.begin();

  maxthermo.setThermocoupleType(MAX31856_TCTYPE_K);

  Serial.print("Thermocouple type: ");
  switch (maxthermo.getThermocoupleType() ) {
    case MAX31856_TCTYPE_B: Serial.println("B Type"); break;
    case MAX31856_TCTYPE_E: Serial.println("E Type"); break;
    case MAX31856_TCTYPE_J: Serial.println("J Type"); break;
    case MAX31856_TCTYPE_K: Serial.println("K Type"); break;
    case MAX31856_TCTYPE_N: Serial.println("N Type"); break;
    case MAX31856_TCTYPE_R: Serial.println("R Type"); break;
    case MAX31856_TCTYPE_S: Serial.println("S Type"); break;
    case MAX31856_TCTYPE_T: Serial.println("T Type"); break;
    case MAX31856_VMODE_G8: Serial.println("Voltage x8 Gain mode"); break;
    case MAX31856_VMODE_G32: Serial.println("Voltage x8 Gain mode"); break;
    default: Serial.println("Unknown"); break;
  }

  // Initialize the pin mode for controlling the solid-state relay
  pinMode(heater, OUTPUT);

  // Set up the ethernet
  Ethernet.begin(mac, ip);
  Ethernet.setSubnetMask(netmask);
  Ethernet.setGatewayIP(gateway);

  // Check for Ethernet hardware present
  if (Ethernet.hardwareStatus() == EthernetNoHardware) {
    Serial.println("Ethernet shield was not found.  Sorry, can't run without hardware. :(");
    while (true) {
      delay(1); // do nothing, no point running without Ethernet hardware
    }
  }
  if (Ethernet.linkStatus() == LinkOFF) {
    Serial.println("Ethernet cable is not connected.");
  }

  Serial.print("My IP address: ");
  Serial.println(Ethernet.localIP());

  // start the server
  ethServer.begin();

  // start the Modbus TCP server
  if (!modbusTCPServer.begin()) {
    Serial.println("Failed to start Modbus TCP Server!");
    while (1);
  }

  // configure input registers at address 0x00

  modbusTCPServer.configureInputRegisters(0x00,4);
  modbusTCPServer.configureHoldingRegisters(0x04,2);
  modbusTCPServer.configureCoils(0x06,2);
  modbusTCPServer.holdingRegisterWrite(4, (uint16_t) (switchTemp*100));
}

void loop() {

  // Read the thermocouple
  Serial.print("Cold Junction Temp: ");
  float CJTTemp = maxthermo.readCJTemperature();
  Serial.println(CJTTemp);

  Serial.print("Thermocouple Temp: ");
  float TCTemp = maxthermo.readThermocoupleTemperature();
  Serial.println(TCTemp);
  
  // Check and print any faults
  uint8_t fault = maxthermo.readFault();
  if (fault) {
    if (fault & MAX31856_FAULT_CJRANGE) Serial.println("Cold Junction Range Fault");
    if (fault & MAX31856_FAULT_TCRANGE) Serial.println("Thermocouple Range Fault");
    if (fault & MAX31856_FAULT_CJHIGH)  Serial.println("Cold Junction High Fault");
    if (fault & MAX31856_FAULT_CJLOW)   Serial.println("Cold Junction Low Fault");
    if (fault & MAX31856_FAULT_TCHIGH)  Serial.println("Thermocouple High Fault");
    if (fault & MAX31856_FAULT_TCLOW)   Serial.println("Thermocouple Low Fault");
    if (fault & MAX31856_FAULT_OVUV)    Serial.println("Over/Under Voltage Fault");
    if (fault & MAX31856_FAULT_OPEN)    Serial.println("Thermocouple Open Fault");
  }

  if ( TCTemp > switchTemp ) {
    digitalWrite(heater, LOW);
    relayStatus = 0;
  } else {
    digitalWrite(heater, HIGH);
    relayStatus = 1;
  }

  // listen for incoming clients
  EthernetClient client = ethServer.available();
  
  if (client) {
    // a new client connected
    Serial.println("new client");

    // let the Modbus TCP accept the connection 
    modbusTCPServer.accept(client);

    if (client.connected()) {
      // poll for Modbus TCP requests, while client connected
      modbusTCPServer.poll();
    }
  }

  modbusTCPServer.inputRegisterWrite(0, (uint16_t) (TCTemp*100));
  modbusTCPServer.inputRegisterWrite(1, (uint16_t) (CJTTemp*100));
  switchTemp = (float)modbusTCPServer.holdingRegisterRead(4)/100;
  // Serial.print("Switch temperature: ");
  // Serial.println(switchTemp);
  modbusTCPServer.coilWrite(6, relayStatus);

  delay(1000);
}
