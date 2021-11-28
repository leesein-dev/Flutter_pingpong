import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/signup/custom_indicator.dart';
import 'package:pingpong/controller/sigunup_controller.dart';
import 'package:pingpong/components/color/custom_color.dart';

class SignupSchoolInfo extends StatelessWidget {
  const SignupSchoolInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return GetBuilder<SignupController>(
      id: 'SchoolInfo',
      init: SignupController(),
      builder: (controller) =>
          NotificationListener<OverscrollIndicatorNotification>(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: SingleChildScrollView(
            child: Padding(
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
                            "학적정보",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "를",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "입력해주세요",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Indicator(
                        currentPage: 2,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: controller.school != ''
                                    ? ContentsColors.yellowColor
                                    : ContentsColors.inputBackgroundColor,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: TextFormField(
                                controller: controller.schoolController,
                                onSaved: (value) {
                                  controller.school = value!.trim();
                                },
                                onChanged: (value) {
                                  _formKey.currentState!.save();
                                  controller.checkSchoolInfo();
                                },
                                decoration: const InputDecoration(
                                  hintText: '학교',
                                  hintStyle: TextStyle(
                                      color: ContentsColors.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Mont'),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: controller.department != ''
                                    ? ContentsColors.yellowColor
                                    : ContentsColors.inputBackgroundColor,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: TextFormField(
                                controller: controller.departmentController,
                                onSaved: (value) {
                                  controller.department = value!.trim();
                                },
                                onChanged: (value) {
                                  _formKey.currentState!.save();
                                  controller.checkSchoolInfo();
                                },
                                decoration: const InputDecoration(
                                  hintText: '학과',
                                  hintStyle: TextStyle(
                                      color: ContentsColors.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Mont'),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: controller.studentId != ''
                                    ? ContentsColors.yellowColor
                                    : ContentsColors.inputBackgroundColor,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: TextFormField(
                                controller: controller.studentIdController,
                                onSaved: (value) {
                                  controller.studentId = value!.trim();
                                },
                                onChanged: (value) {
                                  _formKey.currentState!.save();
                                  controller.checkSchoolInfo();
                                },
                                decoration: const InputDecoration(
                                  hintText: '학번',
                                  hintStyle: TextStyle(
                                      color: ContentsColors.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Mont'),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (controller.isSchoolInfo == true) {
                            Get.toNamed('/auth/signup/schoolMail');
                          }
                        },
                        child: controller.isSchoolInfo
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
                    ],
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
