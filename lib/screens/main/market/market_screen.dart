import 'package:bouteille_dor/screens/main/market/widgets/header.dart';
import 'package:bouteille_dor/screens/main/market/widgets/partners.dart';
import 'package:bouteille_dor/screens/main/market/widgets/products.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen>
    with SingleTickerProviderStateMixin {
  final partners = [
    "assets/images/partners/sicam.png",
    "assets/images/partners/crystal.png",
    "assets/images/partners/safia.png",
    "assets/images/partners/ooredoo.png",
    "assets/images/partners/orange.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 26, 16, 24),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 20.0),
              Partners(partnerLogos: partners),
              const SizedBox(height: 20.0),
              const Expanded(
                // Wrap Products in Expanded to fill available space
                child: Products(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
