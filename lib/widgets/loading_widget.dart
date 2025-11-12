import 'package:ezy_invoify/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../res/colors.dart';

// ignore: camel_case_types
class buildLoadingIndicator extends StatelessWidget {
  final Color color;
  final double height;

  const buildLoadingIndicator({
    super.key,
    this.color = AppColor.primary,
    this.height = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.hexagonDots(color: color, size: height.h),
    );
  }
}
