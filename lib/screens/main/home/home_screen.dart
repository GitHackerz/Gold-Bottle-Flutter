import 'package:bouteille_dor/screens/main/home/widgets/header.dart';
import 'package:bouteille_dor/screens/main/home/widgets/news.dart';
import 'package:bouteille_dor/screens/main/home/widgets/summary.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 26, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const SizedBox(height: 20.0),
            const SummaryCard(),
            const SizedBox(height: 20.0),
            const Text("Latest News",
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            News()
          ],
        ),
      ),
    ));
  }
}
