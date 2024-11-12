import 'package:bouteille_dor/core/routes.dart';
import 'package:bouteille_dor/screens/forgot_password.dart';
import 'package:bouteille_dor/screens/intro_screen.dart';
import 'package:bouteille_dor/screens/main_screen.dart';
import 'package:bouteille_dor/screens/sign_in_screen.dart';
import 'package:bouteille_dor/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: const Color(0XFF1DD680),
          onPrimary: const Color(0xFFFFFFFF),
          seedColor: const Color(0xFF16A666),
          secondary: const Color(0xFFA8E6C1),
          onSecondary: const Color(0xFF2E7D32),
          surface: const Color(0xFFFFFFFF),
          onSurface: const Color(0xFF4E342E),
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
