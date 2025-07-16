import 'package:flutter/material.dart';

class TestNiveauPage extends StatelessWidget {
  const TestNiveauPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //  TopBar custom style quiz
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, color: Colors.black87),
                ),
                const Text(
                  'Comp. orale',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '7/15',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Bloc audio élégant
            Center(child: _buildAudioPlayer()),

            const SizedBox(height: 24),

            // ✅ Question
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '7. ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Écoute la consigne et réponds à la question. '
                        'Choisis la bonne réponse et appuie sur le bouton Terminer.',
                  ),
                ],
              ),
              style: TextStyle(fontFamily: 'Nunito', fontSize: 14),
            ),

            const SizedBox(height: 20),

            // ✅ Réponses sobres
            _AnswerButton(label: '', text: 'Réponse A'),
            _AnswerButton(label: '', text: 'Réponse B'),
            _AnswerButton(label: '', text: 'Réponse C'),
            _AnswerButton(label: '', text: 'Réponse D'),

            const SizedBox(height: 24),

            // ✅ Petit chaton motivant
            Center(
              child: Image.asset(
                'lib/assets/animations/chat.png',
                width: 80,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Bouton continuer
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: gérer la suite du quiz
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Continuer',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
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

  // ✅ Bloc audio design
  Widget _buildAudioPlayer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.blue.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(Icons.headphones, size: 60, color: Colors.blueAccent),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.replay_10, color: Colors.blueAccent),
              const SizedBox(width: 12),
              Icon(Icons.play_circle_fill, color: Colors.blueAccent, size: 36),
              const SizedBox(width: 12),
              const Text('00:00', style: TextStyle(fontFamily: 'Nunito')),
              Expanded(
                child: Slider(
                  value: 0.2,
                  onChanged: (value) {},
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.blueAccent.withOpacity(0.3),
                ),
              ),
              const Text('00:30', style: TextStyle(fontFamily: 'Nunito')),
            ],
          ),
        ],
      ),
    );
  }
}

// ✅ Boutons réponses sobres, style neutre
class _AnswerButton extends StatelessWidget {
  final String label;
  final String text;

  const _AnswerButton({required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$text ',
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
