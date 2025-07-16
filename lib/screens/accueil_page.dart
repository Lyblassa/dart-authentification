import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ✅
import '../widgets/top_bar.dart';
import 'accueil/niveau_page.dart';

const _nunitoBoldWhite = TextStyle(
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF7FBFD), Color(0xFFFDFEFE)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),

        SafeArea(
          child: Column(
            children: [
              const TopBar(),

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: 800.h, // ✅ adaptatif
                    child: LayoutBuilder(
                      builder: (context, c) {
                        final cx = c.maxWidth / 2;
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: 0.h,
                              left: 16.w,
                              right: 16.w,
                              child: Container(
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.school, color: Colors.red),
                                    SizedBox(width: 10.w),
                                    const Expanded(
                                      child: Text(
                                        "Prépare-toi au TCF Canada. C'est 100 % gratuit.",
                                        style: _nunitoBoldWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Positioned(
                              top: 80.h,
                              left: cx - 150.w,
                              child: _Skill(
                                'A1',
                                colors: [Colors.blue],
                                onTap: () => _openNiveau(context, 'A1'),
                              ),
                            ),
                            Positioned(
                              top: 150.h,
                              left: cx + 60.w,
                              child: _Skill(
                                'A2',
                                colors: [Colors.blue],
                                onTap: () => _openNiveau(context, 'A2'),
                              ),
                            ),
                            Positioned(
                              top: 300.h,
                              left: cx - 90.w,
                              child: const _Skill(
                                'B1',
                                colors: [Color(0xFFFF4B4B)],
                              ),
                            ),
                            Positioned(
                              top: 450.h,
                              left: cx + 60.w,
                              child: const _Skill(
                                'B2',
                                colors: [Color(0xFFFF4B4B)],
                              ),
                            ),
                            Positioned(
                              top: 440.h,
                              left: cx + 60.w - 90.w,
                              child: Material(
                                color: Colors.transparent,
                                elevation: 6,
                                borderRadius: BorderRadius.circular(2.r),
                                shadowColor: Colors.black.withOpacity(0.25),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 6.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color(0xFFFF4B4B),
                                      width: 2.w,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Text(
                                    "COMMENCER",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      color: const Color(0xFFFF4B4B),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 530.h,
                              left: cx + 60.w + 10.w,
                              child: SizedBox(
                                width: 60.w,
                                height: 30.h,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: const [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Icon(
                                        Icons.star,
                                        color: Color(0xFFFF4B4B),
                                        size: 20,
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      bottom: 0,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 550.h,
                              left: cx - 150.w,
                              child: _Skill(
                                'C1',
                                colors: [Colors.grey.shade500],
                                locked: true,
                              ),
                            ),
                            Positioned(
                              top: 620.h,
                              left: cx - 90.w,
                              child: SizedBox(
                                width: 150.w,
                                child: Lottie.asset(
                                  'lib/assets/animations/feu.json',
                                ),
                              ),
                            ),


                            Positioned(
                              top: 700.h,
                              left: cx + 60.w,
                              child: _Skill(
                                'C2',
                                colors: [Colors.grey.shade500],
                                locked: true,
                              ),
                            ),
                            Positioned(
                              top: 180.h,
                              left: 80.w,
                              child: SizedBox(
                                width: 130.w,
                                child: Lottie.asset(
                                  'lib/assets/animations/dormir.json',
                                ),
                              ),
                            ),
                            Positioned(
                              top: 300.h,
                              right: 10.w,
                              child: SizedBox(
                                width: 150.w,
                                child: Lottie.asset(
                                  'lib/assets/animations/chatbasket.json',
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Skill extends StatelessWidget {
  const _Skill(
    this.label, {
    required this.colors,
    this.size = 80,
    this.locked = false,
    this.onTap,
  });

  final String label;
  final List<Color> colors;
  final double size;
  final bool locked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final mainColor = colors.first;
    final edgeColor = HSLColor.fromColor(mainColor)
        .withLightness(
          (HSLColor.fromColor(mainColor).lightness - 0.1).clamp(0, 1),
        )
        .toColor();

    final double s = size.w; // ✅ responsive

    return GestureDetector(
      onTap: locked ? null : onTap,
      child: SizedBox(
        width: s,
        height: s,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.translate(
                offset: Offset(0, 4.h),
                child: Container(
                  width: s,
                  height: s,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: edgeColor,
                  ),
                ),
              ),
            ),
            Container(
              width: s,
              height: s,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: mainColor,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (!locked) ...[
                    _Stripe(size: s, shift: -0.25),
                    _Stripe(size: s, shift: 0.25),
                  ],
                  Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
}

class _Stripe extends StatelessWidget {
  const _Stripe({required this.size, required this.shift});

  final double size;
  final double shift;

  @override
  Widget build(BuildContext context) => Transform.translate(
    offset: Offset(0, size * shift),
    child: Transform.rotate(
      angle: -0.5,
      child: Container(
        width: size * 0.9,
        height: size * 0.16,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          borderRadius: BorderRadius.circular(7.r),
        ),
      ),
    ),
  );
}

void _openNiveau(BuildContext context, String niveau) {
  // Définis la logique pour le niveau suivant :
  String progressionVers = '';
  switch (niveau) {
    case 'A1':
      progressionVers = 'A2';
      break;
    case 'A2':
      progressionVers = 'B1';
      break;
    case 'B1':
      progressionVers = 'B2';
      break;
    case 'B2':
      progressionVers = 'C1';
      break;
    case 'C1':
      progressionVers = 'C2';
      break;
    case 'C2':
      progressionVers = 'Final !';
      break;
    default:
      progressionVers = '';
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => NiveauPage(
        niveau: niveau,
        progressionGlobale: 0.0,
        progressionVers: progressionVers,
      ),
    ),
  );
}
