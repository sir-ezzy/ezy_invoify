import 'package:hubli/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../res/colors.dart';
import '../utils/app_text_theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.readOnly = false,
    this.borderSide,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.horizPadding = 11,
    this.vertPadding = 18,
    this.prefix,
    this.prefixConstraints,
    this.formatters,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor = AppColor.primary,
    this.filled = true,
    this.validator,
  });

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final bool readOnly;

  final FocusNode? focusNode;

  final bool? autofocus;

  final List<TextInputFormatter>? formatters;
  final TextStyle? textStyle;

  final bool? obscureText;

  final double horizPadding;
  final double vertPadding;

  final TextAlignVertical textAlignVertical;
  final TextAlign textAlign;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final BorderSide? borderSide;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
    width: width ?? double.maxFinite,
    child: TextFormField(
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
      ),
      controller: controller,
      focusNode: focusNode,
      onChanged: (str) {},
      onTapOutside: (event) {
        if (focusNode != null) {
          focusNode?.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      inputFormatters: formatters,
      autofocus: autofocus!,
      style: textStyle ?? AppTextTheme.nh4.copyWith(color: AppColor.grey),
      obscureText: obscureText!,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      readOnly: readOnly,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,
    ),
  );
  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle:
        hintStyle ??
        AppTextTheme.nh4.copyWith(color: AppColor.grey.withAlpha(200)),
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding:
        contentPadding ??
        EdgeInsets.symmetric(
          horizontal: horizPadding.w,
          vertical: vertPadding.h,
        ),
    fillColor: fillColor,
    filled: filled,
    border:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColor.grey, width: 1),
        ),
    enabledBorder:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.grey.withAlpha(80), width: 1),
        ),
    focusedBorder:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColor.grey, width: 1),
        ),
  );
}

Widget buildTextField({
  required BuildContext context,
  required TextEditingController controller,
  List<TextInputFormatter>? formatters,
  bool obscure = false,
  bool filled = false,
  required String hint,
  required String label,
  int lines = 1,
  Widget? suffix,
  bool readOnly = false,
  TextInputType type = TextInputType.name,
  required FormFieldValidator<String>? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        hint,
        style: AppTextTheme.h4(context).copyWith(fontWeight: FontWeight.w600),
      ),
      SizedBox(height: 12.h),
      CustomTextFormField(
        readOnly: readOnly,
        controller: controller,
        textInputType: type,
        formatters: formatters,
        hintText: label,
        obscureText: obscure,
        maxLines: lines,
        filled: filled,
        suffix: suffix,
        validator: validator,
      ),
    ],
  );
}

Widget buildTextField2({
  required TextEditingController controller,
  List<TextInputFormatter>? formatters,
  bool obscure = false,
  required String hint,
  required String label,
  Function(String)? onChanged,
  int lines = 1,
  bool readOnly = false,
  TextInputType type = TextInputType.name,
  required FormFieldValidator<String>? validator,
}) {
  return CustomTextFormField(
    readOnly: readOnly,
    controller: controller,
    textInputType: type,
    formatters: formatters,
    hintText: label,
    obscureText: obscure,
    maxLines: lines,
    validator: validator,
  );
}
