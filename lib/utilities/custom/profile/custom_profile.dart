import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_mask/widget_mask.dart';

class CustomProfile {

  String type;
  RxString imagePath;

  CustomProfile({
    required this.type,
    required this.imagePath,
  });

  void profile() {
    switch (type) {
      case "basic":
        active();
        break;
      case "active":
        break;
      case "study":
        break;
      case "alone":
        break;
      case "help":
        break;
    }
  }

  Widget active() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 190,
          child: Image.asset(
            'assets/images/profile_bg_type_$type.png',
            fit: BoxFit.cover,
          ),
        ),
        WidgetMask(
          blendMode: BlendMode.srcATop,
          childSaveLayer: true,
          mask: Image.file(
            File(
              imagePath.value,
            ),
            fit: BoxFit.cover,
          ),
          child: Image.asset(
            'assets/images/profile_type_$type.png',
            fit: BoxFit.cover,
            width: 170,
          ),
        ),
      ],
    );
  }


}