import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'Monitoring.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataHistory(),
    );
  }
}

class DataHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 120,
              color: const Color.fromARGB(211, 19, 97, 42),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Setting",
                style: TextStyle(
                    color: Color.fromARGB(255, 247, 249, 250), fontSize: 25),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Monitoring(),
                  ),
                );
              },
              leading: Icon(
                Icons.sunny,
                size: 35,
              ),
              title: Text(
                "Monitoring",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => DataHistory(),
                  ),
                );
              },
              leading: Icon(
                Icons.history,
                size: 35,
              ),
              title: Text(
                "Histori",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // )
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              leading: Icon(
                Icons.logout_sharp,
                color: Colors.red,
                size: 35,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('lib/assets/histori.png'), // Path to your image
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color:
                  Colors.black.withOpacity(0.3), // Dark overlay for readability
            ),
          ),
          // Data history overlay
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data History',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  // List of data history
                  DataHistoryList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DataHistoryList extends StatelessWidget {
  final List<Map<String, dynamic>> dataHistory = [
    {
      'day': 'Wednesday',
      'date': '17/10/2023',
      'temp': '25°C',
      'humidity': '50%',
      'light': '60%',
      'soilMoisture': '50%',
    },
    {
      'day': 'Thursday',
      'date': '18/10/2023',
      'temp': '30°C',
      'humidity': '75%',
      'light': '60%',
      'soilMoisture': '60%',
    },
    {
      'day': 'Friday',
      'date': '19/10/2023',
      'temp': '32°C',
      'humidity': '76%',
      'light': '60%',
      'soilMoisture': '65%',
    },
    {
      'day': 'Saturday',
      'date': '20/10/2023',
      'temp': '27°C',
      'humidity': '62%',
      'light': '60%',
      'soilMoisture': '55%',
    },
    {
      'day': 'Sunday',
      'date': '21/10/2023',
      'temp': '30°C',
      'humidity': '70%',
      'light': '60%',
      'soilMoisture': '62%',
    },
    {
      'day': 'Monday',
      'date': '22/10/2023',
      'temp': '31°C',
      'humidity': '60%',
      'light': '60%',
      'soilMoisture': '55%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dataHistory.map((data) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['day'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data['date'],
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      data['temp'],
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      data['humidity'],
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      data['light'],
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      data['soilMoisture'],
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
