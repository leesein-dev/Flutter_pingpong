import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/color/custom_color.dart';
import 'package:pingpong/components/ping/custom_ping.dart';
import 'package:pingpong/controller/ping_controller.dart';

class Ping extends StatelessWidget {
  const Ping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PingController>(
      id: 'Ping',
      init: PingController(),
      builder: (controller) =>
          NotificationListener<OverscrollIndicatorNotification>(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.arrow_back_ios,
                              ),
                              Text(
                                'Ping!',
                                style: TextStyle(
                                  fontFamily: 'Mont',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.check_outlined,
                            color: ContentsColors.redColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  const TextPing(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60.0,
                      left: 40.0,
                      right: 40.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/ping/ping_text.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 50,
                            height: 60,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/ping/ping_favorite.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 50,
                            height: 60,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/ping/ping_all.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.getImageFromGallery();
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/ping/ping_camera.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
