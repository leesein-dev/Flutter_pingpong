import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogoImg extends StatelessWidget {
  final String image;
  final Alignment alignment;

  const LogoImg(
      {this.image = "assets/images/pingpong_logo.png",
      this.alignment = Alignment.center,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 2,
      alignment: alignment,
      child: Image.asset(
        image,
      ),
    );
  }
}
