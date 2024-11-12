import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import '../Provider/auth.dart' as myAuth;

class LoginPage extends StatelessWidget {
  final myAuth.Auth auth = myAuth.Auth();

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Monitoring GreenHouse',
      onLogin: _authenticateUser,
      onSignup: _registerUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacementNamed('/Monitoring');
      },
      theme: LoginTheme(
        primaryColor: const Color.fromARGB(255, 37, 131, 24),
        accentColor: const Color.fromARGB(255, 235, 230, 230),
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
