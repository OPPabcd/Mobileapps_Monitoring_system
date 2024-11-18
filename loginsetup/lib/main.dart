import 'package:flutter/material.dart';
import 'package:loginsetup/Page/Awal.dart';
import 'package:loginsetup/Page/auth_page.dart';
import 'package:loginsetup/Page/Monitoring.dart';
// import 'package:loginsetup/Page/Setting.dart';
import 'package:loginsetup/Page/DataHistory.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 61, 59, 59),
      ),
      home: Awal(),
      routes: {
        '/Awal': (context) => Awal(),
        '/auth_page': (context) => LoginPage(),
        '/Monitoring': (context) => Monitoring(),
        // '/Setting': (context) => Setting(),
        '/DataHistory': (context) => DataHistory()
      },
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 61, 59, 59),
//       appBar: AppBar(
//         title: Text(
//           'Home',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Color.fromARGB(255, 61, 59, 59),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Tambahkan gambar di sini
//             Image.asset(
//               'lib/assets/logo.png', // Path gambar
//               height: 300, // Ukuran gambar
//             ),
//             SizedBox(height: 20), // Jarak antara gambar dan teks
//             Text(
//               'Welcome to Home Page!',
//               style: TextStyle(
//                   fontSize: 18, color: const Color.fromARGB(255, 29, 165, 11)),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/Monitoring');
//               },
//               child: Text('Go to Control Page'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange,
//                 foregroundColor: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
