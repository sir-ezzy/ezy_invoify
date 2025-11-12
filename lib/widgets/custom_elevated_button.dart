import 'package:ezy_invoify/utils/size_extension.dart';
import 'package:ezy_invoify/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import '../res/colors.dart';
import '../utils/app_state.dart';
import '../utils/app_text_theme.dart';

class PlatButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final double width, height, radius, textSize, padding, iconSize, spacing;
  final Color? iconColor, color, textColor;
  final bool isEnabled;
  final Color progressColor;
  final Widget? icon;
  final AppState appState;
  const PlatButton({
    this.icon,
    this.radius = 20,
    this.appState = AppState.idle,
    this.isEnabled = false,
    this.width = double.maxFinite,
    this.height = 54,
    this.progressColor = Colors.white,
    this.color = AppColor.primary,
    this.textColor = AppColor.white,
    this.iconColor,
    required this.title,
    required this.onTap,
    this.textSize = 18,
    this.iconSize = 17,
    this.padding = 0,
    this.spacing = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: appState == AppState.busy || isEnabled == false ? null : onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: isEnabled ? color : color!.withAlpha(120),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: appState == AppState.busy
                ? SizedBox(
                    height: 13.h,
                    width: 13.w,
                    child: const buildLoadingIndicator(color: AppColor.white),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: AppTextTheme.h3.copyWith(
                          fontSize: textSize.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              textColor ??
                              (onTap == null
                                  ? const Color(0xff797979)
                                  : AppColor.white),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class PlatButtonBorder extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color progressColor;
  final bool isEnabled;
  final AppState appState;
  final double width, height, radius, textSize, padding, iconSize, spacing;
  final Color color, textColor;
  const PlatButtonBorder({
    this.radius = 40,
    this.width = double.maxFinite,
    this.height = 54,
    this.appState = AppState.idle,
    this.progressColor = AppColor.white,
    this.isEnabled = false,
    this.color = AppColor.white,
    this.textColor = AppColor.white,
    required this.title,
    this.onTap,
    this.textSize = 18,
    this.iconSize = 17,
    this.padding = 10,
    this.spacing = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: appState == AppState.busy || isEnabled == false ? null : onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: color.withAlpha(120)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: appState == AppState.busy
                ? SizedBox(
                    height: 13.h,
                    width: 13.w,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(progressColor),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: AppTextTheme.h3.copyWith(
                          fontSize: textSize.sp,
                          fontWeight: FontWeight.w500,
                          color: isEnabled
                              ? textColor
                              : textColor.withAlpha(100),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
