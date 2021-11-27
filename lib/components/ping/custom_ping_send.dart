import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/color/custom_color.dart';
import 'package:pingpong/components/profile/custom_profile.dart';
import 'package:pingpong/controller/ping_controller.dart';

class SendPing extends StatefulWidget {
  const SendPing({Key? key}) : super(key: key);

  @override
  State<SendPing> createState() => _SendPingState();
}

class _SendPingState extends State<SendPing> {
  Offset cardOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PingController>(
      id: 'PingSend',
      init: PingController(),
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
                    color: ContentsColors.redColor,
                  ),
                  Text(
                    'Ping!',
                    style: TextStyle(
                      color: ContentsColors.redColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '밈을 날려요!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: cardOffset.dy + Get.height * 0.22,
              right: cardOffset.dx + Get.width * 0.17,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    cardOffset = Offset(cardOffset.dx - details.delta.dx,
                        cardOffset.dy + details.delta.dy);
                  });
                },
                onPanEnd: (details) {
                  setState(() {
                    cardOffset = Offset(cardOffset.dx,
                        cardOffset.dy - Get.height);
                    controller.pong();
                  });
                },
                child: Column(
                  children: [
                    Container(
                      width: Get.width * 0.65,
                      height: Get.height * 0.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(
                            File(controller.selectedPingImagePath.value),
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      width: Get.width * 0.65,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: const [
                          CustomProfile(
                            bgWidth: 50,
                            maskWidth: 42,
                            bgImage:
                            'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/fc81369a-29ea-4050-a40b-ec1076c48a13/profile_bg_blue_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T022236Z&X-Amz-Expires=86400&X-Amz-Signature=9803ac80073cd17784c7043acc75558f2688b841e66a4c30fcb223e632952d7b&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_blue_type_2.png%22&x-id=GetObject',
                            maskImage:
                            'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/0f74cb13-8b78-4293-9a6f-1e6df38f8239/profile_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T022256Z&X-Amz-Expires=86400&X-Amz-Signature=e3e8b1e356838b1e023d3a14b5babc8f92ae6025209a395a336f07e7f35c7b77&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_2.png%22&x-id=GetObject',
                            profileImage:
                            'https://blog.kakaocdn.net/dn/sOFQo/btqFXIdG4BC/OSX6phlqjlj7p3EYH1jZjk/img.png',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Yeini',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: Get.height * 0.08,
              left: Get.width * 0.33,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEDEDED),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
