import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/ping/custom_ping_send.dart';
import 'package:pingpong/controller/ping_controller.dart';

class PingSend extends StatelessWidget {
  const PingSend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PingController>(
      id: 'PingSend',
      init: PingController(),
      builder: (controller) =>
          NotificationListener<OverscrollIndicatorNotification>(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Center(
                child: Column(
                  children: [
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
              const SendPing(),
            ],
          ),
        ),
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowGlow();
          return false;
        },
      ),
    );
  }
}
