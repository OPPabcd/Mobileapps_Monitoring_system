import 'package:flutter/material.dart';
// import 'auth_page.dart';

class Awal extends StatelessWidget {
  const Awal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/Logo2.png', // Path gambar
              width: 300, // Lebar gambar
              height: 300, // Tinggi gambar
            ),
            const SizedBox(height: 5),
            // const Text(
            //   'Welcome To GreenHouse',
            //   style: TextStyle(
            //     fontSize: 20,
            //     color: Color.fromARGB(255, 64, 72, 64),
            //   ),
            // ),
            // const SizedBox(height: 3),
            // const Text(
            //   'TKK 23',
            //   style: TextStyle(
            //     fontSize: 20,
            //     color: Color.fromARGB(255, 64, 72, 64),
            //   ),
            // ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/auth_page');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 49, 186, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Get In',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              'lib/assets/background.png', // Path gambar
              width: 300, // Lebar gambar
              height: 300, // Tinggi gambar
            ),
          ],
        ),
      ),
    );
  }
}
