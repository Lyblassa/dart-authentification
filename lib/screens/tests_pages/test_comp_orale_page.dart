import 'package:auth_demo/screens/tests_pages/transition_comp_ecrite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'test_comp_ecrite_page.dart';

class TestCompOralePage extends StatelessWidget {
  final bool isTestNiveau;
  const TestCompOralePage({super.key, this.isTestNiveau = false});

  @override
  Widget build(BuildContext context) {
    final double scaleFactor = 1.1; // ✅ Ton facteur d'agrandissement

    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ TopBar responsive
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
                  onTap: () {
                    _showExitDialog(context, scaleFactor);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                    size: 24.sp * scaleFactor,
                  ),
                ),
                Text(
                  'Comp. orale',
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

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w * scaleFactor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: _buildAudioPlayer(scaleFactor)),

            SizedBox(height: 24.h * scaleFactor),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '7. ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 14.sp * scaleFactor,
                    ),
                  ),
                  const TextSpan(
                    text:
                        'Écoute la consigne et réponds à la question. '
                        'Choisis la bonne réponse et appuie sur le bouton Terminer.',
                  ),
                ],
              ),
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 14.sp * scaleFactor,
              ),
            ),

            SizedBox(height: 20.h * scaleFactor),

            _AnswerButton(
              label: '',
              text: 'Réponse A',
              scaleFactor: scaleFactor,
            ),
            _AnswerButton(
              label: '',
              text: 'Réponse B',
              scaleFactor: scaleFactor,
            ),
            _AnswerButton(
              label: '',
              text: 'Réponse C',
              scaleFactor: scaleFactor,
            ),
            _AnswerButton(
              label: '',
              text: 'Réponse D',
              scaleFactor: scaleFactor,
            ),

            SizedBox(height: 24.h * scaleFactor),

            SizedBox(height: 16.h * scaleFactor),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (isTestNiveau) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TransitionCompEcritePage(),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
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
                  'Continuer',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16.sp * scaleFactor,
                    fontWeight: FontWeight.bold,
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

  Widget _buildAudioPlayer(double scaleFactor) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w * scaleFactor,
        vertical: 20.h * scaleFactor,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.blue.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30.r * scaleFactor),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.15),
            blurRadius: 10.r * scaleFactor,
            offset: Offset(0, 4.h * scaleFactor),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.headphones,
            size: 60.sp * scaleFactor,
            color: Colors.blueAccent,
          ),
          SizedBox(height: 16.h * scaleFactor),
          Row(
            children: [
              Icon(
                Icons.replay_10,
                color: Colors.blueAccent,
                size: 20.sp * scaleFactor,
              ),
              SizedBox(width: 12.w * scaleFactor),
              Icon(
                Icons.play_circle_fill,
                color: Colors.blueAccent,
                size: 36.sp * scaleFactor,
              ),
              SizedBox(width: 12.w * scaleFactor),
              Text(
                '00:00',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 12.sp * scaleFactor,
                ),
              ),
              Expanded(
                child: Slider(
                  value: 0.2,
                  onChanged: (value) {},
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.blueAccent.withOpacity(0.3),
                ),
              ),
              Text(
                '00:30',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 12.sp * scaleFactor,
                ),
              ),
            ],
          ),
        ],
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
              Navigator.pop(context);
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

class _AnswerButton extends StatelessWidget {
  final String label;
  final String text;
  final double scaleFactor;

  const _AnswerButton({
    required this.label,
    required this.text,
    required this.scaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h * scaleFactor),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 14.h * scaleFactor,
        horizontal: 16.w * scaleFactor,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade400,
          width: 1.5.w * scaleFactor,
        ),
        borderRadius: BorderRadius.circular(12.r * scaleFactor),
        color: Colors.white,
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$text ',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 14.sp * scaleFactor,
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp * scaleFactor,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
