import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        // Page 1
        PageViewModel(
          title: "Create Professional Invoices",
          body: "Generate beautiful, customizable invoices in seconds.",
          image: Center(
            child: Image.asset("assets/intro/invoice.png", height: 280),
          ),
          decoration: pageDecoration,
        ),

        // Page 2
        PageViewModel(
          title: "Track Payments Easily",
          body: "Mark invoices as Paid, Partial, or Overdue with one tap.",
          image: Center(
            child: Image.asset("assets/intro/payment.png", height: 280),
          ),
          decoration: pageDecoration,
        ),

        // Page 3
        PageViewModel(
          title: "Manage Clients & Grow Your Business",
          body: "Keep all your clients organized and send invoices directly.",
          image: Center(
            child: Image.asset("assets/intro/clients.png", height: 280),
          ),
          decoration: pageDecoration.copyWith(
            titleTextStyle: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
            bodyTextStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
      onDone: () {
        // When user presses "Done" or "Get Started"
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      },
      showSkipButton: true,
      skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text(
        "Get Started",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(22.0, 10.0),
        activeColor: Colors.indigo,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      curve: Curves.fastOutSlowIn,
    );
  }

  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
      color: Colors.indigo,
    ),
    bodyTextStyle: TextStyle(fontSize: 18.0, height: 1.5),
    bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.only(top: 60),
  );
}
