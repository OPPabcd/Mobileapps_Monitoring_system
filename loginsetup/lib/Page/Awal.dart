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
            //   'Green House',
            //   style: TextStyle(
            //     fontSize: 50,
            //     color: Colors.green,
            //   ),
            // ),
            // const SizedBox(height: 5),
            // const Text(
            //   'TKK 23',
            //   style: TextStyle(
            //     fontSize: 30,
            //     color: Colors.green,
            //   ),
            // ),
            // const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/auth_page');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                'Get In',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
