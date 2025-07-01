import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/auth_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); // ← obligatoire pour attendre l'initialisation
  await Firebase.initializeApp(); // ← initialise Firebase
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon App Auth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // joli thème sombre pour ressembler à Vue
      home: const AuthScreen(),
    );
  }
}
