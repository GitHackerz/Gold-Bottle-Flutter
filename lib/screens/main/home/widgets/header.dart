import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Habib",
                style: TextStyle(
                  fontSize: 16.0,
                )),
            Text("Welcome Back!",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        const Spacer(),
        // Notifications icon
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            Icons.notifications,
            color: Theme.of(context).colorScheme.primary,
            size: 28.0,
          ),
        )
      ],
    );
  }
}
