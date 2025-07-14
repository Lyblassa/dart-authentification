import 'package:auth_demo/screens/tests_pages/test_comp_ecrite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ✅

class TransitionCompEcritePage extends StatelessWidget {
  const TransitionCompEcritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ✅ Icône check
              Icon(
                Icons.check_circle_outline,
                size: 80.sp,
                color: Colors.green,
              ),

              SizedBox(height: 24.h),

              Text(
                "Première partie terminée",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),

              SizedBox(height: 24.h),

              // ✅ Bloc texte structuré
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check, color: Colors.green, size: 20.sp),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          "Tu as terminé la Compréhension Orale.",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: Colors.blueAccent,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          "La prochaine étape est la Compréhension Écrite.",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.edit, color: Colors.orange, size: 20.sp),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          "Elle comporte 10 questions pour évaluer ton niveau.",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline, color: Colors.grey, size: 20.sp),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          "Ton résultat final sera communiqué à la fin.",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              // ✅ Chat mascotte
              // Image.asset(
              //   'lib/assets/animations/chat.png',
              //   width: 100.w,
              //   fit: BoxFit.contain,
              // ),
              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const TestCompEcritePage(isTestNiveau: true),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    "Commencer la Compréhension Écrite",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
