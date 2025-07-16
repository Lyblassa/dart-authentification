import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';

class TestsPage extends StatelessWidget {
  const TestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBFD),
      appBar: const TopBar(), //  FIXE ET UNIFORME
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),

            //  Nouveau titre plus clair
            const Text(
              'Prépare ton test TCF',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Découvre chaque partie et lance-toi quand tu es prêt !',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 24),

            //  Partie 1
            const _TestCard(
              title: 'Compréhension Orale',
              questions: '37 Q • 37 min',
              shortDesc: 'Écoute et réponds aux questions.',
              icon: Icons.headphones,
            ),

            const SizedBox(height: 16),

            //  Partie 2
            const _TestCard(
              title: 'Compréhension Écrite',
              questions: '35 Q • 1h',
              shortDesc: 'Lis des textes et choisis les bonnes réponses.',
              icon: Icons.menu_book,
            ),

            const SizedBox(height: 16),

            //  Partie 3
            const _TestCard(
              title: 'Expression Écrite',
              questions: '3 tâches • 1h',
              shortDesc: 'Rédige tes réponses aux tâches proposées.',
              icon: Icons.edit_note,
            ),

            const SizedBox(height: 16),

            //  Partie 4
            const _TestCard(
              title: 'Expression Orale',
              questions: '1 entretien • 12 min',
              shortDesc: 'Parle sur différents sujets.',
              icon: Icons.mic,
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _TestCard extends StatelessWidget {
  final String title;
  final String questions;
  final String shortDesc;
  final IconData icon;

  const _TestCard({
    required this.title,
    required this.questions,
    required this.shortDesc,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          //  Icône principale
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
            child: Icon(icon, color: Colors.blueAccent, size: 28),
          ),
          const SizedBox(width: 16),

          //  Texte principal
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  questions,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  shortDesc,
                  style: const TextStyle(fontFamily: 'Nunito', fontSize: 14),
                ),
              ],
            ),
          ),

          // Bouton lancer
          IconButton(
            onPressed: () {
              // TODO: Navigation vers la partie
            },
            icon: const Icon(Icons.chevron_right, color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
