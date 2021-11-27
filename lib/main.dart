import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pingpong/intro.dart';
import 'package:pingpong/pages/main/home.dart';
import 'package:pingpong/pages/main/ping.dart';
import 'package:pingpong/pages/main/ping_send.dart';
import 'package:pingpong/pages/signup/signup_final_check.dart';
import 'package:pingpong/pages/signup/signup_nickname.dart';
import 'package:pingpong/pages/signup/signup_profile.dart';
import 'package:pingpong/pages/signup/signup_school_info.dart';
import 'package:pingpong/pages/signup/signup_school_life_type.dart';
import 'package:pingpong/pages/signup/signup_school_mail.dart';
import 'package:pingpong/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Noto',
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
      ],
    );
  }
}
