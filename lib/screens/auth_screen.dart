import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF8F9FC,
      ), // ton fond gris très clair ICI !
      body: const LoginForm(), // PAS de Scaffold interne ici
    );
  }
}
