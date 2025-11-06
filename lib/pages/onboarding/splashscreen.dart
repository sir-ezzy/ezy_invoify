import 'package:ezy_invoify/utils/app_text_theme.dart';
import 'package:ezy_invoify/utils/size_config.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/theme.png'),
          Text(
            'Welcome to Ezy Invoify',
            style: AppTextTheme.h2.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
