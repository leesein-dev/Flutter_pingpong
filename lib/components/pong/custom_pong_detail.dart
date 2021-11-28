import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/color/custom_color.dart';
import 'package:pingpong/components/pong/custom_pong.dart';
import 'package:pingpong/components/profile/custom_profile.dart';

class PongDetailProfile extends StatelessWidget {
  // final double? bottom;
  // final double? top;
  // final double? left;
  // final double? right;
  final VoidCallback? onTab;

  // final double? width;
  // final double? height;

  const PongDetailProfile({
    Key? key,
    // this.bottom,
    // this.top,
    // this.left,
    // this.right,
    this.onTab,
    // this.width,
    // this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '\u{1F6A8}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: Get.width * 0.75,
                  height: Get.height / 2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/93e1c4f2-694d-4585-bc3a-3a8c57c3ef24/detail_profile_2.png.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T080528Z&X-Amz-Expires=86400&X-Amz-Signature=29137a0eb18951ca20a90322ebacafb159dffa6bd491aa74fc7a3b40f30faa39&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22detail_profile_2.png.png%22&x-id=GetObject',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/0f74cb13-8b78-4293-9a6f-1e6df38f8239/profile_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T080820Z&X-Amz-Expires=86400&X-Amz-Signature=4156b0bbb49f3a68d548578431beacc784b56798eba2d955ff7e9b7c444864b8&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_2.png%22&x-id=GetObject',
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Yeini',
                          style: TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const CustomProfile(
                          bgWidth: 180,
                          maskWidth: 160,
                          bgImage:
                          'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f75ee353-8f54-428a-a35c-0092d7e81b9d/profile_bg_yellow_type_1.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T080613Z&X-Amz-Expires=86400&X-Amz-Signature=be7b156e62705f4f0341836975dbd56f28862c0a5bd568e7dc3da32960d03a02&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_yellow_type_1.png%22&x-id=GetObject',
                          maskImage:
                          'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/af5d3de3-cd16-4507-a89c-4a1db63f89d9/profile_type_1.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T080626Z&X-Amz-Expires=86400&X-Amz-Signature=8593ef775a55e44e8d2a8185c23e18f115d432caf9d6047b0d1142ceaee96153&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_1.png%22&x-id=GetObject',
                          profileImage:
                          'https://blog.kakaocdn.net/dn/sOFQo/btqFXIdG4BC/OSX6phlqjlj7p3EYH1jZjk/img.png',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'OO대학교',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  '디자인학부',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '18학번',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: ContentsColors.greenColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    '\u{1F331}  친구하고 싶어요!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTab,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEDEDED),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PongDownload extends StatelessWidget {
  // final double? bottom;
  // final double? top;
  // final double? left;
  // final double? right;
  final VoidCallback? onTab;

  // final double? width;
  // final double? height;

  const PongDownload({
    Key? key,
    // this.bottom,
    // this.top,
    // this.left,
    // this.right,
    this.onTab,
    // this.width,
    // this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Column(
                    children: const [
                      Text(
                        'Download',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mont',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '밈을 어디에 저장할까요?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const CardPong(),
                Container(
                  width: 200,
                  height: 140,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 30,
                        right: 0,
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 60,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/pong/pong_all.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Text(
                              'Both',
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 75,
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 60,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/pong/pong_album.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Text(
                              'Album',
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 60,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/pong/pong_app.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Text(
                              'App',
                              style: TextStyle(
                                fontFamily: 'Mont',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 75,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: onTab,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFEDEDED),
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
