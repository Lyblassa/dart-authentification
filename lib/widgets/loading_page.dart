import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            // ✅ Image de ton chat
            Image.asset(
              'lib/assets/animations/chatload.png',
              width: 120.w,
              height: 120.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 24.h),

            // ✅ Texte de chargement
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

            // ✅ Loader circulaire
            const CircularProgressIndicator(
              color: Color(0xFF00A8FC), // adapte à ta couleur principale
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
