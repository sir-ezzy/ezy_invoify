import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:hubli/utils/size_extension.dart';
import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../utils/app_text_theme.dart';

class DropdownValue<T> {
  final T? value;
  final String? label;
  const DropdownValue({this.value, this.label});
}

class MyDropdown<T> extends StatefulWidget {
  final DropdownValue<T>? value;
  final Function(T? value)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final double? height;
  final double? maxHeight;
  final double? dropdownWidth;
  final bool isExpanded;
  final Color? iconColors;
  final DropdownSearchData<T>? dropdownSearchData;
  final Color? borderColor;
  final Color? fillColor;
  final String? hint;
  final String? label;
  final Widget? hintWidget;
  final double? hintFontSize;
  final Widget? selectedItemWidget;
  final FocusNode? focusNode;
  final String? Function(T? value)? validator;
  final BorderRadius? borderRadius;
  final bool hideArrow;
  final List<Widget> Function(BuildContext context)? selectedItemBuilder;
  final Function()? onTap;
  const MyDropdown({
    super.key,
    this.value,
    this.onChanged,
    this.items,
    this.selectedItemBuilder,
    this.height,
    this.maxHeight,
    this.isExpanded = false,
    this.iconColors,
    this.borderColor,
    this.focusNode,
    this.validator,
    this.dropdownSearchData,
    this.hint,
    this.label,
    this.fillColor,
    this.borderRadius,
    this.hideArrow = false,
    this.dropdownWidth,
    this.selectedItemWidget,
    this.hintFontSize,
    this.onTap,
    this.hintWidget,
  });

  @override
  State<MyDropdown<T>> createState() => _MyDropdownState<T>();
}

class _MyDropdownState<T> extends State<MyDropdown<T>> {
  late FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<T>(
        value: widget.value?.value,
        isExpanded: widget.isExpanded,
        selectedItemBuilder: widget.selectedItemBuilder,
        dropdownSearchData: widget.dropdownSearchData,
        onChanged: widget.onChanged,
        focusNode: _focusNode,
        validator: widget.validator,
        style: AppTextTheme.h4(
          context,
        ).copyWith(color: AppColor.black.withAlpha(100)),
        decoration: InputDecoration(
          filled: true,
          errorStyle: AppTextTheme.h4(context).copyWith(color: AppColor.grey),
          fillColor:
              widget.fillColor ?? AppColor.primary.withValues(alpha: 0.17),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: widget.iconColors ?? AppColor.black.withAlpha(100),
          ),
          openMenuIcon: Icon(
            Icons.keyboard_arrow_up_rounded,
            color: widget.iconColors ?? AppColor.black.withAlpha(100),
          ),
        ),
        customButton: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.only(
              right: 10,
              left: 2,
              top: 0,
              bottom: 0,
            ),
            height: widget.height ?? 56.h,
            margin: EdgeInsets.zero,
            child: Row(
              children: [
                Expanded(
                  child: widget.value?.value == null
                      ? (widget.hintWidget ??
                            (widget.hint != null
                                ? Text(
                                    widget.hint ?? "",
                                    style: AppTextTheme.h4(context).copyWith(
                                      color: AppColor.black.withAlpha(100),
                                    ),
                                  )
                                : const SizedBox.shrink()))
                      : widget.selectedItemWidget ??
                            Text(
                              widget.value?.label ?? "",
                              style: AppTextTheme.h4(
                                context,
                              ).copyWith(color: AppColor.black.withAlpha(100)),
                            ),
                ),
                if (!widget.hideArrow)
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: widget.iconColors ?? AppColor.black.withAlpha(100),
                  ),
              ],
            ),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          elevation: 0,
          width: widget.dropdownWidth,
          maxHeight: widget.maxHeight ?? 250.h,
          offset: Offset(0, -5.h),
          scrollbarTheme: const ScrollbarThemeData(
            trackVisibility: WidgetStatePropertyAll<bool>(true),
            thumbVisibility: WidgetStatePropertyAll<bool>(true),
          ),
          decoration: BoxDecoration(
            color: widget.fillColor ?? AppColor.primary,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(82, 93, 122, 0.19),
                spreadRadius: 0,
                blurRadius: 31.31,
                offset: Offset(0, 7.22),
              ),
            ],
            border: Border.all(color: widget.borderColor ?? AppColor.primary),
          ),
        ),
        items: widget.items,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) {
      _focusNode = FocusNode();
    } else {
      _focusNode = widget.focusNode!;
    }

    _focusNode.addListener(() {
      // isFocus = !isFocus;
      setState(() {});
    });
  }
}
