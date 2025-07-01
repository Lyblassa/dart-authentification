import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../services/auth_service.dart';
import 'login_form.dart';
import 'register_form.dart';
import 'social_auth_button.dart';

class AuthBox extends StatefulWidget {
  const AuthBox({super.key});

  @override
  State<AuthBox> createState() => _AuthBoxState();
}

class _AuthBoxState extends State<AuthBox> {
  bool isRegister = false;
  bool isSigningIn = false; // ← ajouté ici

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black54, blurRadius: 20),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SocialAuthButton(
            label: "Connexion avec Google",
            onPressed: () async {
              if (isSigningIn) return; // ← évite les clics multiples
              setState(() => isSigningIn = true);

              try {
                final googleUser = await GoogleSignIn().signIn();
                if (googleUser == null) return;

                final googleAuth = await googleUser.authentication;

                final credential = GoogleAuthProvider.credential(
                  accessToken: googleAuth.accessToken,
                  idToken: googleAuth.idToken,
                );

                final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
                final idToken = await userCredential.user?.getIdToken();

                if (idToken != null) {
                  bool success;

                  if (isRegister) {
                    success = await AuthService.sendRegistrationToBackend(idToken);
                  } else {
                    success = await AuthService.verifyWithBackend(idToken);
                  }

                  if (success) {
                    print("✅ Authentifié avec Google via le backend !");
                  } else {
                    await FirebaseAuth.instance.signOut();
                    print("❌ Échec backend (Google)");
                  }
                }


              } catch (e) {
                print("❌ Erreur Google : $e");
              } finally {
                setState(() => isSigningIn = false);
              }
            },
          ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => setState(() => isRegister = false),
                child: Text(
                  "Connexion",
                  style: TextStyle(color: isRegister ? Colors.grey : Colors.white),
                ),
              ),
              TextButton(
                onPressed: () => setState(() => isRegister = true),
                child: Text(
                  "Inscription",
                  style: TextStyle(color: isRegister ? Colors.white : Colors.grey),
                ),
              ),
            ],
          ),
          const Divider(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isRegister ? const RegisterForm() : const LoginForm(),
          )
        ],
      ),
    );
  }
}
