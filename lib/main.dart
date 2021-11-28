import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pingpong/intro.dart';
import 'package:pingpong/pages/main/home.dart';
import 'package:pingpong/pages/main/ping.dart';
import 'package:pingpong/pages/main/ping_send.dart';
import 'package:pingpong/pages/main/pong.dart';
import 'package:pingpong/pages/main/pong_send.dart';
import 'package:pingpong/pages/signup/signup_final_check.dart';
import 'package:pingpong/pages/signup/signup_nickname.dart';
import 'package:pingpong/pages/signup/signup_profile.dart';
import 'package:pingpong/pages/signup/signup_school_info.dart';
import 'package:pingpong/pages/signup/signup_school_life_type.dart';
import 'package:pingpong/pages/signup/signup_school_mail.dart';
import 'package:pingpong/splash_screen.dart';

void main() async{
  // runApp 메소드의 시작 지점에서 Flutter 엔진과 위젯의 바인딩이 미리 완료되어 있도록 불러오는 작업.
  WidgetsFlutterBinding.ensureInitialized();
  // 자동로그인 구현을 위한 디바이스 메모리 내 저장된 정보 불러오기
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Noto', // 한글 'Noto', 영문 'Mont'
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>const Intro(), transition: Transition.fadeIn),
        GetPage(name: '/splash/basic', page: ()=>const BasicSplashScreen(), transition: Transition.fadeIn),
        GetPage(name: '/splash/ping', page: ()=>const PingSplashScreen(), transition: Transition.fadeIn),
        GetPage(name: '/splash/pong', page: ()=>const PongSplashScreen(), transition: Transition.fadeIn),
        GetPage(name: "/auth/signup/nickname", page: ()=>const SignupNickname(), transition: Transition.fadeIn),
        GetPage(name: "/auth/signup/schoolInfo", page: ()=>const SignupSchoolInfo(), transition: Transition.rightToLeftWithFade),
        GetPage(name: "/auth/signup/schoolMail", page: ()=>const SignupSchoolMail(), transition: Transition.rightToLeftWithFade),
        GetPage(name: "/auth/signup/profile", page: ()=>const SignupProfile(), transition: Transition.rightToLeftWithFade),
        GetPage(name: "/auth/signup/schoolLifeType", page: ()=>const SignupSchoolLifeType(), transition: Transition.rightToLeftWithFade),
        GetPage(name: "/auth/signup/finalCheck", page: ()=>const SignupFinalCheck(), transition: Transition.fadeIn),
        GetPage(name: "/home", page: ()=>const Home(), transition: Transition.fadeIn),
        GetPage(name: "/ping", page: ()=>const Ping(), transition: Transition.fadeIn),
        GetPage(name: "/ping/send", page: ()=>const PingSend(), transition: Transition.fadeIn),
        GetPage(name: "/pong", page: ()=>const Pong(), transition: Transition.fadeIn),
        GetPage(name: "/pong/send", page: ()=>const PongSend(), transition: Transition.fadeIn),
      ],
    );
  }
}
