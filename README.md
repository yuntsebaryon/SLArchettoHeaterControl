SLArchetto Heater Control
=========================

### Gas heater control: 2023.5.15

- Solid state relay status:
    - close the circuit: the heater power on, the light is on, and the relay status is 1 (true)
    - open the circuit: the heater power off the light is off, and the relay status is 0 (false)
- The `relay status` is defined in the arduino code, `ArduinoCode/GasHeaterControl/GasHeaterControl.ino`
