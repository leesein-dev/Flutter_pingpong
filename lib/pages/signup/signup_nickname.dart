import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/controller/sigunup_controller.dart';
import 'package:pingpong/components/color/custom_color.dart';

class SignupNickname extends StatelessWidget {
  const SignupNickname({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return GetBuilder<SignupController>(
      id: 'Nickname',
      init: SignupController(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
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
                        "닉네임",
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
                    "알려주세요!",
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
                            color: Colors.black,
                          ),
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontFamily: 'Mont'),
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
                            color: controller.nickname == '' ? ContentsColors.inputBackgroundColor : controller.isNickNameSuccess ? ContentsColors.yellowColor : ContentsColors.redColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: controller.nicknameController,
                              onSaved: (val) {
                                controller.nickname = val!.trim();
                              },
                              onChanged: (value) {
                                if ( controller.nickname != '' && value != controller.nickname) {
                                  controller.checkNickname(value);
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'Name',
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
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            _formKey.currentState!.save();
                            controller.checkNickname(controller.nickname);
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
                              Icons.check,
                              color: Color(0xFFD0D0D0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: controller.isNicknameFail,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '\u{2757} 사용할 수 없는 닉네임이에요',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.isNickNameSuccess,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '\u{1F4A1} 사용가능한 닉네임이에요',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.isNickNameSuccess == true) {
                        Get.toNamed('/auth/signup/schoolInfo');
                      }
                    },
                    child: controller.isNickNameSuccess
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
