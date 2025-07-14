import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'test_exp_ecrite_step1_page.dart';

class TestExpEcritePage extends StatelessWidget {
  const TestExpEcritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double scaleFactor = 1.1; // ✅ Ton facteur d’agrandissement

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h * scaleFactor),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w * scaleFactor,
              vertical: 12.h * scaleFactor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                    size: 24.sp * scaleFactor,
                  ),
                ),
                Text(
                  'Exp. écrite',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18.sp * scaleFactor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w * scaleFactor,
                    vertical: 4.h * scaleFactor,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.r * scaleFactor),
                  ),
                  child: Text(
                    '7/15',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp * scaleFactor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w * scaleFactor,
          vertical: 12.h * scaleFactor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h * scaleFactor),

            Text(
              'Préparation TCF – Tâche 1',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20.sp * scaleFactor,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 20.h * scaleFactor),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w * scaleFactor),
              decoration: BoxDecoration(
                color: Colors.blue.shade50.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16.r * scaleFactor),
                border: Border.all(
                  color: Colors.blueAccent.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dans cette première tâche, tu vas répondre à des questions pratiques "
                    "pour évaluer ton expression écrite. Nous te guidons étape par étape, "
                    "avec des conseils et un suivi personnalisé.\n",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 14.sp * scaleFactor,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h * scaleFactor),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20.sp * scaleFactor,
                      ),
                      SizedBox(width: 8.w * scaleFactor),
                      Expanded(
                        child: Text(
                          "5 activités par niveau",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 13.sp * scaleFactor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h * scaleFactor),
                  Row(
                    children: [
                      Icon(
                        Icons.flash_on,
                        color: Colors.orange,
                        size: 20.sp * scaleFactor,
                      ),
                      SizedBox(width: 8.w * scaleFactor),
                      Expanded(
                        child: Text(
                          "Résultats instantanés",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 13.sp * scaleFactor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h * scaleFactor),
                  Row(
                    children: [
                      Icon(
                        Icons.help_outline,
                        color: Colors.blueAccent,
                        size: 20.sp * scaleFactor,
                      ),
                      SizedBox(width: 8.w * scaleFactor),
                      Expanded(
                        child: Text(
                          "Aide personnalisée selon tes progrès",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 13.sp * scaleFactor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 28.h * scaleFactor),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TestExpEcriteStep1Page(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20.sp * scaleFactor,
                ),
                label: Text(
                  "Commencer",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16.sp * scaleFactor,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 14.h * scaleFactor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r * scaleFactor),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.h * scaleFactor),

            Center(
              child: Image.asset(
                'lib/assets/animations/chat.png',
                width: 100.w * scaleFactor,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
