import 'package:flutter/material.dart';

const _nunitoBold = TextStyle(
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w900,
  fontSize: 16,
  color: Color(0xFF1A1A1A),
);

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _StatCard(
              imagePath: 'lib/assets/animations/fire.png',
              value: '3',
              popupTitle: '🔥 Série de jours',
              popupMessage:
                  'Bravo ! Tu as étudié 3 jours d\'affilée.\n'
                  'Garde ta série pour débloquer des bonus !',
            ),
            _StatCard(
              imagePath: 'lib/assets/animations/badge.png',
              value: 'B1',
              popupTitle: '🏅 Ton niveau',
              popupMessage:
                  'Tu progresses au niveau B1.\n'
                  'Continue pour atteindre B2 !',
            ),
            _StatCard(
              imagePath: 'lib/assets/animations/favorite.png',
              value: '120',
              popupTitle: '⭐ Classement',
              popupMessage:
                  'Tu es classé 120e cette semaine.\n'
                  'Fais plus de leçons pour grimper !',
            ),
            _StatCard(
              imagePath: 'lib/assets/animations/heart.png',
              value: '5',
              popupTitle: '❤️ Tes vies',
              popupMessage:
                  'Tu as 5 vies.\n'
                  'Perds-en une si tu te trompes trop.\n'
                  'Regagne-les en progressant !',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.imagePath,
    required this.value,
    required this.popupTitle,
    required this.popupMessage,
  });

  final String imagePath;
  final String value;
  final String popupTitle;
  final String popupMessage;

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.contain),
            const SizedBox(height: 16),
            Text(
              popupTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              popupMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 15,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'Fermer',
                style: TextStyle(fontFamily: 'Nunito', color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPopup(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FA),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.asset(imagePath, width: 24, height: 24),
            const SizedBox(width: 6),
            Text(value, style: _nunitoBold),
          ],
        ),
      ),
    );
  }
}
