import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/controller/sigunup_controller.dart';
import 'package:pingpong/utilities/custom/color/custom_color.dart';

class SignupSchoolMail extends StatelessWidget {
  const SignupSchoolMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return GetBuilder<SignupController>(
      id: 'Email',
      init: SignupController(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
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
                        "학교메일",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "을",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "인증해주세요",
                    style: TextStyle(
                      fontSize: 30,
                    ),
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
                            color: Colors.black,
                          ),
                        ),
                        child: const Text(
                          '3',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mont',
                            color: Colors.black,
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
                            color: ContentsColors.enableColor,
                          ),
                        ),
                        child: const Text(
                          '5',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mont',
                            color: ContentsColors.enableColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 80,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: controller.email == ''
                                      ? ContentsColors.inputBackgroundColor
                                      : controller.isEmailError
                                          ? ContentsColors.redColor
                                          : ContentsColors.yellowColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: TextFormField(
                                  controller: controller.emailController,
                                  onSaved: (val) {
                                    controller.email = val!.trim();
                                  },
                                  onChanged: (value) {
                                    if (controller.email != '' &&
                                        value != controller.email) {
                                      controller.checkEmail(value);
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: '이메일',
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
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  _formKey.currentState!.save();
                                  controller.checkEmail(controller.email);
                                },
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8F8F8),
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: const Color(0xFFEDEDED),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.send,
                                    color: Color(0xFFD0D0D0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: controller.isEmailError,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              '\u{2757} 사용중인 이메일 입니다',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: controller.isSendEmailCode,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      height: 80,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: controller.emailCode == ''
                                            ? ContentsColors
                                                .inputBackgroundColor
                                            : controller.isEmailCodeSuccess
                                                ? ContentsColors.yellowColor
                                                : ContentsColors.redColor,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: TextFormField(
                                        controller:
                                            controller.emailCodeController,
                                        onSaved: (val) {
                                          controller.emailCode = val!.trim();
                                        },
                                        onChanged: (value) {
                                          if (controller.emailCode != '' &&
                                              value != controller.emailCode) {
                                            controller.checkEmailCode(value);
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          hintText: '인증번호',
                                          hintStyle: TextStyle(
                                              color: ContentsColors.textColor,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Mont'),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        _formKey.currentState!.save();
                                        controller.checkEmailCode(
                                            controller.emailCode);
                                      },
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF8F8F8),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: const Color(0xFFEDEDED),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: Color(0xFFD0D0D0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: controller.isEmailCodeFail,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '\u{2757} 인증번호가 잘못되었어요',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: controller.isEmailCodeSuccess,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '\u{1F4A1} 인증 완료!',
                                    style: TextStyle(
                                      fontSize: 16,
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
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.isEmailCodeSuccess == true) {
                        Get.toNamed('/auth/signup/profile');
                      }
                    },
                    child: controller.isEmailCodeSuccess
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
