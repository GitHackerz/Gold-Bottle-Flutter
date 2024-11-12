import 'package:bouteille_dor/core/Routes.dart';
import 'package:flutter/material.dart';

import '../widgets/social_buttons.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFFFFF),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFFD6DFFF),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Image.asset("assets/images/signin.png", height: 70.0),
            ),
            const Text("Sign In",
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2A4ECA))),
            const Text(
              "Welcome back! Sign in to continue.",
              style: TextStyle(fontSize: 14, color: Color(0xFF61677D)),
            ),
            const SocialButtons(),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1.0,
                    color: const Color(0xFFD6DFFF),
                  ),
                ),
                const SizedBox(width: 10.0),
                const Text(
                  "OR",
                  style: TextStyle(color: Color(0xFF61677D)),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 1.0,
                    color: const Color(0xFFD6DFFF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            const PasswordField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.forgotPassword);
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Color(0xFF7C8BA0),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.main);
                      },
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15.0)),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16.0,
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Color(0xFF7C8BA0)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Color(0xFF2A4ECA), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _toggleVisibility,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
