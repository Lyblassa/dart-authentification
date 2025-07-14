import 'package:auth_demo/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home_screen.dart';
import 'package:provider/provider.dart';
import '../../repositories/auth_repository.dart';

class OTPForm extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  final String pseudo;

  const OTPForm({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
    required this.pseudo,
  });

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final TextEditingController otpController = TextEditingController();
  int _secondsRemaining = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendCode() {
    setState(() {
      _secondsRemaining = 30;
    });
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'lib/assets/animations/chatel2.json',
                width: 200.w,
                height: 200.h,
              ),

              SizedBox(height: 16.h),

              Text(
                "Entrer le code",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                "Nous avons envoyé un code\nà six chiffres.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14.sp,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height: 32.h),

              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: otpController,
                cursorColor: const Color(0xFF00A8FC),
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8.r),
                  fieldHeight: 50.h,
                  fieldWidth: 40.w,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: Colors.black26,
                  inactiveColor: Colors.black26,
                  selectedColor: const Color(0xFF00A8FC),
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (value) {},
                onChanged: (value) {},
              ),

              SizedBox(height: 12.h),

              TextButton(
                onPressed: _secondsRemaining == 0 ? _resendCode : null,
                child: Text(
                  "Renvoyer le code",
                  style: TextStyle(
                    color: _secondsRemaining == 0
                        ? const Color(0xFF00A8FC)
                        : Colors.grey,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Text(
                "dans ${_secondsRemaining}s",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 12.sp,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height: 32.h),

              _buildLayeredButton(
                label: "continuer",
                onTap: () async {
                  final authRepo = context.read<AuthRepository>();
                  final smsCode = otpController.text.trim();

                  try {
                    final credential = await authRepo.verifySmsCode(
                      widget.verificationId,
                      smsCode,
                    );

                    final user = credential.user;
                    if (user != null) {
                      // Crée un UserModel de base
                      final userModel = UserModel(
                        uid: user.uid,
                        pseudo: widget.pseudo,
                        xp: 0,
                        hearts: 5,
                        gems: 0,
                        level: 'A1',
                        streak: 0,
                      );

                      await authRepo.createOrUpdateUser(userModel);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erreur: ${e.toString()}')),
                    );
                  }
                },
              ),
            ],
          ),
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
              color: const Color(0xFF00A8FC),
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
