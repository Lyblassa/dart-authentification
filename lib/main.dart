import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ✅ Ajoute ça
import 'screens/auth_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/home_screen.dart';
import 'screens/tests_pages/test_exp_ecrite_step1_page.dart';
import 'screens/tests_pages/test_exp_ecrite_step2_page.dart';
import 'screens/tests_pages/test_exp_ecrite_step3_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: appProviders, // ✅ Tu réutilises ta liste
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        390,
        844,
      ), // ✅ Remplace par ta base Figma si besoin
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Mon App Auth',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          initialRoute: '/',
          routes: {
            '/': (context) => const IntroScreen(),
            '/auth': (context) => const AuthScreen(),
            '/home': (context) => const HomeScreen(),
            '/step1': (context) => const TestExpEcriteStep1Page(),
            '/step2': (context) => const TestExpEcriteStep2Page(),
            '/step3': (context) => const TestExpEcriteStep3Page(),
          },
        );
      },
    );
  }
}
