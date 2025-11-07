import 'package:flutter/material.dart';

class OnboadingScreen extends StatelessWidget {
  const OnboadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text('Onboarding Screen', style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
