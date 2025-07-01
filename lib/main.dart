
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connexion Firebase',
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String status = "Non connecté";
  bool isSigningIn = false;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController smsCodeController = TextEditingController();
  String? verificationId;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signInWithGoogle() async {
    if (isSigningIn) return;

    setState(() {
      isSigningIn = true;
      status = "Connexion avec Google...";
    });

    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      final idToken = await userCredential.user?.getIdToken();

      if (idToken != null) {
        final backendResponse = await testerConnexionBackend(idToken);
        if (backendResponse) {
          setState(() {
            status = "✅ Connecté avec Google 🎉";
          });
        } else {
          await FirebaseAuth.instance.signOut();
          setState(() {
            status = "❌ Échec vérification backend";
          });
        }
      }
    } catch (e) {
      setState(() {
        status = "❌ Erreur Google : $e";
      });
    } finally {
      setState(() {
        isSigningIn = false;
      });
    }
  }

  Future<void> signInWithEmailPassword() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() => status = "❌ Entrez un email et un mot de passe.");
      return;
    }

    setState(() => status = "🔐 Connexion en cours...");

    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final idToken = await userCredential.user?.getIdToken();

      if (idToken != null) {
        final backendResponse = await testerConnexionBackend(idToken);
        if (backendResponse) {
          setState(() {
            status = "✅ Connecté avec Email 🎉";
          });
        } else {
          await FirebaseAuth.instance.signOut();
          setState(() {
            status = "❌ Échec vérification backend";
          });
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() => status = "❌ Aucun compte avec cet email.");
      } else if (e.code == 'wrong-password') {
        setState(() => status = "❌ Mot de passe incorrect.");
      } else {
        setState(() => status = "❌ Erreur : ${e.message}");
      }
    } catch (e) {
      setState(() => status = "❌ Erreur inconnue : $e");
    }
  }

  Future<bool> testerConnexionBackend(String idToken) async {
    final url = Uri.parse("http://10.0.2.2:32769/api/auth/verify");
    print("⏳ test de connexion backend lancé avec token : $idToken");

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $idToken',
        },
      );

      print("🛰️ Réponse brute du backend : ${response.statusCode} - ${response.body}");

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("❌ Erreur appel backend : $e");
      return false;
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    smsCodeController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connexion Firebase")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: isSigningIn ? null : signInWithGoogle,
              child: isSigningIn
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
                  : const Text("Se connecter avec Google"),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: '📧 Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: '🔑 Mot de passe',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: signInWithEmailPassword,
              child: const Text("Connexion Email/Mot de passe"),
            ),
            const SizedBox(height: 30),
            Text(
              status,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
