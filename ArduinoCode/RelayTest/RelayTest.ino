// Relay for the heater power circuit
const int heater = 8;

void setup() {
  pinMode(heater, OUTPUT);
  Serial.begin(115200);
  while (!Serial) delay(10);
  Serial.println("Starting to test the relay!"); 
}

void loop() {
  Serial.println("Heater ON");
  digitalWrite(heater, LOW);
  delay(1000);
  digitalWrite(heater, HIGH);
  delay(1000);
}
