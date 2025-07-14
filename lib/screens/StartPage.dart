import 'package:auth_demo/screens/tests_pages/transition_comp_orale_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ✅ ScreenUtil
import '../../widgets/top_bar.dart';
import 'tests_pages/test_comp_orale_page.dart';
import 'home_screen.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopBar(),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ✅ Chaton + bulle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/animations/chat.png',
                    width: 120.w,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 12.w),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.all(22.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: Colors.grey.shade400),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          'Allez, on va trouver\npar où commencer!',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        left: -10.w,
                        bottom: 35.h,
                        child: Column(
                          children: [
                            Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                  width: 0.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Transform.translate(
                              offset: Offset(-4.w, 0),
                              child: Container(
                                width: 5.w,
                                height: 5.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 32.h),

              // ✅ Carte : Déterminer mon niveau
              _ActionCard3D(
                icon: Icons.explore,
                iconBackground: const Color(0xFF4FA7F3).withOpacity(0.1),
                iconColor: const Color(0xFF4FA7F3),
                title: 'Déterminer mon niveau',
                subtitle: 'Laisse nous trouver le\nmeilleur point de départ',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransitionCompOralePage(),
                    ),
                  );
                },
              ),

              SizedBox(height: 32.h),

              // ✅ Carte : Commencer par les bases
              _ActionCard3D(
                icon: Icons.menu_book,
                iconBackground: Colors.yellow.shade100,
                iconColor: Colors.amber.shade800,
                title: 'Commencer par les bases',
                subtitle: 'Faire la leçon la plus facile\ndu TCF Express',
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false,
                  );
                },
              ),

              const Spacer(),

              // ✅ Bouton continuer désactivé
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.grey,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Continuer',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionCard3D extends StatelessWidget {
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionCard3D({
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 12.h,
          left: 0,
          right: 0,
          child: Container(
            height: 90.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28.r,
                    backgroundColor: iconBackground,
                    child: Icon(icon, color: iconColor, size: 26.sp),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          subtitle,
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
          ),
        ),
      ],
    );
  }
}
