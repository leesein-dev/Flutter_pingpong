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
                                      "assets/images/home_drag_zone_green.png",
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
                                      'assets/images/icon_message.jpg',
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
                            // unicode: isPing ? '\u{1F370}' : '',
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
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/fc81369a-29ea-4050-a40b-ec1076c48a13/profile_bg_blue_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T134505Z&X-Amz-Expires=86400&X-Amz-Signature=44d68bb8880120b1a510e0f16ec58e66af2df6a0e1e5c0bb66fe69dfb0d7d632&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_blue_type_2.png%22&x-id=GetObject',
                            maskImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/0f74cb13-8b78-4293-9a6f-1e6df38f8239/profile_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T134555Z&X-Amz-Expires=86400&X-Amz-Signature=89eb5fe5a675f3af985cc053797ac61e8f919b49e14f691c9742b719aa2bcb30&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_2.png%22&x-id=GetObject',
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
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/7655e4e2-0427-4b46-9e86-b001faa667d0/profile_bg_green_type_3.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T134748Z&X-Amz-Expires=86400&X-Amz-Signature=fb27a791bfccc4c835701e1c8ba1489076a3442ebf33fb1bc55a01db2f71a7af&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_green_type_3.png%22&x-id=GetObject',
                            maskImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/4db40d67-8887-43cf-8c16-1fab15780c5c/profile_type_3.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T134723Z&X-Amz-Expires=86400&X-Amz-Signature=dfc7c39effe78be03fd94129e49528dafd68910b4dc50718ea45568f3e0aa965&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_3.png%22&x-id=GetObject',
                            profileImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/56ca53b2-d94c-4491-8dc5-d38399153deb/user_3.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T031902Z&X-Amz-Expires=86400&X-Amz-Signature=733ddae93e19fd4e979641bb07bb8b8e27cf97f05503ef7022dbc427bf007fd5&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_3.jpg%22&x-id=GetObject',
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
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/5a8fcda8-bddb-42d0-8e65-43ef5c18ddaa/profile_bg_red_type_4.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T135105Z&X-Amz-Expires=86400&X-Amz-Signature=b0fabd3b7afadde3a181acad5f78c6d3cb29a993a5f87f9aa6e5a805e205354a&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_red_type_4.png%22&x-id=GetObject',
                            maskImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/09193066-f8a8-4d41-8b41-7c85e3fab485/profile_type_4.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T135038Z&X-Amz-Expires=86400&X-Amz-Signature=f78a53c49c06103925cfde9d359ce8942c4c7e1cad1e76c6d842f782daa95cb8&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_4.png%22&x-id=GetObject',
                            profileImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/37813810-d6b8-479f-8374-c52588b11477/user_2.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T031944Z&X-Amz-Expires=86400&X-Amz-Signature=f044e0e837e8fbb98eb402d9b561537d5c0bed115c0472a2f0a0eb65a359f185&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_2.jpg%22&x-id=GetObject',
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
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/35561510-6f72-40ab-a2bf-4463d70f9201/profile_bg_yellow_type_5.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T135216Z&X-Amz-Expires=86400&X-Amz-Signature=b4668170510e82f6b4cfa466b33188f5ff4d1bcf56682a027a1ac48f8aa5e466&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_yellow_type_5.png%22&x-id=GetObject',
                            maskImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b93c856e-c922-4fbc-a740-ef7fb4748cac/profile_type_5.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T135139Z&X-Amz-Expires=86400&X-Amz-Signature=8289a16089d0db0fc97aadcee02d86637131937896179610b9effd076bbd4c24&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_5.png%22&x-id=GetObject',
                            profileImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/70cf09fb-c9d6-45cd-a513-08d3533542ac/user_8.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T031755Z&X-Amz-Expires=86400&X-Amz-Signature=7baa1c59e329c3364228327e578b8bf9480cbd53283b31aeb398cde6614cacf0&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_8.jpeg%22&x-id=GetObject',
                          ),
                          CustomPositionProfile(
                            bottom: 450,
                            right: 60,
                            onPanUpdate: (details) {},
                            onTab: () {},
                            bgWidth: 75,
                            maskWidth: 65,
                            bgImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/243b8ab4-48f4-4221-a6b9-4174f8604650/profile_bg_blue_type_1.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T135252Z&X-Amz-Expires=86400&X-Amz-Signature=bab150d846e5a32151ce37218e1b04ec4541783207d673b261aa24d76b23572c&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_blue_type_1.png%22&x-id=GetObject',
                            maskImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/af5d3de3-cd16-4507-a89c-4a1db63f89d9/profile_type_1.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T133137Z&X-Amz-Expires=86400&X-Amz-Signature=ddb4c2336ded49156470a07d18b034c6e6cfde11550c9190ea416504054f22b7&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_1.png%22&x-id=GetObject',
                            profileImage:
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/e7d7263c-423c-4297-ac2b-5b619923319e/user_1.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T032005Z&X-Amz-Expires=86400&X-Amz-Signature=6a22008b445e3040bd42aa1ccce3d045a3f7a445ace846e9da09eacce9d11d85&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_1.jpeg%22&x-id=GetObject',
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
                                                          'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/e03d3fe4-be31-4b3a-88fa-26f671f45c33/user_6.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T032202Z&X-Amz-Expires=86400&X-Amz-Signature=24098ebb1c8e891bbdf8cdaccaacb41710d242f68e9eb05f70abc6c2cbe6a662&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_6.jpg%22&x-id=GetObject',
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
                                                          'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/23e5e353-e875-43f1-bcd4-e50704e6087c/user_4.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T032248Z&X-Amz-Expires=86400&X-Amz-Signature=33a2444040e3e1e7b26ecb7481a86d9aa5f128b33c9108b61cb57ed0e4cb88fb&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_4.jpg%22&x-id=GetObject',
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
                                                        'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/20d488b1-55a8-4f20-a50e-04371a3bafd8/user_5.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T032156Z&X-Amz-Expires=86400&X-Amz-Signature=ff3a49d35a9dd918dbc6cff95f942e340a4fbfaca19611ee5e264ad4dcaea723&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_5.jpg%22&x-id=GetObject',
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
                                        'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/fc81369a-29ea-4050-a40b-ec1076c48a13/profile_bg_blue_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T011131Z&X-Amz-Expires=86400&X-Amz-Signature=b84037f01de0751580b605d93c7b89cf9adfdf389cf3b39f017b5f46fea1687f&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_blue_type_2.png%22&x-id=GetObject',
                                    maskImage:
                                        'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/0f74cb13-8b78-4293-9a6f-1e6df38f8239/profile_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T134555Z&X-Amz-Expires=86400&X-Amz-Signature=89eb5fe5a675f3af985cc053797ac61e8f919b49e14f691c9742b719aa2bcb30&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_2.png%22&x-id=GetObject',
                                    profileImage:
                                        'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/7b3a8034-1144-4df1-9f0e-28a2522f2f23/user_7.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T031839Z&X-Amz-Expires=86400&X-Amz-Signature=e575a1a1d101948c3b15e72bdaf2ea5d6d1933aaf5bb9542abd22e5b1beec474&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_7.jpg%22&x-id=GetObject',
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
                                              'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/2cbb9ba1-5a1a-4a9c-8bae-a15da9c5aa19/home_my_profile_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T031243Z&X-Amz-Expires=86400&X-Amz-Signature=e6a827e9c210c4109968df61dbf116fb94ea2ce686f9778118791cf9103a8b44&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22home_my_profile_type_2.png%22&x-id=GetObject',
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
                                                    'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a576c173-6eec-4df2-9259-8064f4969f8e/user_9.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T032504Z&X-Amz-Expires=86400&X-Amz-Signature=af5c355dff8f550b45d86e210af7df22ba895046c068dab51957962fe3532640&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22user_9.jpeg%22&x-id=GetObject',
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
                            onTap: () {},
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
                              child: Image.network(
                                'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/1058bb51-8864-498c-8617-079cbe8222d5/ping.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T064334Z&X-Amz-Expires=86400&X-Amz-Signature=db78a3c1f4465de34756b118c994f50fec29293507e04b57939153eb629c7502&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22ping.png%22&x-id=GetObject',
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
