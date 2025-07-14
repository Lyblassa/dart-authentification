import 'package:flutter/material.dart';
import 'test_exp_ecrite_result_page.dart';

class TestExpEcriteStep1Page extends StatelessWidget {
  const TestExpEcriteStep1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController step1Controller = TextEditingController();
    final TextEditingController step2Controller = TextEditingController();
    final TextEditingController step3Controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Bloc sujet stylisé et compact
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
                "✉️ Tâche 1\nVous partez bientôt en voyage.\n"
                "Écrivez un petit message à vos amis : dites où vous partez et ce que vous ferez.",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 16),

            _buildStep(
              step: "Étape 1 : Salutation",
              conseil: "💡 Salue tes amis avec un mot amical.",
              controller: step1Controller,
              wordCount: "0/10 mots",
              maxLines: 1,
            ),

            const SizedBox(height: 16),

            _buildStep(
              step: "Étape 2 : Détails",
              conseil: "💡 Parle de ta destination et activités.",
              controller: step2Controller,
              wordCount: "0/30 mots",
              maxLines: 2,
            ),

            const SizedBox(height: 16),

            _buildStep(
              step: "Étape 3 : Conclusion",
              conseil: "💡 Termine avec une phrase sympa.",
              controller: step3Controller,
              wordCount: "0/10 mots",
              maxLines: 1,
            ),

            const SizedBox(height: 20),

            // ✅ Bouton vers Feedback ➜ Step2
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TestExpEcriteResultPage(
                        titreTache: "Tâche 1 : Message privé",
                        noteSur20: 16.5,
                        pointsPositifs: "Bonne structure et salutation claire.",
                        pointsAMeliorer: "Attention aux répétitions.",
                        onSuivant: () {
                          Navigator.pushNamed(context, '/step2');
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
                  "Voir mon feedback",
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
        "Exp. écrite - Step 1",
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
