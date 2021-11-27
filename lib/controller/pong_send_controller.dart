import 'dart:async';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pingpong/components/snackbar/custom_snackbar.dart';

class PongSendController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool isProfileDetail = false;

  void profileDetail() {
    isProfileDetail = !isProfileDetail;
    update(['PongSend']);
  }

  bool isDownLoadDetail = false;

  void downloadDetail() {
    isDownLoadDetail = !isDownLoadDetail;
    update(['PongSend']);
  }

  void gotoHome() {
    Timer(const Duration(milliseconds: 100), () => Get.offAndToNamed('/home'));
  }

}