import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/color/custom_color.dart';
import 'package:pingpong/controller/ping_controller.dart';

class TextPing extends StatelessWidget {
  const TextPing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<dynamic> colors = <dynamic>[
      Colors.white,
      ContentsColors.redColor,
      ContentsColors.yellowColor,
      ContentsColors.greenColor,
      ContentsColors.blueColor,
    ];

    return GetBuilder<PingController>(
      id: 'Ping',
      init: PingController(),
      builder: (controller) => Center(
        child: SizedBox(
          height: Get.height * 0.55,
          child: PageView.builder(
            controller: PageController(initialPage: 500, viewportFraction: 0.8),
            onPageChanged: (int index) => controller.changeType(index),
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Transform.translate(
                  offset: i == controller.typeIndex
                      ? const Offset(0, 0)
                      : i == controller.typeIndex - 1
                          ? const Offset(-15, 30)
                          : const Offset(15, 30),
                  child: Transform.rotate(
                    angle: i == controller.typeIndex
                        ? 0
                        : i == controller.typeIndex - 1
                            ? -0.15
                            : 0.15,
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors[i % 5],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        maxLines: 15,
                        controller: controller.pingTextController,
                        onChanged: (val) {
                          controller.pingText = val.trim();
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: '여기에\n텍스트를\n입력주세요\n0/20',
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 25),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
