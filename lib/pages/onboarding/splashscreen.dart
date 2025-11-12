import 'package:ezy_invoify/utils/app_text_theme.dart';
import 'package:ezy_invoify/utils/size_config.dart';
import 'package:ezy_invoify/utils/size_extension.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/theme.png', height: 100.h, width: 100.w),
            Text(
              'Welcome to Ezy Invoify',
              style: AppTextTheme.h2.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 3), () {
  //     if (LocalStorage.isFirstTime() == true) {
  //       Get.offNamed(AppRoutes.onboardingPage);
  //     } else {
  //       Get.offNamed(AppRoutes.getStartedPage);
  //     }
  //   });
  // }
}
