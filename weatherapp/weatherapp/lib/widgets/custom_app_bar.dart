import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:weatherapp/constants/app_color.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/constants/app_styles.dart';

import '../constants/app_size_value.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeadingPressed;
  final Widget? actionIcon;
  final VoidCallback? onActionPressed;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool automaticallyImplyLeading;
  final Widget? bottomWidget;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onLeadingPressed,
    this.actionIcon,
    this.onActionPressed,
    this.backgroundColor,
    this.titleColor,
    this.automaticallyImplyLeading = true,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    bool shouldShowBackButton =
        automaticallyImplyLeading && ModalRoute.of(context)?.canPop == true;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.background,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     offset: Offset(1, 1),
        //     blurRadius: 10,
        //     spreadRadius: 0,
        //   ),
        // ],
      ),
      child: Column(
        children: [
          AppBar(
            surfaceTintColor: Colors.transparent,
            // shadowColor: Color.fromRGBO(0, 0, 0, 0.1),
            backgroundColor: backgroundColor ?? AppColor.background,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,

            leading: shouldShowBackButton
                ? IconButton(
                    onPressed: onLeadingPressed ?? () => Get.back(),
                    padding: EdgeInsets.only(left: AppPadding.vp12),
                    alignment: Alignment.center,
                    splashRadius: AppSize.w56,
                    icon: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.black,
                          size: AppSize.h24,
                        ),
                      ],
                    ),
                  )
                : null,
            title: Text(
              title,
              style: getLargeTextStyle(
                color: titleColor ?? AppColor.black,
                fontSize: AppFontSize.xLarge,
              ),
            ),
            actions: actionIcon != null
                ? [
                    IconButton(
                      onPressed: onActionPressed,
                      icon: actionIcon!,
                      splashRadius: AppSize.w24,
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(width: AppSpacing.hs8),
                  ]
                : null,
          ),
          // Add bottom widget only if it exists
          if (bottomWidget != null) bottomWidget!,
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(bottomWidget != null ? AppSize.h180 : kToolbarHeight);
}
