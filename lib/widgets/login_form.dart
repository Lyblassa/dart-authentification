import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/phone_auth/phone_auth_form.dart';
import 'package:provider/provider.dart';
import '../../repositories/auth_repository.dart';
import 'package:auth_demo/models/user_model.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MountainClipper(),
              child: Container(
                width: double.infinity,
                height: 300.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFE1F5FE), Color(0xFFB3E5FC)],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 80.h, bottom: 24.h),
                  child: Lottie.asset(
                    'lib/assets/animations/saluer.json',
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16.sp,
                          height: 1.4,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                        children: const [
                          TextSpan(text: "Inscris-toi maintenant pour "),
                          TextSpan(
                            text: "sauvegarder ta progression",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(text: " et accéder à tes "),
                          TextSpan(
                            text: "badges",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(text: " et tes "),
                          TextSpan(
                            text: "succès !",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 32.h),

                  _buildLayeredButton(
                    label: "S'inscrire avec Google",
                    leading: Image.asset(
                      'lib/assets/icons/google.png',
                      width: 24.w,
                      height: 24.h,
                    ),
                    onTap: () async {
                      setState(() => status = "Connexion Google...");
                      try {
                        final authRepo = context.read<AuthRepository>();
                        final credential = await authRepo.signInWithGoogle();
                        final user = credential.user;

                        if (user != null) {
                          final userModel = UserModel(
                            uid: user.uid,
                            pseudo:
                                user.displayName ??
                                '', // ou demande un pseudo si vide
                            xp: 0,
                            hearts: 5,
                            gems: 0,
                            level: 'A1',
                            streak: 0,
                          );

                          await authRepo.createOrUpdateUser(userModel);

                          setState(() => status = "Connexion réussie !");
                          // Ensuite navigue
                          // Navigator.pushReplacement(...);
                        }
                      } catch (e) {
                        setState(() => status = "Erreur : ${e.toString()}");
                      }
                    },
                  ),
                  SizedBox(height: 24.h),

                  _buildLayeredButton(
                    label: "S'inscrire avec Apple",
                    leading: Icon(
                      Icons.apple,
                      size: 24.sp,
                      color: Colors.black87,
                    ),
                    onTap: () => setState(() => status = "Connexion Apple..."),
                  ),
                  SizedBox(height: 24.h),

                  _buildLayeredButton(
                    label: "S'inscrire avec Téléphone",
                    leading: Icon(
                      Icons.phone_android,
                      size: 24.sp,
                      color: Colors.black87,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhoneAuthForm(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 32.h),

                  Text(
                    status,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 14.sp),
                  ),

                  SizedBox(height: 40.h),

                  Text(
                    "Ceci est une version de test. Certaines fonctionnalités peuvent évoluer.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 12.sp,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLayeredButton({
    required String label,
    required Widget leading,
    required VoidCallback onTap,
  }) {
    double height = 56.h;
    double offsetY = 4.h;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: offsetY,
            left: 0,
            right: 0,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
          Container(
            height: height,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12, width: 1.2.w),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                leading,
                SizedBox(width: 49.w),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ ClipPath pour la forme montagne
class MountainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 60.h);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height - 40.h,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 80.h,
      size.width,
      size.height - 40.h,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
