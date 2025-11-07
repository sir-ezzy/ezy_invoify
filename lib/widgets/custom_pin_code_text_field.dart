import 'package:hubli/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../res/colors.dart';
import '../utils/app_text_theme.dart';

// ignore: must_be_immutable
class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    super.key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.activeColor = AppColor.primary,
    this.hintStyle,
    this.validator,
    // this.onCompleted,
  });

  final Alignment? alignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Color activeColor;

  Function(String) onChanged;

  // Function(String)? onCompleted;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => Center(
    child: Pinput(
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      // forceErrorState: true,
      disabledPinTheme: PinTheme(
        width: 50.w,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColor.primary.withValues(alpha: 0.17),
          borderRadius: BorderRadius.circular(5),
        ),
        textStyle: AppTextTheme.h2(context),
      ),
      focusedPinTheme: PinTheme(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColor.primary.withValues(alpha: 0.09),
          border: Border.all(color: activeColor),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: AppTextTheme.h2(context).copyWith(color: AppColor.primary),
      ),
      defaultPinTheme: PinTheme(
        width: 50.w,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        height: 50.h,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColor.white.withValues(alpha: 0.17)
              : AppColor.primary.withValues(alpha: 0.09),
          // border: Border.all(color: activeColor),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: AppTextTheme.h2(context).copyWith(color: AppColor.primary),
      ),
      errorPinTheme: PinTheme(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.09),
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(5),
        ),
        textStyle: AppTextTheme.h2(context),
      ),
      length: 4,
      animationDuration: const Duration(milliseconds: 400),
      obscureText: false,
      controller: controller,
      onCompleted: (val) {
        onChanged(val);
      },
    ),
  );
}
