import 'package:bouteille_dor/core/routes.dart';
import 'package:bouteille_dor/screens/auth/forgot_password.dart';
import 'package:bouteille_dor/screens/auth/sign_in_screen.dart';
import 'package:bouteille_dor/screens/auth/sign_up_screen.dart';
import 'package:bouteille_dor/screens/intro_screen.dart';
import 'package:bouteille_dor/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: const Color(0XFF18BF67),
          onPrimary: const Color(0xFFE9FAF1),
          seedColor: const Color(0xFF16A666),
          secondary: const Color(0xFFECEFF4),
          onSecondary: const Color(0xFF2E2E2F),
          surface: const Color(0xFFF9FAFC),
          onSurface: const Color(0xFF2F2F2F),
        ),
        useMaterial3: true,
      ),
      routes: {
        Routes.intro: (context) => const IntroScreen(),
        Routes.login: (context) => const SignInScreen(),
        Routes.forgotPassword: (context) => const ForgotPassword(),
        Routes.register: (context) => const SignUpScreen(),
        Routes.main: (context) => const MainScreen(),
      },
      initialRoute: Routes.intro,
    );
  }
}
