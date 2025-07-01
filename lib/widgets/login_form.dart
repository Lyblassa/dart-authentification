import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String status = '';

  Future<void> _login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    setState(() => status = '🔐 Connexion en cours...');

    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final idToken = await userCredential.user?.getIdToken();

      if (idToken != null) {
        final success = await AuthService.verifyWithBackend(idToken);
        if (success) {
          setState(() => status = '✅ Connecté');
        } else {
          await FirebaseAuth.instance.signOut();
          setState(() => status = '❌ Échec vérification backend');
        }
      }
    } catch (e) {
      setState(() => status = '❌ Erreur : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
        TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Mot de passe'), obscureText: true),
        ElevatedButton(onPressed: _login, child: const Text("Se connecter")),
        const SizedBox(height: 10),
        Text(status, textAlign: TextAlign.center),
      ],
    );
  }
}
