import 'package:flutter/material.dart';

const _nunito = TextStyle(fontFamily: 'Nunito');

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const BottomNav({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex.clamp(0, 4),
        onTap: onTap,
        backgroundColor: Colors.transparent, // important pour voir la shape
        elevation: 0,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey.shade500,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(size: 28),
        unselectedIconTheme: const IconThemeData(size: 24),
        selectedLabelStyle: _nunito,
        unselectedLabelStyle: _nunito,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: "Tests",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.local_cafe), label: "Café"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "RDV TCF",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
