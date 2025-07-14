import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

// ✅ Pages importées
import 'accueil_page.dart';
import 'tests_page.dart';
import 'cafe_page.dart';
import 'RdvTcfPage.dart'; // ✅ Nouvelle page RDV TCF
import 'profil_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    AccueilPage(),
    TestsPage(),
    CafePage(),
    RdvTcfPage(), // ✅ Ajout de ta page RDV TCF
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
