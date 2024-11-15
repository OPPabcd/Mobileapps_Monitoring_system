#include <DHT.h>
#include <ArduinoJson.h>
#include <SoftwareSerial.h>

#define LDR_PIN A0
#define SOIL_PIN A1
#define DHT_PIN 2
#define DHT_TYPE DHT11  // Bisa juga DHT22 atau lainnya

DHT dht(DHT_PIN, DHT_TYPE);
SoftwareSerial espSerial(10, 11); // RX, TX ke ESP8266

void setup() {
  Serial.begin(9600);
  espSerial.begin(9600);  // Harus disesuaikan dengan baud rate ESP8266
  dht.begin();
}

void loop() {
  // Membaca data dari sensor dan membulatkan hasilnya
  int cahaya = round((analogRead(LDR_PIN) / 1023.0) * 100.0);
  int soilMoisture = round(100.00 - ((analogRead(SOIL_PIN) / 1023.00) * 100.0));
  float temp = dht.readTemperature();
  float hum = dht.readHumidity();

  // Mengecek apakah pembacaan data dari DHT berhasil
  if (isnan(temp) || isnan(hum)) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  }

  // Membuat JSON data
  StaticJsonDocument<200> jsonDoc;
  jsonDoc["cahaya"] = cahaya;
  jsonDoc["soil"] = soilMoisture;
  jsonDoc["temperature"] = temp;
  jsonDoc["humidity"] = hum;

  // Mengubah JSON menjadi string
  String jsonString;
  serializeJson(jsonDoc, jsonString);

  // Menampilkan data JSON di Serial Monitor
  Serial.print("JSON data: ");
  Serial.println(jsonString);

  // Mengirimkan JSON ke ESP8266
  espSerial.println(jsonString);
  
  // Delay sebelum membaca lagi
  delay(2000);  // Menyesuaikan interval pembacaan
}
