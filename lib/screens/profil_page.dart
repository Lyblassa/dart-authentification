import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBFD),
      appBar: const TopBar(), // ✅ Fixe, uniforme, prend toute la largeur
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ✅ Avatar + pseudo
            const SizedBox(height: 12),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/assets/animations/user.png'),
            ),
            const SizedBox(height: 12),

            const Text(
              'Mezankou Valdes',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Niveau B1 - TCF Express',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Barre progression
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Progression',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: 0.45,
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.blueAccent,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(12),
                ),
                const SizedBox(height: 4),
                const Text(
                  '45% complété',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ✅ Statistiques
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _ProfileStat(icon: Icons.star, value: '120', label: 'XP'),
                _ProfileStat(
                  icon: Icons.local_fire_department,
                  value: '8',
                  label: 'Séries',
                ),
                _ProfileStat(
                  icon: Icons.emoji_events,
                  value: '5',
                  label: 'Badges',
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ✅ Bouton modifier profil
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Logique de modification profil
              },
              icon: const Icon(Icons.edit),
              label: const Text(
                'Modifier mon profil',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ✅ Mes badges CENTRÉS dans la carte
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Mes badges',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 12,
                    children: const [
                      _BadgeItem(icon: Icons.emoji_events, label: 'Champion'),
                      _BadgeItem(icon: Icons.bolt, label: 'Rapide'),
                      _BadgeItem(icon: Icons.shield, label: 'Régulier'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ✅ Membre depuis
            Text(
              'Membre depuis Janvier 2024',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 24),

            // ✅ Déconnexion
            TextButton.icon(
              onPressed: () {
                // TODO: Déconnexion logique
              },
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                'Déconnexion',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _ProfileStat({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.blueAccent),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _BadgeItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BadgeItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blueAccent.withOpacity(0.1),
          child: Icon(icon, color: Colors.blueAccent),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
