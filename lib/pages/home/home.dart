import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/data/other_user_data.dart';
import 'package:pingpong/utilities/custom/color/custom_color.dart';
import 'package:widget_mask/widget_mask.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                    ClipOval(
                      child: Container(
                        height: Get.height * 0.16,
                        width: Get.width * 0.6,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/home_drag_zone_green.png",
                            ),
                            fit: BoxFit.fill,
                          )
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
                    color: ContentsColors.redColor,
                    height: Get.width * 0.7,
                    width: Get.width,
                  ),
                ),
              )
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
                          bottom: 90,
                          left: 10,
                          child: GestureDetector(
                            onTap: (){},
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  child: Image.asset(
                                    'assets/images/profile/profile_bg_${otherUser[0].state}_type_${otherUser[0].uniLifeType}.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                WidgetMask(
                                  blendMode: BlendMode.srcATop,
                                  childSaveLayer: true,
                                  mask: Image.asset(
                                    otherUser[0].profileImage,
                                    fit: BoxFit.cover,
                                  ),
                                  child: Image.asset(
                                    'assets/images/profile_type_${otherUser[0].uniLifeType}.png',
                                    fit: BoxFit.cover,
                                    width: 130,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 150,
                          right: 10,
                          child: GestureDetector(
                            onTap: (){},
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 120,
                                  child: Image.asset(
                                    'assets/images/profile/profile_bg_${otherUser[1].state}_type_${otherUser[1].uniLifeType}.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                WidgetMask(
                                  blendMode: BlendMode.srcATop,
                                  childSaveLayer: true,
                                  mask: Image.asset(
                                    otherUser[1].profileImage,
                                    fit: BoxFit.cover,
                                  ),
                                  child: Image.asset(
                                    'assets/images/profile_type_${otherUser[1].uniLifeType}.png',
                                    fit: BoxFit.cover,
                                    width: 105,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 280,
                          left: 100,
                          child: GestureDetector(
                            onTap: (){},
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/images/profile/profile_bg_${otherUser[2].state}_type_${otherUser[2].uniLifeType}.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                WidgetMask(
                                  blendMode: BlendMode.srcATop,
                                  childSaveLayer: true,
                                  mask: Image.asset(
                                    otherUser[2].profileImage,
                                    fit: BoxFit.cover,
                                  ),
                                  child: Image.asset(
                                    'assets/images/profile_type_${otherUser[2].uniLifeType}.png',
                                    fit: BoxFit.cover,
                                    width: 88,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 400,
                          left: 60,
                          child: GestureDetector(
                            onTap: (){},
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 90,
                                  child: Image.asset(
                                    'assets/images/profile/profile_bg_${otherUser[3].state}_type_${otherUser[3].uniLifeType}.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                WidgetMask(
                                  blendMode: BlendMode.srcATop,
                                  childSaveLayer: true,
                                  mask: Image.asset(
                                    otherUser[3].profileImage,
                                    fit: BoxFit.cover,
                                  ),
                                  child: Image.asset(
                                    'assets/images/profile_type_${otherUser[3].uniLifeType}.png',
                                    fit: BoxFit.cover,
                                    width: 78,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 450,
                          right: 60,
                          child: GestureDetector(
                            onTap: (){},
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/profile/profile_bg_${otherUser[4].state}_type_${otherUser[4].uniLifeType}.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                WidgetMask(
                                  blendMode: BlendMode.srcATop,
                                  childSaveLayer: true,
                                  mask: Image.asset(
                                    otherUser[4].profileImage,
                                    fit: BoxFit.cover,
                                  ),
                                  child: Image.asset(
                                    'assets/images/profile/profile_type_${otherUser[4].uniLifeType}.png',
                                    fit: BoxFit.cover,
                                    width: 68,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
