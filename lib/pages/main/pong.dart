import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/pong/custom_pong.dart';

class PongController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(milliseconds: 2500), () => Get.offAndToNamed('/pong/send'));
  }

  @override
  void onClose() {
    super.onClose();
  }

}

class Pong extends StatelessWidget {
  const Pong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PongController>(
      id: 'Pong',
      init: PongController(),
      builder: (controller) =>
          Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: const [
                        Text(
                          '1Pong!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mont',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\u{1F4AC} 누군가에게 밈이 날아왔어요',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const CardPong(),
                    ClipOval(
                      child: Container(
                        height: Get.height * 0.17,
                        width: Get.width * 0.75,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/drag_zone_yellow.png",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
