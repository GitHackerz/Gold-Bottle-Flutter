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
        title: "Title of introduction page",
        body: "Welcome to the app! This is a description of how it works.",
        image: Image.asset("assets/images/intro.png", height: 300.0),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
          bodyTextStyle: TextStyle(
              color: Color(0xFFC8D2DE),
              fontSize: 16.0,
              fontWeight: FontWeight.w200),
        ),
      ),
      PageViewModel(
        title: "Title of blue page",
        body:
            "Welcome to the app! This is a description on a page with a blue background.",
        image: Container(
          padding: const EdgeInsets.all(50.0),
          child: Image.asset("assets/images/intro2.png", height: 300.0),
        ),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
          bodyTextStyle: TextStyle(
              color: Color(0xFFC8D2DE),
              fontSize: 16.0,
              fontWeight: FontWeight.w200),
        ),
      ),
      PageViewModel(
        title: "Title of orange text and bold page",
        body:
            "This is a description on a page with an orange title and bold, big body.",
        image: const Center(
          child: Text("👋", style: TextStyle(fontSize: 100.0)),
        ),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
          bodyTextStyle: TextStyle(
              color: Color(0xFFC8D2DE),
              fontSize: 16.0,
              fontWeight: FontWeight.w200),
        ),
      ),
    ];

    return Scaffold(
        body: IntroductionScreen(
      globalBackgroundColor: const Color(0xFF3B4054),
      pages: pages,
      onDone: () {
        Navigator.pushNamed(context, Routes.login);
      },
      onSkip: () {
        Navigator.pushNamed(context, Routes.login);
      },
      showSkipButton: true,
      skip: const Text("Skip",
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.blueAccent)),
      next: const Icon(Icons.arrow_forward, color: Colors.blueAccent),
      done: const Text("Done",
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.blueAccent)),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: Colors.white,
        activeColor: Colors.blueAccent,
        activeSize: const Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    ));
  }
}
