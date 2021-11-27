import 'dart:async';
import 'package:get/get.dart';

class HomeController extends GetxController
    with SingleGetTickerProviderMixin {

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
    update(['Home']);
  }

  bool isPlaceDetail = false;

  void placeDetail() {
    isPlaceDetail = !isPlaceDetail;
    update(['Home']);
  }

  void ping() {
    Get.toNamed('/ping');
  }


}
