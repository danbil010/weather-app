
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/constants/app_color.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/constants/app_size_value.dart';
import 'package:weatherapp/constants/app_styles.dart';
import 'package:weatherapp/widgets/custom_button.dart';
import 'package:weatherapp/constants/app_string.dart';

// Default dialog
void showDefaultDialog(
    {String? title, String? middleText, String? buttonText}) {
  Get.generalDialog(
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(title ?? '',
              textAlign: TextAlign.center,
              style: getLargeTextStyle(
                color: AppColor.black,
                fontSize: AppFontSize.large,
              )),
          content: Text(middleText ?? '',
              textAlign: TextAlign.center,
              style: getMediumTextStyle(
                  color: AppColor.darkGrey, fontSize: AppFontSize.medium)),
          actions: [
            Center(
              child: CustomButton(
                onPressed: () => Get.back(),
                backgroundColor: AppColor.weatherBlue,
                text: buttonText ?? '',
              ),
            ),
          ],
          contentPadding: middleText != null
              ? EdgeInsets.symmetric(
                  vertical: AppPadding.vp16, horizontal: AppPadding.hp8)
              : EdgeInsets.zero,
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: child,
      );
    },
  );
}

// Success Dialog
void showSuccessDialog(
    {String? title, String? middleText, String? buttonText}) {
  Get.generalDialog(
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(title ?? AppStrings.success,
              textAlign: TextAlign.center,
              style: getLargeTextStyle(
                color: AppColor.black,
                fontSize: AppFontSize.large,
              )),
          content: Text(middleText ?? '',
              textAlign: TextAlign.center,
              style: getMediumTextStyle(
                  color: AppColor.darkGrey, fontSize: AppFontSize.medium)),
          actions: [
            Center(
              child: CustomButton(
                onPressed: () => Get.back(),
                backgroundColor: AppColor.green,
                text: buttonText ?? AppStrings.ok,
              ),
            ),
          ],
          contentPadding: middleText != null
              ? EdgeInsets.symmetric(
                  vertical: AppPadding.vp16, horizontal: AppPadding.hp12)
              : EdgeInsets.zero,
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: child,
      );
    },
  );
}

// Error Dialog
void showErrorDialog({String? title, String? middleText, String? buttonText}) {
  Get.generalDialog(
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(title ?? AppStrings.error,
              textAlign: TextAlign.center,
              style: getLargeTextStyle(
                color: AppColor.black,
                fontSize: AppFontSize.large,
              )),
          content: Text(middleText ?? AppStrings.anErrorOccurred,
              textAlign: TextAlign.center,
              style: getMediumTextStyle(
                  color: AppColor.darkGrey, fontSize: AppFontSize.medium)),
          actions: [
            Center(
              child: CustomButton(
                onPressed: () => Get.back(),
                backgroundColor: AppColor.red, // Color to indicate error
                text: buttonText ?? AppStrings.retry,
              ),
            ),
          ],
          contentPadding: middleText != null
              ? EdgeInsets.symmetric(
                  vertical: AppPadding.vp16, horizontal: AppPadding.hp10)
              : EdgeInsets.symmetric(
                  vertical: AppPadding.vp12, horizontal: AppPadding.hp10),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: child,
      );
    },
  );
}

// Loading Dialog
void showLoadingDialog({String? title, String? middleText}) {
  Get.generalDialog(
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(title ?? AppStrings.loading,
              textAlign: TextAlign.center,
              style: getLargeTextStyle(
                color: AppColor.black,
                fontSize: AppFontSize.large,
              )),
          content: CircularProgressIndicator(color: AppColor.weatherBlue),
          actions: [],
          contentPadding: EdgeInsets.symmetric(vertical: AppPadding.vp16),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: child,
      );
    },
  );
}

void showConfirmationDialog({
  String? title,
  String? subtitle,
  String cancelText = AppStrings.cancel,
  String deleteText = AppStrings.delete,
  VoidCallback? onDelete,
  VoidCallback? onClose,
}) {
  Get.generalDialog(
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            title ?? AppStrings.areYouSure,
            textAlign: TextAlign.center,
            style: getExtraLargeTextStyle(
              color: AppColor.black,
              fontSize: AppFontSize.large,
            ),
          ),
          content: Text(
            subtitle ?? AppStrings.deleteItemConfirmation,
            textAlign: TextAlign.center,
            style: getMediumTextStyle(
              color: AppColor.darkGrey,
              fontSize: AppFontSize.medium,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () => onClose != null ? onClose() : Get.back(),
                    backgroundColor: AppColor.white,
                    borderColor: AppColor.weatherBlue,
                    textColor: AppColor.weatherBlue,
                    text: cancelText,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Get.back();
                      if (onDelete != null) onDelete();
                    },
                    backgroundColor: AppColor.weatherBlue,
                    textColor: AppColor.white,
                    text: deleteText,
                  ),
                ),
              ],
            ),
          ],
          contentPadding: EdgeInsets.symmetric(
            vertical: AppPadding.vp16,
            horizontal: AppPadding.hp12,
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: child,
      );
    },
  );
}
