
import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/constants/app_size_value.dart';
import 'package:weatherapp/constants/app_styles.dart';
import 'package:weatherapp/utils/custom_app_loader.dart';


import '../constants/app_color.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool isOutlined;
  final bool isLoading;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final bool isFullWidth;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.width,
    this.height,
    this.borderRadius,
    this.isOutlined = false,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? (isFullWidth ? double.infinity : 200), height ?? AppSize.h56),
        backgroundColor: isOutlined
            ? AppColor.primaryColor
            : (backgroundColor ?? AppColor.primaryColor),
        foregroundColor:
            textColor ?? (isOutlined ? AppColor.primaryColor : AppColor.white),
        elevation: 0,
        disabledBackgroundColor: AppColor.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? AppRadius.tiny),
          side: BorderSide(
            color: borderColor ??
                (isOutlined ? AppColor.primaryColor : Colors.transparent),
            width: 1,
          ),
        ),
        padding: padding ?? EdgeInsets.symmetric(
          horizontal: AppPadding.hp16,
          vertical: AppPadding.vp8,
        ),
      ),
      child: isLoading
          ? CustomAppLoader(
              color: AppColor.primaryColor,
              size: 30,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon!,
                  SizedBox(width: AppSpacing.hs8),
                ],
                Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize ?? AppFontSize.large,
                    fontWeight: fontWeight ?? AppFontWeight.semiBold,
                    color: textColor ??
                        (isOutlined ? AppColor.primaryColor : AppColor.white),
                    fontFamily: AppFontConstants.fontFamily,
                  ),
                ),
                if (suffixIcon != null) ...[
                  SizedBox(width: AppSpacing.hs8),
                  suffixIcon!,
                ],
              ],
            ),
    );
  }
}
