import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_color.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/constants/app_styles.dart';
import 'package:weatherapp/constants/app_size_value.dart';

class CustomSearchField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final Color? hintColor;
  final Color? iconColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onSubmitted;

  const CustomSearchField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.hintColor,
    this.iconColor,
    this.borderRadius,
    this.contentPadding,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColor.lightGrey,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 25),
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            _isFocused = hasFocus;
          });
        },
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: getMediumTextStyle(
              color: _isFocused ? AppColor.weatherBlue : (widget.hintColor ?? AppColor.grey),
              fontSize: AppFontSize.medium,
            ),
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: _isFocused ? AppColor.weatherBlue : (widget.iconColor ?? AppColor.grey),
                  )
                : null,
            filled: false,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 25),
              borderSide: BorderSide(color: AppColor.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 25),
              borderSide: BorderSide(color: AppColor.weatherBlue, width: 2),
            ),
            contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(
              horizontal: AppSize.w16,
              vertical: AppSize.h12,
            ),
          ),
          onFieldSubmitted: widget.onSubmitted,
        ),
      ),
    );
  }
} 