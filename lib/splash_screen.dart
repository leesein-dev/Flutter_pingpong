import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/image/custom_logo_image.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(milliseconds: 1500), () => Get.offAndToNamed('/home'));
  }

  @override
  void onClose() {
    super.onClose();
  }

}

class BasicSplashScreen extends StatelessWidget {
  const BasicSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SplashController>(
      id: 'SplashBasic',
      init: SplashController(),
      builder: (context) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/splash_background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class PingSplashScreen extends StatelessWidget {
  const PingSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/splash_background.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: LogoImg(
            image: "assets/images/ping_logo.png",
          ),
        ),
      ),
    );
  }
}

class PongSplashScreen extends StatelessWidget {
  const PongSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/splash_background.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: LogoImg(
            image: "assets/images/pong_logo.png",
          ),
        ),
      ),
    );
  }
}
