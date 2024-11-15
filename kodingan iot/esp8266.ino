#include <ESP8266WiFi.h>
#include <Firebase_ESP_Client.h>
#include <ArduinoJson.h>
#include <time.h>

// Konfigurasi WiFi
const char* ssid = "neko";
const char* password = "memew919";

// Konfigurasi Firebase
#define DATABASE_URL "https://tkkmobile-7a7f3-default-rtdb.asia-southeast1.firebasedatabase.app" // Ganti dengan URL Firebase Anda
#define API_KEY "AIzaSyD-DbanHO4EerHsEI61buLiA1YLfz8yNMc" // Ganti dengan API key Firebase Anda
#define USER_EMAIL "user1@gmail.com" // Ganti dengan email Firebase Anda
#define USER_PASSWORD "123456"      // Ganti dengan password Firebase Anda

FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;
bool isAuthenticated = false;

// NTP server details
const char* ntpServer = "pool.ntp.org";
const long gmtOffset_sec = 3600 * 7; // GMT+7 for WITA
const int daylightOffset_sec = 0;

// Fungsi koneksi WiFi
void connectToWiFi() {
  WiFi.begin(ssid, password);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(".");
  }
  Serial.println("\nConnected to Wi-Fi");
}

// Fungsi login Firebase
void loginToFirebase() {
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  config.api_key = API_KEY;
  config.database_url = DATABASE_URL;

  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);

  if (Firebase.ready()) {
    Serial.println("Login to Firebase successful.");
    isAuthenticated = true;
  } else {
    Serial.println("Login to Firebase failed.");
    Serial.println("Error: " + String(config.signer.tokens.error.message.c_str()));
  }
}

// Setup NTP untuk timestamp
void setupNTP() {
  configTime(gmtOffset_sec, daylightOffset_sec, ntpServer); // NTP servers
  Serial.println("NTP initialized.");
}

// Mendapatkan waktu yang diformat
String getFormattedTime() {
  struct tm timeInfo;
  if (!getLocalTime(&timeInfo)) {
    Serial.println("Failed to obtain time");
    return "";
  }

  char timeString[50];
  strftime(timeString, sizeof(timeString), "%Y-%m-%d %H:%M:%S", &timeInfo);
  return String(timeString);
}

void setup() {
  Serial.begin(9600);
  Serial1.begin(9600); // Serial1 untuk komunikasi dengan Arduino
  Serial.println("Initializing ESP8266...");

  connectToWiFi();
  loginToFirebase();
  setupNTP();
}

void loop() {
  Serial.println(Serial.available());  // Untuk debugging, melihat jumlah data yang diterima
  
  if (isAuthenticated && Serial.available()) {
    String jsonData = Serial.readStringUntil('\n'); 
    Serial.println("Data received: " + jsonData);

    // Debugging: Menampilkan JSON yang diterima
    Serial.println("Raw JSON: " + jsonData);

    // Menghapus awalan "JSON data: " jika ada
    if (jsonData.startsWith("JSON data: ")) {
      jsonData = jsonData.substring(11);  // Memotong awalan "JSON data: "
    }

    // Parsing JSON dari Arduino menggunakan ArduinoJson
    StaticJsonDocument<200> doc;
    DeserializationError error = deserializeJson(doc, jsonData);

    if (error) {
      Serial.print("Failed to parse JSON: ");
      Serial.println(error.c_str());
      return;
    }

    // Menambahkan timestamp ke JSON
    FirebaseJson json;
    String formattedTime = getFormattedTime(); 
    json.setJsonData(jsonData);  // Menyimpan data JSON yang sudah diparsing
    json.add("timestamp", formattedTime);  // Menambahkan timestamp

    // Mengirim data ke Firebase
    if (Firebase.RTDB.pushJSON(&fbdo, "/sensorData", &json)) {
      Serial.println("Data successfully sent to Firebase.");
    } else {
      Serial.println("Failed to send data to Firebase.");
      Serial.print("Error: ");
      Serial.println(fbdo.errorReason());
    }
  }

  delay(30000);  // Interval pengiriman data
}
