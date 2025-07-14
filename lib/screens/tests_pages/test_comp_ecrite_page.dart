import 'package:auth_demo/screens/accueil/niveau_page.dart';
import 'package:auth_demo/screens/tests_pages/test_placement_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestCompEcritePage extends StatelessWidget {
  final bool isTestNiveau;
  const TestCompEcritePage({super.key, this.isTestNiveau = false});

  @override
  Widget build(BuildContext context) {
    final double scaleFactor = 1.1; // ✅ UNE SEULE VARIABLE

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
            size: 24.sp * scaleFactor,
          ),
          onPressed: () => _showExitDialog(context, scaleFactor),
        ),
        title: Text(
          "Comp. écrite",
          style: TextStyle(
            fontFamily: 'Nunito',
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 18.sp * scaleFactor,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 12.w * scaleFactor,
              vertical: 10.h * scaleFactor,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w * scaleFactor,
              vertical: 4.h * scaleFactor,
            ),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(20.r * scaleFactor),
            ),
            child: Text(
              "7/15",
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w * scaleFactor,
          vertical: 12.h * scaleFactor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w * scaleFactor),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r * scaleFactor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w * scaleFactor,
                      vertical: 4.h * scaleFactor,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.redAccent,
                        width: 1.w * scaleFactor,
                      ),
                      borderRadius: BorderRadius.circular(8.r * scaleFactor),
                    ),
                    child: Text(
                      "COUP DE CŒUR",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp * scaleFactor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h * scaleFactor),
                  Text(
                    "Guide de l’écolo au quotidien",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp * scaleFactor,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h * scaleFactor),
                  Text(
                    "La planète nous rappelle en permanence la nécessité de prendre soin d’elle : "
                    "déforestation, appauvrissement des sols et des océans, disparition "
                    "d’espèces, pollutions et atteintes à la santé… Ce guide recense plus de 800 trucs et astuces pour "
                    "consommer et vivre de façon écologique : "
                    "équiper sa maison, entretenir son intérieur, entretenir son jardin, entretenir son corps.",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize:
                          13.sp, // ou la taille responsive que tu utilises
                      height: 1.4,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 17.h * scaleFactor),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "9. ",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 13.sp * scaleFactor,
                    ),
                  ),
                  TextSpan(
                    text: "Que peut-on trouver dans ce guide",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp * scaleFactor,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h * scaleFactor),
            const Divider(thickness: 1, color: Colors.blueAccent),
            SizedBox(height: 7.h * scaleFactor),
            const _AnswerOption(
              text:
                  "L’inventaire des matières respectueuses de l’environnement.",
              isSelected: false,
              isCorrect: false,
            ),
            SizedBox(height: 7.h * scaleFactor),
            const _AnswerOption(
              text:
                  "L’inventaire des matières respectueuses de l’environnement.",
              isSelected: false,
              isCorrect: false,
            ),
            SizedBox(height: 7.h * scaleFactor),
            const _AnswerOption(
              text: "Des informations complètes sur les dangers de la nature.",
              isSelected: true,
              isCorrect: true,
            ),
            SizedBox(height: 7.h * scaleFactor),
            const _AnswerOption(
              text:
                  "L’inventaire des matières respectueuses de l’environnement.",
              isSelected: false,
              isCorrect: false,
            ),
            SizedBox(height: 7.h * scaleFactor),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (isTestNiveau) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TestPlacementResultPage(
                          scorePourcentage: 82.5,
                          onContinuer: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/home',
                              (route) => false,
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NiveauPage(
                          niveau: 'B2',
                          progressionGlobale: 0.6,
                          progressionVers: 'C1',
                        ),
                      ),
                      (route) => false,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16.h * scaleFactor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r * scaleFactor),
                  ),
                ),
                child: Text(
                  "Continuer",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp * scaleFactor,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showExitDialog(BuildContext context, double scaleFactor) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r * scaleFactor),
        ),
        title: Text(
          isTestNiveau ? 'Quitter le test ?' : 'Quitter la partie ?',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 16.sp * scaleFactor,
          ),
        ),
        content: Text(
          isTestNiveau
              ? 'Si tu quittes maintenant, ta progression ne sera pas sauvegardée.'
              : 'Si tu quittes maintenant, tu termines la partie et tes points seront sauvegardés.',
          style: TextStyle(fontFamily: 'Nunito', fontSize: 14.sp * scaleFactor),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Annuler',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 14.sp * scaleFactor,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r * scaleFactor),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              if (isTestNiveau) {
                Navigator.pop(context);
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NiveauPage(
                      niveau: 'B2',
                      progressionGlobale: 0.4,
                      progressionVers: 'C1',
                    ),
                  ),
                  (route) => false,
                );
              }
            },
            child: Text(
              isTestNiveau ? 'Quitter quand même' : 'Terminer la partie',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 14.sp * scaleFactor,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnswerOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;

  const _AnswerOption({
    required this.text,
    required this.isSelected,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    final double scaleFactor = 1.1;
    final borderColor = isSelected
        ? (isCorrect ? Colors.green : Colors.red)
        : Colors.grey.shade300;

    final icon = isSelected
        ? (isCorrect ? Icons.check_circle : Icons.cancel)
        : Icons.circle_outlined;

    final iconColor = isSelected
        ? (isCorrect ? Colors.green : Colors.red)
        : Colors.black54;

    final textColor = isSelected
        ? (isCorrect ? Colors.green : Colors.black87)
        : Colors.black87;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w * scaleFactor),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green.shade50 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r * scaleFactor),
        border: Border.all(color: borderColor, width: 2.w * scaleFactor),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 16.sp * scaleFactor),
          SizedBox(width: 12.w * scaleFactor),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 13.sp * scaleFactor,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
