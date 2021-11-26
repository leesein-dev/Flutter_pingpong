import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/controller/sigunup_controller.dart';
import 'package:pingpong/components/color/custom_color.dart';

class SignupSchoolLifeType extends StatelessWidget {
  const SignupSchoolLifeType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> images = <String>[
      'card_1.png',
      'card_2.png',
      'card_3.png',
      'card_4.png',
      'card_5.png'
    ];

    return GetBuilder<SignupController>(
      id: 'Type',
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
                  Row(
                    children: const [
                      Text(
                        "내",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        " 대학생활 유형",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "은?",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: ContentsColors.enableColor,
                          ),
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mont',
                            color: ContentsColors.enableColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 12,
                        height: 2.0,
                        color: ContentsColors.enableColor,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: ContentsColors.enableColor,
                          ),
                        ),
                        child: const Text(
                          '2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mont',
                            color: ContentsColors.enableColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 12,
                        height: 2.0,
                        color: ContentsColors.enableColor,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: ContentsColors.enableColor,
                          ),
                        ),
                        child: const Text(
                          '3',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mont',
                            color: ContentsColors.enableColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 12,
                        height: 2.0,
                        color: ContentsColors.enableColor,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: ContentsColors.enableColor,
                          ),
                        ),
                        child: const Text(
                          '4',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mont',
                            color: ContentsColors.enableColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 12,
                        height: 2.0,
                        color: ContentsColors.enableColor,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        child: const Text(
                          '5',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mont',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: SizedBox(
                      height: 300,
                      child: PageView.builder(
                        itemCount: 5,
                        controller: PageController(viewportFraction: 0.7),
                        onPageChanged: (int index) => controller.changeType(index),
                        itemBuilder: (_, i) {
                          return Transform.scale(
                            scale: i == controller.typeIndex ? 1 : 0.9,
                            child: Image.asset('assets/images/${images[i]}'),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/auth/signup/finalCheck');
                    },
                    child: Container(
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
