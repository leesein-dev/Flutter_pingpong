import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogoImg extends StatelessWidget {
  final String image;

  const LogoImg({this.image = "assets/images/pingpong_logo.png", Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 2,
      alignment: Alignment.center,
      child: Image.asset(
        image,
      ),
    );
  }
}
