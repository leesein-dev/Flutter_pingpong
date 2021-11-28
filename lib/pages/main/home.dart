import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/detail/custom_detail.dart';
import 'package:pingpong/controller/home_controller.dart';
import 'package:pingpong/components/color/custom_color.dart';
import 'package:pingpong/components/profile/custom_profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Offset firstOffset = Offset.zero;

  // Offset offset = const Offset(80, 20);

  bool isPing = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'Home',
      init: HomeController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: Get.height * 0.15,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipOval(
                        child: Container(
                          height: Get.height * 0.7,
                          width: Get.width * 1.7,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black12.withOpacity(0.025),
                                  Colors.black.withOpacity(0),
                                ],
                                stops: const [
                                  0.0,
                                  0.05,
                                ]),
                          ),
                        ),
                      ),
                      ClipOval(
                        child: Container(
                          height: Get.height * 0.5,
                          width: Get.width * 1.4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black12.withOpacity(0.025),
                                  Colors.black.withOpacity(0),
                                ],
                                stops: const [
                                  0.0,
                                  0.15,
                                ]),
                          ),
                        ),
                      ),
                      ClipOval(
                        child: Stack(
                          children: [
                            Blur(
                              blur: 30,
                              child: Container(
                                height: Get.width * 0.75,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.black.withOpacity(0),
                                      Colors.black12.withOpacity(0.15),
                                    ],
                                    stops: const [
                                      0.3,
                                      1,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ClipOval(
                              child: Container(
                                color: Colors.white,
                                height: Get.width * 0.74,
                                width: Get.width * 0.985,
                              ),
                            ),
                          ],
                        ),
                      ),
                      isPing
                          ? ClipOval(
                              child: Container(
                                height: Get.height * 0.16,
                                width: Get.width * 0.6,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/drag_zone_green.png",
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )
                          : ClipOval(
                              child: Container(
                                height: Get.height * 0.16,
                                width: Get.width * 0.6,
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
                Positioned(
                  bottom: Get.height * -0.18,
                  child: ClipOval(
                    child: Container(
                      color:
                          isPing ? ContentsColors.redColor : Colors.transparent,
                      height: Get.width * 0.7,
                      width: Get.width,
                    ),
                  ),
                ),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isPing
                                    ? const Text(
                                        'Hello 한국대!',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      )
                                    : const Text(
                                        'Drag!',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                const Text(
                                  '밈을 날려볼까요?',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Visibility(
                              visible: isPing,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/button_message.jpg',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CustomPositionPlace(
                            bottom: 60,
                            right: 80,
                            size: 60,
                            onTab: () {
                              controller.placeDetail();
                            },
                            unicode: '\u{1F370}',
                            visible: isPing,
                          ),
                          CustomPositionProfile(
                            bottom: firstOffset.dy + 80,
                            left: firstOffset.dx + 20,
                            onPanUpdate: (details) {
                              setState(() {
                                isPing = false;
                                firstOffset = Offset(
                                    firstOffset.dx + details.delta.dx,
                                    firstOffset.dy - details.delta.dy);
                              });
                            },
                            onTab: () {
                              controller.profileDetail();
                            },
                            bgWidth: 120,
                            maskWidth: 105,
                            bgImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/fc81369a-29ea-4050-a40b-ec1076c48a13/profile_bg_blue_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T022236Z&X-Amz-Expires=86400&X-Amz-Signature=9803ac80073cd17784c7043acc75558f2688b841e66a4c30fcb223e632952d7b&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_blue_type_2.png%22&x-id=GetObject',
                            maskImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/0f74cb13-8b78-4293-9a6f-1e6df38f8239/profile_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T022256Z&X-Amz-Expires=86400&X-Amz-Signature=e3e8b1e356838b1e023d3a14b5babc8f92ae6025209a395a336f07e7f35c7b77&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_2.png%22&x-id=GetObject',
                            profileImage:
                                'https://blog.kakaocdn.net/dn/sOFQo/btqFXIdG4BC/OSX6phlqjlj7p3EYH1jZjk/img.png',
                          ),
                          CustomPositionProfile(
                            bottom: 150,
                            right: 15,
                            onPanUpdate: (details) {},
                            onTab: () {},
                            bgWidth: 100,
                            maskWidth: 88,
                            bgImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/7655e4e2-0427-4b46-9e86-b001faa667d0/profile_bg_green_type_3.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T044820Z&X-Amz-Expires=86400&X-Amz-Signature=cd64be3fc59166cfca07dc82034835b1e2b20bb3a170af06c50418a22846435a&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_green_type_3.png%22&x-id=GetObject',
                            maskImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/4db40d67-8887-43cf-8c16-1fab15780c5c/profile_type_3.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T044743Z&X-Amz-Expires=86400&X-Amz-Signature=9bffa0fe1fa1b9d52377b39df1ab39fb2868157edd2d2814437f85ad2433ccba&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_3.png%22&x-id=GetObject',
                            profileImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/56ca53b2-d94c-4491-8dc5-d38399153deb/user_3.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045228Z&X-Amz-Expires=86400&X-Amz-Signature=16484e7dea9461354fbefefcd421463da3f4b0439b452e605a77716c666249ee&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_3.jpg%22&x-id=GetObject',
                          ),
                          CustomPositionPlace(
                            bottom: 250,
                            left: 30,
                            size: 40,
                            onTab: () {},
                            unicode: '\u{1F48E}',
                            visible: isPing,
                          ),
                          CustomPositionProfile(
                            bottom: 270,
                            left: 100,
                            onPanUpdate: (details) {},
                            onTab: () {},
                            bgWidth: 95,
                            maskWidth: 82,
                            bgImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/5a8fcda8-bddb-42d0-8e65-43ef5c18ddaa/profile_bg_red_type_4.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045008Z&X-Amz-Expires=86400&X-Amz-Signature=98102638a7522029c096814907abd837e9a61c4f9fabe1a476598c48e4e0acf7&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_red_type_4.png%22&x-id=GetObject',
                            maskImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/09193066-f8a8-4d41-8b41-7c85e3fab485/profile_type_4.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T044852Z&X-Amz-Expires=86400&X-Amz-Signature=962d6f3ae4c999f9d712816cc122d30f06a983f82de5c90348e74379b8571e08&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_4.png%22&x-id=GetObject',
                            profileImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/37813810-d6b8-479f-8374-c52588b11477/user_2.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045149Z&X-Amz-Expires=86400&X-Amz-Signature=7917ebb7675860e4376cb70e818d7408480d01846ce6ef41c6875b25eb9e8aa5&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_2.jpg%22&x-id=GetObject',
                          ),
                          CustomPositionPlace(
                            bottom: 370,
                            right: 60,
                            size: 30,
                            onTab: () {},
                            unicode: '\u{1F488}',
                            visible: isPing,
                          ),
                          CustomPositionProfile(
                            bottom: 400,
                            left: 60,
                            onPanUpdate: (details) {},
                            onTab: () {},
                            bgWidth: 85,
                            maskWidth: 72,
                            bgImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/35561510-6f72-40ab-a2bf-4463d70f9201/profile_bg_yellow_type_5.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045052Z&X-Amz-Expires=86400&X-Amz-Signature=4f6def5eca65683e701048929baa845d1fc4ce96faafc4e96a39d2775d2b7faa&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_yellow_type_5.png%22&x-id=GetObject',
                            maskImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b93c856e-c922-4fbc-a740-ef7fb4748cac/profile_type_5.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T044915Z&X-Amz-Expires=86400&X-Amz-Signature=fea816618e7f244716f6a788e4d39387ecf4898639e9b9cf5b5e226698a64173&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_5.png%22&x-id=GetObject',
                            profileImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/70cf09fb-c9d6-45cd-a513-08d3533542ac/user_8.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045249Z&X-Amz-Expires=86400&X-Amz-Signature=7dea979aabdf17edd332d8b5356f92c8ed2f0df82cccf30dd0d1e5b6aafd6959&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_8.jpeg%22&x-id=GetObject',
                          ),
                          CustomPositionProfile(
                            bottom: 450,
                            right: 60,
                            onPanUpdate: (details) {},
                            onTab: () {},
                            bgWidth: 75,
                            maskWidth: 65,
                            bgImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/243b8ab4-48f4-4221-a6b9-4174f8604650/profile_bg_blue_type_1.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045029Z&X-Amz-Expires=86400&X-Amz-Signature=f46e7626eabe2dcb4173f94d5ef1604d3b3fedbb4fb2baf5ac80897ccc9774ff&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_blue_type_1.png%22&x-id=GetObject',
                            maskImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/af5d3de3-cd16-4507-a89c-4a1db63f89d9/profile_type_1.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T044940Z&X-Amz-Expires=86400&X-Amz-Signature=a3a95765b0178b0b720147ff598909f4adbbb1ab99b9fca938df1bfbe153a37e&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_1.png%22&x-id=GetObject',
                            profileImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/e7d7263c-423c-4297-ac2b-5b619923319e/user_1.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045310Z&X-Amz-Expires=86400&X-Amz-Signature=b15797f44574514a50ba5343fb6fa32c25e398ae7f571eb1c14b55da0e720264&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_1.jpeg%22&x-id=GetObject',
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isPing,
                      child: Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 20,
                                            child: Stack(
                                              children: [
                                                ClipOval(
                                                  child: Container(
                                                    height: 60,
                                                    width: 50,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                ClipOval(
                                                  child: Container(
                                                    height: 58,
                                                    width: 48,
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/e03d3fe4-be31-4b3a-88fa-26f671f45c33/user_6.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045651Z&X-Amz-Expires=86400&X-Amz-Signature=07c74184a82333c8c715dec3169ce4a5e79d496eeb5cdc27d317251e6f5144bc&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_6.jpg%22&x-id=GetObject',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            left: 10,
                                            child: Stack(
                                              children: [
                                                ClipOval(
                                                  child: Container(
                                                    height: 60,
                                                    width: 50,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                ClipOval(
                                                  child: Container(
                                                    height: 58,
                                                    width: 48,
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/23e5e353-e875-43f1-bcd4-e50704e6087c/user_4.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045629Z&X-Amz-Expires=86400&X-Amz-Signature=b0c6306b7b6634811dbd6a1d72795ff0d7cda1563ca88f993ddc991fbd6d1d71&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_4.jpg%22&x-id=GetObject',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              ClipOval(
                                                child: Container(
                                                  height: 60,
                                                  width: 50,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              ClipOval(
                                                child: Container(
                                                  height: 58,
                                                  width: 48,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/20d488b1-55a8-4f20-a50e-04371a3bafd8/user_5.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045503Z&X-Amz-Expires=86400&X-Amz-Signature=9d5b3b258bee9a299dc7a67c0baa7ef0883d8900b54932fd36b76a079b33b088&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_5.jpg%22&x-id=GetObject',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'Yein + 2',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomProfileTab(
                                    onTab: () {},
                                    bgWidth: 95,
                                    maskWidth: 82,
                                    bgImage:
                                        'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/fc81369a-29ea-4050-a40b-ec1076c48a13/profile_bg_blue_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045438Z&X-Amz-Expires=86400&X-Amz-Signature=203236bf97445dd6d1cd27f7e68161a8730866868613b66af98b77a1f38c3773&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_blue_type_2.png%22&x-id=GetObject',
                                    maskImage:
                                        'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/0f74cb13-8b78-4293-9a6f-1e6df38f8239/profile_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045420Z&X-Amz-Expires=86400&X-Amz-Signature=54319b7d3ecf37a01884e9421fd88b5146d2cee735c71782cf678654acc89b8e&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_2.png%22&x-id=GetObject',
                                    profileImage:
                                        'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/7b3a8034-1144-4df1-9f0e-28a2522f2f23/user_7.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045341Z&X-Amz-Expires=86400&X-Amz-Signature=bb7dc972ca5a10a7ac8aa18dc238f7f8b06943cebdce07b553d30f559798402e&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_7.jpg%22&x-id=GetObject',
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/2cbb9ba1-5a1a-4a9c-8bae-a15da9c5aa19/home_my_profile_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045739Z&X-Amz-Expires=86400&X-Amz-Signature=72691223ab8e917887dae4f2493893e55af6be259cf0017b7824e0b8ccc566e0&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22home_my_profile_type_2.png%22&x-id=GetObject',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 2,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(40),
                                          ),
                                        ),
                                        child: Row(
                                          children: const [
                                            Text(
                                              'SIMSIM',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Mont',
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              '\u{1F4AD}',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 20,
                                            child: Container(
                                              height: 60,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                                image: const DecorationImage(
                                                  image: NetworkImage(
                                                    'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a576c173-6eec-4df2-9259-8064f4969f8e/user_9.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T045713Z&X-Amz-Expires=86400&X-Amz-Signature=168edcaf9838bd5087294bf6681af7d2ef70a2e3f59e7a22be0a41e748540cdc&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_9.jpeg%22&x-id=GetObject',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 10,
                                            child: Container(
                                              height: 60,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                                image: const DecorationImage(
                                                  image: NetworkImage(
                                                    'https://upload2.inven.co.kr/upload/2017/04/10/bbs/i13021844211.png',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 60,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              image: const DecorationImage(
                                                image: NetworkImage(
                                                  'https://i2.ruliweb.com/img/18/03/17/162341cb6be133a5c.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      '32Pic',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
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
                    Visibility(
                      visible: !isPing,
                      child: Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              controller.ping();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFF7F7F7),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/ping/ping_button_logo.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: controller.isProfileDetail,
              child: DetailProfile(
                onTab: () {
                  controller.profileDetail();
                },
              ),
            ),
            Visibility(
              visible: controller.isPlaceDetail,
              child: DetailPlace(
                onTab: () {
                  controller.placeDetail();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
