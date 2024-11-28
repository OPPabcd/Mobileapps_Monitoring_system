import 'package:auth_flutter/firebase_options.dart';
import 'package:auth_flutter/page_auth/Awal.dart';
import 'package:auth_flutter/page_auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

      return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Awal(),
      
      routes: {
        '/Awal': (context) => const Awal(),
        '/login': (context) => const Login(),
        // '/Monitoring': (context) => Monitoring(),
        // '/DataHistory': (context) => DataHistory()
      },
      
    );
  }
}


