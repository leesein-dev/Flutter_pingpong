import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pingpong/components/snackbar/custom_snackbar.dart';

class PingController extends GetxController {

  final pingTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    pingTextController.text = '';
  }

  @override
  void onClose() {
    pingTextController.dispose();
    super.onClose();
  }

  String pingText = '', type = '1';

  int typeIndex = 500;

  void changeType(index) {
    typeIndex = index;
    type = (typeIndex + 1).toString();
    update(['Ping']);
  }

  void sendPage() {
    Get.toNamed('/ping/send');
  }

  //------------------핑 이미지 등록------------------//

  var selectedPingImagePath = ''.obs;

  void getImageFromGallery() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedPingImagePath.value = pickedFile.path;
      sendPage();
    } else {
      CustomSnackBar(
        message: '이미지를 불러오지 못 했습니다.',
      ).snackBarError();
    }
  }

  void ping() {
    Timer(const Duration(milliseconds: 100), () => Get.offAndToNamed('/splash/ping'));
  }

}