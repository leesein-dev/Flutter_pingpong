import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/signup/custom_indicator.dart';
import 'package:pingpong/controller/sigunup_controller.dart';
import 'package:pingpong/components/color/custom_color.dart';

class SignupProfile extends StatelessWidget {
  const SignupProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      id: 'Profile',
      init: SignupController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "나를 표현할",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        "프로필 사진",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "을 골라요!",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Indicator(
                    currentPage: 4,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.getImageFromGallery();
                    },
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: Get.width * 0.6,
                            height: Get.width * 0.6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: const Color(0xFFEDEDED),
                              ),
                            ),
                          ),
                          Obx(
                            () =>
                                controller.selectedProfileImagePath.value == ''
                                    ? Container(
                                        width: Get.width * 0.55,
                                        height: Get.width * 0.55,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Get.width * 0.8),
                                          color: const Color(0xFFEDEDED),
                                        ),
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: ContentsColors.redColor,
                                        ),
                                      )
                                    : Container(
                                        width: Get.width * 0.55,
                                        height: Get.width * 0.55,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Get.width * 0.8),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(
                                              File(controller
                                                  .selectedProfileImagePath
                                                  .value),
                                            ),
                                          ),
                                        ),
                                      ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {

                        if (controller.selectedProfileImagePath.value != '') {
                          Get.toNamed('/auth/signup/schoolLifeType');
                        }

                      },
                      child: controller.selectedProfileImagePath.value != ''
                          ? Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F8F8),
                                borderRadius: BorderRadius.circular(40.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                  fontFamily: 'Mont',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: ContentsColors.redColor,
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F8F8),
                                borderRadius: BorderRadius.circular(40.0),
                                border: Border.all(
                                  color: const Color(0xFFEDEDED),
                                ),
                              ),
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                  fontFamily: 'Mont',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
