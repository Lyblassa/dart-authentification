import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/top_bar.dart';

class CafePage extends StatefulWidget {
  const CafePage({super.key});

  @override
  State<CafePage> createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  String selectedAmount = '5 CAD'; // ✅ Valeur par défaut sélectionnée

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBFD),
      appBar: const TopBar(), // ✅ FIXE ET UNIFORME
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 6), // 👈 plus joli sans trop coller

            const Text(
              'Offre-nous un café',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              'Montre ton soutien en nous offrant\nun café via PayPal !',
              style: TextStyle(fontFamily: 'Nunito', fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _AmountButton(
                  amount: '3 CAD',
                  isSelected: selectedAmount == '3 CAD',
                  onTap: () {
                    setState(() {
                      selectedAmount = '3 CAD';
                    });
                  },
                ),
                const SizedBox(width: 12),
                _AmountButton(
                  amount: '5 CAD',
                  isSelected: selectedAmount == '5 CAD',
                  onTap: () {
                    setState(() {
                      selectedAmount = '5 CAD';
                    });
                  },
                ),
                const SizedBox(width: 12),
                _AmountButton(
                  amount: '10 CAD',
                  isSelected: selectedAmount == '10 CAD',
                  onTap: () {
                    setState(() {
                      selectedAmount = '10 CAD';
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            Lottie.asset(
              'lib/assets/animations/chatcafe.json',
              width: 480,
              height: 250,
            ),

            const SizedBox(height: 32),

            _DonateButton(
              icon: Icons.payment,
              text: 'Donner via PayPal',
              color: Colors.blue,
              onPressed: () {
                debugPrint('Montant sélectionné : $selectedAmount');
                // TODO: Ajouter redirection PayPal
              },
            ),
            const SizedBox(height: 12),
            _DonateButton(
              icon: Icons.apple,
              text: 'Donner via Apple Pay',
              color: Colors.black,
              onPressed: () {
                debugPrint('Montant sélectionné : $selectedAmount');
                // TODO: Ajouter action Apple Pay
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AmountButton extends StatelessWidget {
  final String amount;
  final bool isSelected;
  final VoidCallback onTap;

  const _AmountButton({
    required this.amount,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          amount,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class _DonateButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const _DonateButton({
    required this.icon,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: color == Colors.black
              ? const BorderSide(color: Colors.black, width: 2)
              : BorderSide.none,
        ),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
