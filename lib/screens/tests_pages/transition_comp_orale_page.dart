import 'package:auth_demo/screens/tests_pages/test_comp_orale_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransitionCompOralePage extends StatelessWidget {
  const TransitionCompOralePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple : boost de la taille globale
    final double factor = 1.12; //  Essayez 1.1 ou 1.2 selon tes tests

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'lib/assets/animations/chatprincipalnew.json',
                    width: 250.w,
                    fit: BoxFit.contain,
                  ),
                ),


                SizedBox(height: 24.h),

                Text(
                  "Prêt à commencer ?",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 22.sp * factor, // ✅ boost
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4FA7F3),
                  ),
                ),

                SizedBox(height: 24.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.volume_up,
                          color: const Color(0xFF4FA7F3),
                          size: 20.sp * factor,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            "Tu vas commencer la Compréhension Orale.",
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 15.sp * factor,
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
                          color: const Color(0xFF4FA7F3),
                          size: 20.sp * factor,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            "Ensuite, tu passeras à la Compréhension Écrite.",
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 15.sp * factor,
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
                          Icons.list_alt,
                          color: Colors.orange,
                          size: 20.sp * factor,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            "Chaque partie contient 10 questions pour tester ton niveau.",
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 15.sp * factor,
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
                          Icons.spa,
                          color: Colors.green,
                          size: 20.sp * factor,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            "Nous te conseillons de rester dans un endroit calme "
                            "pour bien écouter et te concentrer.",
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 15.sp * factor,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const TestCompOralePage(isTestNiveau: true),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4FA7F3),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      "Commencer la Compréhension Orale",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16.sp * factor,
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
      ),
    );
  }
}
