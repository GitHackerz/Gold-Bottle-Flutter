import 'package:flutter/material.dart';

class Partners extends StatelessWidget {
  final List<String>
      partnerLogos; // Replace with URLs or Asset paths of your logos

  const Partners({required this.partnerLogos, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: partnerLogos.map((logo) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 80, // Customize width as needed
              height: 80, // Customize height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: Image.asset(logo).image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
