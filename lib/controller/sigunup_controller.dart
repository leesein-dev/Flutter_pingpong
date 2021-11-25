import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pingpong/data/signup_data.dart';
import 'package:pingpong/utilities/custom/snackbar/custom_snackbar.dart';

class SignupController extends GetxController
    with SingleGetTickerProviderMixin {

  //------------------정보 입력------------------//
  final nicknameController = TextEditingController();
  final schoolController = TextEditingController();
  final departmentController = TextEditingController();
  final studentIdController = TextEditingController();

  final emailController = TextEditingController();
  final emailCodeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nicknameController.text = '';
    schoolController.text = '';
    departmentController.text = '';
    studentIdController.text = '';
    emailController.text = '';
    emailCodeController.text = '';
  }

  //------------------사용자 정보------------------//
  String nickname = '', school = '', department = '', studentId = '', email = '', emailCode = '', type = '1';

  //------------------이미지 등록------------------//

  var selectedProfileImagePath = ''.obs;

  void getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedProfileImagePath.value = pickedFile.path;
    } else {
      CustomSnackBar(
        message: '이미지를 불러오지 못 했습니다.',
      ).snackBarError();
    }
  }

  bool isNicknameFail = false;
  bool isNickNameSuccess = false;

  void checkNickname(checkNickname) {

    if (checkNickname == testUserNickName) {
      isNickNameSuccess = false;
      isNicknameFail = true;
    } else if (checkNickname != nickname) {
      isNickNameSuccess = false;
      isNicknameFail = false;
      nickname = '';
    } else {
      isNicknameFail = false;
      isNickNameSuccess = true;
    }

    update(['Nickname']);

  }

  bool isSchoolInfo = false;

  void checkSchoolInfo() {

    if (school != '' && department != '' && studentId != '') {
      isSchoolInfo = true;
    } else {
      isSchoolInfo = false;
    }

    update(['SchoolInfo']);
  }

  bool isEmailError = false;
  bool isSendEmailCode = false;

  void checkEmail(checkEmail) {

    if (checkEmail == testUserEmail) {
      isEmailError = true;
    } else if (checkEmail != email) {
      email = '';
      isEmailError = false;
    } else {
      isSendEmailCode = true;
    }

    update(['Email']);

  }

  bool isEmailCodeFail = false;
  bool isEmailCodeSuccess = false;

  void checkEmailCode(code) {

    if (code == testUserEmailCode) {
      isEmailCodeSuccess = false;
      isEmailCodeFail = true;
    } else if (code != emailCode) {
      isEmailCodeSuccess = false;
      isEmailCodeFail = false;
      emailCode = '';
    } else {
      isEmailCodeFail = false;
      isEmailCodeSuccess = true;
    }

    update(['Email']);
  }

  int typeIndex = 0;

  void changeType(index) {
    typeIndex = index;
    type = (typeIndex + 1).toString();
    update(['Type']);
  }

  @override
  void onClose() {
    nicknameController.dispose();
    schoolController.dispose();
    departmentController.dispose();
    studentIdController.dispose();
    emailController.dispose();
    emailCodeController.dispose();
    super.dispose();
  }

}
