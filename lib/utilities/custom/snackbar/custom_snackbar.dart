import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/utilities/custom/color/custom_color.dart';

class CustomSnackBar {

  String title;
  final String message;
  Color color;
  IconData icon;

  CustomSnackBar({
    this.title = "실패!",
    required this.message,
    this.color = ContentsColors.redColor,
    this.icon = Icons.error,
  });

  void snackBarError() {

    Get.showSnackbar(
        GetBar(
          title: title,
          message: message,
          backgroundColor: color,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          shouldIconPulse: false,
          duration: const Duration(milliseconds: 1500),
          borderRadius: 10,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          snackPosition: SnackPosition.TOP,
        )
    );

  }

  void snackBarSuccess() {

    title = "성공!";
    color = ContentsColors.greenColor;
    icon = Icons.check_circle;

    Get.showSnackbar(
        GetBar(
          title: title,
          message: message,
          backgroundColor: color,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          shouldIconPulse: false,
          duration: const Duration(milliseconds: 1500),
          borderRadius: 10,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          snackPosition: SnackPosition.TOP,
        )
    );

  }

}