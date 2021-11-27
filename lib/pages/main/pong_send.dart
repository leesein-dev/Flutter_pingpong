import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/pong/custom_pong_send.dart';
import 'package:pingpong/controller/pong_send_controller.dart';

class PongSend extends StatelessWidget {
  const PongSend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PongSendController>(
      id: 'PongSend',
      init: PongSendController(),
      builder: (controller) =>
          NotificationListener<OverscrollIndicatorNotification>(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipOval(
                          child: Container(
                            height: Get.height * 0.17,
                            width: Get.width * 0.75,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/home_drag_zone_green.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            height: Get.height * 0.17,
                            width: Get.width * 0.75,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/home_drag_zone_yellow.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SendPong(),
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
