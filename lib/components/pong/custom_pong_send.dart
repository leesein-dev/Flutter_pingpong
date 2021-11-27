import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/color/custom_color.dart';
import 'package:pingpong/components/pong/custom_pong.dart';
import 'package:pingpong/components/pong/custom_pong_detail.dart';
import 'package:pingpong/controller/pong_send_controller.dart';

class SendPong extends StatefulWidget {
  const SendPong({Key? key}) : super(key: key);

  @override
  State<SendPong> createState() => _SendPongState();
}

class _SendPongState extends State<SendPong> {
  Offset cardOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PongSendController>(
      id: 'PongSend',
      init: PongSendController(),
      builder: (controller) => SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Positioned.fill(
              top: Get.height * 0.08,
              // left: Get.width * 0.45,
              child: Column(
                children: const [
                  Icon(
                    Icons.arrow_drop_up_outlined,
                  ),
                  Text(
                    'Keep',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '나중에 볼게요',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: cardOffset.dy + Get.height * 0.25,
              right: cardOffset.dx + Get.width * 0.125,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    cardOffset = Offset(cardOffset.dx - details.delta.dx,
                        cardOffset.dy + details.delta.dy);
                  });
                },
                onPanEnd: (details) {
                  setState(() {
                    cardOffset =
                        Offset(cardOffset.dx, cardOffset.dy - Get.height);
                    controller.gotoHome();
                  });
                },
                child: Stack(
                  children: [
                    const CardPong(),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          child: const Icon(
                            Icons.file_download_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: Get.height * 0.08,
              left: Get.width * 0.35,
              child: Column(
                children: const [
                  Text(
                    'Ping!',
                    style: TextStyle(
                      color: ContentsColors.redColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '나도 답장할래요!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    color: ContentsColors.redColor,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: controller.isProfileDetail,
              child: PongDetailProfile(
                onTab: () {
                  controller.profileDetail();
                },
              ),
            ),
            Visibility(
              visible: controller.isDownLoadDetail,
              child: PongDownload(
                onTab: () {
                  controller.downloadDetail();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
