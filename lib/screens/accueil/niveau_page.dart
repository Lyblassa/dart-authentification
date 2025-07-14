import 'package:auth_demo/screens/tests_pages/test_exp_ecrite_page.dart';
import 'package:auth_demo/screens/tests_pages/transition_comp_ecrite_normal_page.dart';
import 'package:auth_demo/screens/tests_pages/transition_comp_orale_normal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/top_bar.dart';
import '../../widgets/bottom_nav.dart';

class NiveauPage extends StatelessWidget {
  final String niveau;
  final double progressionGlobale;
  final String progressionVers;
  const NiveauPage({
    super.key,
    required this.niveau,
    required this.progressionGlobale,
    required this.progressionVers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBFD),

      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: TopBar(),
      ),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                '🎯 Obtiens au moins 80% dans chaque partie pour valider le niveau $niveau.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 20.h),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.95,
              children: const [
                _PartCard(
                  title: 'Orale',
                  subtitle: 'Compréhension',
                  icon: Icons.headphones,
                  percent: 0.48,
                ),
                _PartCard(
                  title: 'Écrite',
                  subtitle: 'Compréhension',
                  icon: Icons.menu_book,
                  percent: 0.60,
                ),
                _PartCard(
                  title: 'Orale',
                  subtitle: 'Expression',
                  icon: Icons.mic,
                  percent: 0.20,
                ),
                _PartCard(
                  title: 'Écrite',
                  subtitle: 'Expression',
                  icon: Icons.edit,
                  percent: 0.10,
                ),
              ],
            ),

            SizedBox(height: 28.h),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Progression niveau $niveau',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: LinearProgressIndicator(
                    value: progressionGlobale,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.blueAccent,
                    minHeight: 10.h,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  '${(progressionGlobale * 100).toStringAsFixed(0)}% complété',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16.h),
                Center(
                  child: Image.asset(
                    'lib/assets/animations/pourcentage.png',
                    width: 80.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),

            SizedBox(height: 32.h),
          ],
        ),
      ),

      bottomNavigationBar: const BottomNav(currentIndex: 999, onTap: null),
    );
  }
}

class _PartCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final double percent;

  const _PartCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12.r),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: () {
          if (title == 'Écrite' && subtitle == 'Expression') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TestExpEcritePage()),
            );
          } else if (title == 'Orale' && subtitle == 'Compréhension') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const TransitionCompOraleNormalPage(),
              ),
            );
          } else if (title == 'Écrite' && subtitle == 'Compréhension') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const TransitionCompEcriteNormalPage(),
              ),
            );
          } else {
            debugPrint('Lancer $subtitle $title...');
          }
        },

        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.blueAccent.withOpacity(0.1),
                    child: Icon(icon, color: Colors.blueAccent, size: 22.sp),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 11.sp,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: CircularProgressIndicator(
                      value: percent,
                      strokeWidth: 4.w,
                      color: Colors.blueAccent,
                      backgroundColor: Colors.grey.shade300,
                    ),
                  ),
                  Text(
                    '${(percent * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
