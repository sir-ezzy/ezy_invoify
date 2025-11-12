import 'package:ezy_invoify/utils/app_text_theme.dart';
import 'package:ezy_invoify/utils/size_extension.dart';
import 'package:ezy_invoify/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class UnauthWidget extends StatelessWidget {
  const UnauthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You are not logged in yet',
              style: AppTextTheme.h3.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(height: 15.h),
            PlatButton(
              width: 200.w,
              isEnabled: true,
              height: 40.h,
              title: "Login",
              onTap: () {
                // Get.toNamed(AppRoutes.loginPage);
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Get.toNamed(AppRoutes.registerPage);
              },
              child: Text(
                'Register',
                style: AppTextTheme.h4.copyWith(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnauthWidgetDialog extends StatelessWidget {
  const UnauthWidgetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You are not logged in yet',
              textAlign: TextAlign.center,
              style: AppTextTheme.h3.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(height: 15.h),
            PlatButton(
              width: 200.w,
              isEnabled: true,
              height: 40.h,
              title: "Login",
              onTap: () {
                // Get.toNamed(AppRoutes.loginPage);
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Get.toNamed(AppRoutes.registerPage);
              },
              child: Text(
                'Register',
                style: AppTextTheme.h4.copyWith(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
