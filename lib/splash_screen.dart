import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/image/custom_logo_image.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // home 화면으로 이동
  void gotoHome() {
    Timer(const Duration(milliseconds: 1500), () => Get.offAndToNamed('/home'));
  }

  // 밈이 도착한 알림을 받으면 pong 화면으로 이동
  void gotoPong() {
    Timer(const Duration(milliseconds: 1500), () => Get.offAndToNamed('/pong'));
  }
}

// 기본 베이직 스플래시 화면
class BasicSplashScreen extends StatelessWidget {
  const BasicSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    controller.gotoHome();

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
      ),
    );
  }
}

// 핑 스플래시 화면
class PingSplashScreen extends StatelessWidget {
  const PingSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    controller.gotoHome();

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
            image: "assets/images/ping/ping_logo.png",
          ),
        ),
      ),
    );
  }
}

// 퐁 스플래시 화면
class PongSplashScreen extends StatelessWidget {
  const PongSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    controller.gotoPong();

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
            image: "assets/images/pong/pong_logo.png",
          ),
        ),
      ),
    );
  }
}
