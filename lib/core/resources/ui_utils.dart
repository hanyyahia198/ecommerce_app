import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:toastification/toastification.dart';

class UiUtils {
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Center(
            child: LoadingAnimationWidget.inkDrop(
              color: ColorManager.primary,
              size: AppSize.s50,
            ),
          ),
        );
      },
    );
  }
  static void hideLoading(BuildContext context){
    Navigator.pop(context);
  }

  static void showToast(String message, Color primaryColor, Color backGroundColor) {
    toastification.show(
      title: Text(message),
      style: ToastificationStyle.fillColored,
      primaryColor: primaryColor,
      backgroundColor: backGroundColor,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 5),
    );
    toastification.dismissAll();
  }
}
