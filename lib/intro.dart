import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/image/custom_logo_image.dart';

class IntroController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    // Timer(const Duration(milliseconds: 2000),
    //         () => Get.offAllNamed('/auth/signup/nickname')
    // );
    Timer(const Duration(milliseconds: 2000),
            () => Get.offAllNamed('/home')
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

}

class Intro extends StatelessWidget {

  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(IntroController());

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LogoImg(),
      ),
    );
  }
}
