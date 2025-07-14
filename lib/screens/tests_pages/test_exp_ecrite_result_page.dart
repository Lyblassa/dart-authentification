import 'package:flutter/material.dart';

class TestExpEcriteResultPage extends StatelessWidget {
  final String titreTache;
  final double noteSur20;
  final String pointsPositifs;
  final String pointsAMeliorer;
  final VoidCallback onSuivant;

  const TestExpEcriteResultPage({
    super.key,
    required this.titreTache,
    required this.noteSur20,
    required this.pointsPositifs,
    required this.pointsAMeliorer,
    required this.onSuivant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ✅ Mascotte / illustration
            Image.asset(
              'lib/assets/animations/chat.png',
              width: 100,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 16),

            // ✅ Titre succès
            const Text(
              "🎉 Bien joué !",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 8),

            // ✅ Titre Tâche
            Text(
              titreTache,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
              ),
            ),

            const SizedBox(height: 24),

            // ✅ Note
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "⭐ Note estimée : ${noteSur20.toStringAsFixed(1)}/20",
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ✅ Points positifs
            _buildFeedbackCard(
              icon: Icons.check_circle,
              color: Colors.green,
              titre: "Points forts",
              contenu: pointsPositifs,
              showVoirPlus: false,
            ),

            const SizedBox(height: 16),

            // ✅ Points à améliorer
            _buildFeedbackCard(
              icon: Icons.error_outline,
              color: Colors.redAccent,
              titre: "À améliorer",
              contenu: pointsAMeliorer,
              showVoirPlus: true,
              onVoirPlus: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text(
                      "Détails des erreurs",
                      style: TextStyle(fontFamily: 'Nunito'),
                    ),
                    content: const Text(
                      "Exemple : Tu peux indiquer ici les phrases à revoir ou les erreurs précises.",
                      style: TextStyle(fontFamily: 'Nunito'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Fermer"),
                      ),
                    ],
                  ),
                );
              },
            ),

            const Spacer(),

            // ✅ Bouton « Aller vers la tâche suivante »
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSuivant,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Aller vers la tâche suivante",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackCard({
    required IconData icon,
    required Color color,
    required String titre,
    required String contenu,
    bool showVoirPlus = false,
    VoidCallback? onVoirPlus,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 12),
              Text(
                titre,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            contenu,
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 13,
              height: 1.4,
              color: Colors.black87,
            ),
          ),
          if (showVoirPlus && onVoirPlus != null) ...[
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onVoirPlus,
                child: const Text(
                  "Voir plus",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 13,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(Icons.arrow_back, color: Colors.black87),
      title: const Text(
        "Résultat",
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
    );
  }
}
