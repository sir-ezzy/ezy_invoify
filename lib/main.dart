import 'package:ezy_invoify/pages/onboarding/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ezy Invoify',
      debugShowCheckedModeBanner: false,
      home: const Splashscreen(),
    );
  }
}
