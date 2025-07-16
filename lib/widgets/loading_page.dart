import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  final String message;

  const LoadingPage({Key? key, this.message = 'Chargement en cours...'})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ou ton background couleur thème
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 180.w,
              height: 180.w,
              child: Lottie.asset(
                'lib/assets/animations/chatattend.json',
              ),
            ),

            SizedBox(height: 24.h),

            //  Texte de chargement
            Text(
              message,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
