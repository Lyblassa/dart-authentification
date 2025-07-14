import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'otp_form.dart';
import 'package:provider/provider.dart';
import '../../repositories/auth_repository.dart';

class PhoneAuthForm extends StatefulWidget {
  const PhoneAuthForm({super.key});

  @override
  State<PhoneAuthForm> createState() => _PhoneAuthFormState();
}

class _PhoneAuthFormState extends State<PhoneAuthForm> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pseudoController = TextEditingController();

  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode pseudoFocusNode = FocusNode();

  @override
  void dispose() {
    phoneFocusNode.dispose();
    pseudoFocusNode.dispose();
    super.dispose();
  }

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
                  padding: EdgeInsets.only(top: 40.h, bottom: 16.h),
                  child: Lottie.asset(
                    'lib/assets/animations/saluer.json',
                    width: 180.w,
                    height: 180.h,
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
                  Text(
                    "Entre ton numéro de téléphone",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "pour continuer",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CountryFlag.fromCountryCode(
                          'CA',
                          height: 24.h,
                          width: 32.w,
                          shape: const RoundedRectangle(6),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Canada",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.sp,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  TextField(
                    controller: phoneController,
                    focusNode: phoneFocusNode,
                    keyboardType: TextInputType.phone,
                    cursorColor: const Color(0xFF00A8FC),
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 16.sp),
                    decoration: InputDecoration(
                      prefixText: "+1 ",
                      prefixStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                      hintText: "604 1234 5678",
                      hintStyle: TextStyle(fontSize: 15.sp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: Color(0xFF00A8FC),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  TextField(
                    controller: pseudoController,
                    focusNode: pseudoFocusNode,
                    cursorColor: const Color(0xFF00A8FC),
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 16.sp),
                    decoration: InputDecoration(
                      hintText: "pseudo, surnom",
                      hintStyle: TextStyle(fontSize: 15.sp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: 32.h),

                  _buildLayeredButton(
                    label: "continuer",
                    onTap: () async {
                      final authRepo = context.read<AuthRepository>();
                      final phone = "+1${phoneController.text.trim()}";

                      if (phone.isNotEmpty) {
                        try {
                          await authRepo.signInWithPhone(phone, (
                            verificationId,
                          ) {
                            // 👉 Passe le verificationId à ton OTPForm
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => OTPForm(
                                  verificationId: verificationId,
                                  phoneNumber: phone,
                                  pseudo: pseudoController.text.trim(),
                                ),
                              ),
                            );
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Erreur: ${e.toString()}')),
                          );
                        }
                      }
                    },
                  ),

                  SizedBox(height: 16.h),

                  Text(
                    "nous vous enverrons un message",
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
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
          Container(
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
