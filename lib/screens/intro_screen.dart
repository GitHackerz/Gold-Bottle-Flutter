import 'package:bouteille_dor/core/Routes.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [
      PageViewModel(
        title: "Bienvenue sur Bouteille d’Or",
        body:
            "Déposez vos bouteilles en plastique dans nos stations intelligentes et contribuez à un monde plus propre. Chaque geste compte pour un avenir durable.",
        image: Image.asset("assets/images/intro.png", height: 300.0),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
          bodyTextStyle: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w200),
        ),
      ),
      PageViewModel(
        title: "Transformez vos bouteilles en récompenses",
        body:
            "En recyclant, gagnez des récompenses sous forme de bons d'achat ou d'argent. Avec Bouteille d’Or, vos efforts écologiques sont gratifiés.",
        image: Container(
          padding: const EdgeInsets.all(50.0),
          child: Image.asset("assets/images/intro2.png", height: 300.0),
        ),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
          bodyTextStyle: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w200),
        ),
      ),
      PageViewModel(
        title: "Suivez votre impact",
        body:
            "Voyez en temps réel combien de plastique vous avez recyclé et l’impact écologique de vos actions. Ensemble, rendons nos villes plus propres !",
        image: const Center(
          child: Text("👋", style: TextStyle(fontSize: 100.0)),
        ),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
          bodyTextStyle: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w200),
        ),
      ),
    ];

    return Scaffold(
        body: IntroductionScreen(
      globalBackgroundColor: const Color(0xFF16A666),
      pages: pages,
      onDone: () {
        Navigator.pushNamed(context, Routes.login);
      },
      onSkip: () {
        Navigator.pushNamed(context, Routes.login);
      },
      showSkipButton: true,
      skip: Text("Skip",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.secondary)),
      next: Icon(Icons.arrow_forward,
          color: Theme.of(context).colorScheme.secondary),
      done: Text("Done",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.secondary)),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: Colors.white,
        activeColor: Theme.of(context).colorScheme.secondary,
        activeSize: const Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    ));
  }
}
