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
              'lib/assets/Logo2.png',
              width: 300,
              height: 300,
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
            Row(
              mainAxisSize: MainAxisSize
                  .min, // Mengatur agar Row menyesuaikan dengan child
              children: [
                // Gambar kiri dengan opasitas dan geser ke kiri
                Transform.rotate(
                  angle: -750, // Sudut rotasi dalam radian
                  child: Transform.translate(
                    offset: Offset(0.5, -0.866),
                    child: Opacity(
                      opacity: 0.2,
                      child: Image.asset(
                        'lib/assets/icon.png',
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/auth_page');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 49, 186, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: const Text(
                    'Get In',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Transform.rotate(
                  angle: 1100,
                  child: Transform.translate(
                    offset: Offset(-0.866, 0.5),
                    child: Opacity(
                      opacity: 0.2,
                      child: Image.asset(
                        'lib/assets/icon.png',
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Image.asset(
              'lib/assets/background.png',
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
