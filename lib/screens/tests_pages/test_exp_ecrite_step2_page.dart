import 'package:flutter/material.dart';
import 'test_exp_ecrite_result_page.dart'; // ✅ Importe ta page résultat

class TestExpEcriteStep2Page extends StatelessWidget {
  const TestExpEcriteStep2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController detailController = TextEditingController();
    final TextEditingController explicationController = TextEditingController();
    final TextEditingController conclusionController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Bloc Sujet Tâche 2 compact
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blueAccent, width: 1.2),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Text(
                "✉️ Tâche 2\n\nDécris ton projet en donnant plus de détails : "
                "où tu pars, pourquoi tu as choisi cette destination et ce que tu veux faire.",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Sous-étape 1 : Détails
            _buildStep(
              step: "Partie 1 : Détails du projet",
              conseil:
                  "💡 Parle de la destination, durée et activités principales.",
              controller: detailController,
              wordCount: "0/30 mots",
              maxLines: 2,
            ),

            const SizedBox(height: 16),

            // ✅ Sous-étape 2 : Explication
            _buildStep(
              step: "Partie 2 : Pourquoi ce choix ?",
              conseil:
                  "💡 Explique pourquoi tu as choisi cet endroit. Utilise « Parce que… »",
              controller: explicationController,
              wordCount: "0/20 mots",
              maxLines: 2,
            ),

            const SizedBox(height: 16),

            // ✅ Sous-étape 3 : Phrase sympa
            _buildStep(
              step: "Partie 3 : Phrase sympa",
              conseil: "💡 Termine avec une phrase positive pour tes amis.",
              controller: conclusionController,
              wordCount: "0/10 mots",
              maxLines: 1,
            ),

            const SizedBox(height: 28),

            // ✅ Bouton Continuer ➜ Résultat Tâche 2
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TestExpEcriteResultPage(
                        titreTache: "Tâche 2 : Description détaillée",
                        noteSur20: 15.5,
                        pointsPositifs:
                            "Tes idées sont claires et bien structurées.",
                        pointsAMeliorer:
                            "Travaille ton vocabulaire et relis tes accords.",
                        onSuivant: () {
                          Navigator.pushNamed(context, '/step3');
                        },
                      ),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Continuer",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStep({
    required String step,
    required String conseil,
    required TextEditingController controller,
    required String wordCount,
    required int maxLines,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          step,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.yellow.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            conseil,
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 13,
              height: 1.4,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: Colors.blue.shade50.withOpacity(0.3),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            wordCount,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(Icons.arrow_back, color: Colors.black87),
      title: const Text(
        "Exp. écrite - Step 2",
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            '7/15',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
