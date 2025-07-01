import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String status = '';

  Future<void> _register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      setState(() => status = '❌ Les mots de passe ne correspondent pas');
      return;
    }

    setState(() => status = '📝 Inscription en cours...');

    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final idToken = await userCredential.user?.getIdToken();

      if (idToken != null) {
        final success = await AuthService.sendRegistrationToBackend(idToken);
        // Pas de nom pour le moment
        if (success) {
          setState(() => status = '✅ Inscrit et validé avec le backend !');
        } else {
          setState(() => status = '❌ Backend a échoué à sauvegarder');
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
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(labelText: 'Mot de passe'),
          obscureText: true,
        ),
        TextField(
          controller: confirmPasswordController,
          decoration: const InputDecoration(labelText: 'Confirmer le mot de passe'),
          obscureText: true,
        ),
        ElevatedButton(onPressed: _register, child: const Text("S'inscrire")),
        const SizedBox(height: 10),
        Text(status, textAlign: TextAlign.center),
      ],
    );
  }
}
