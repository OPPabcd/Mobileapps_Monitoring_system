import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'Monitoring.dart';
import '../Provider/auth.dart' as myAuth;

class LoginPage extends StatelessWidget {
  final myAuth.Auth auth = myAuth.Auth();

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      logo: "lib/assets/logo2.png",
      title: 'Monitoring GreenHouse',
      onLogin: _authenticateUser,
      onSignup: _registerUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Monitoring(),
          ),
        );
      },
      theme: LoginTheme(
        primaryColor: const Color.fromARGB(255, 91, 91, 91),
        accentColor: const Color.fromARGB(255, 255, 255, 255),
        titleStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 231, 242, 231),
        ),
        buttonTheme: LoginButtonTheme(
          backgroundColor: const Color.fromARGB(255, 7, 92, 7),
          highlightColor: const Color.fromARGB(255, 25, 158, 94),
          elevation: 5.0,
        ),
      ),
    );
  }

  Future<String?> _authenticateUser(LoginData data) async {
    try {
      await auth.login(data.name, data.password);
      return null;
    } catch (error) {
      return 'Login gagal: ${error.toString()}';
    }
  }

  Future<String?> _registerUser(SignupData data) async {
    final String email = data.name ?? '';
    final String password = data.password ?? '';
    try {
      await auth.signup(email, password);
      return null;
    } catch (error) {
      return 'Registrasi gagal: ${error.toString()}';
    }
  }

  Future<String?> _recoverPassword(String email) async {
    return 'Fitur pemulihan kata sandi belum diimplementasikan';
  }
}
