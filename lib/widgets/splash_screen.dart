import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hubli/utils/size_extension.dart';

import '../../../res/colors.dart';
import '../../../routes/app_routes.dart';
import '../../../services/localStorage/local_storage.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Image.asset(
          AppImages.hubliSplash,
          height: 100.h,
          width: 150.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (LocalStorage.isFirstTime() == true) {
        Get.offNamed(AppRoutes.onboardingPage);
      } else {
        Get.offNamed(AppRoutes.getStartedPage);
      }
    });
  }
}
