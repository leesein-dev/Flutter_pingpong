import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/color/custom_color.dart';
import 'package:pingpong/components/profile/custom_profile.dart';

class DetailProfile extends StatelessWidget {
  // final double? bottom;
  // final double? top;
  // final double? left;
  // final double? right;
  final VoidCallback? onTab;
  // final double? width;
  // final double? height;

  const DetailProfile({
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
        Blur(
          blur: 6,
          blurColor: ContentsColors.yellowColor,
          child: const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
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
                        'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/7edba9ba-8d35-46b2-a016-72c0b32d432f/detail_profile_2.png.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T132335Z&X-Amz-Expires=86400&X-Amz-Signature=4f355577ea57141105f0ff4d491f3356557ed8dc784ae34880dd06c21bd6a4f8&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22detail_profile_2.png.png%22&x-id=GetObject',
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
                                  'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/93e1c4f2-694d-4585-bc3a-3a8c57c3ef24/detail_profile_2.png.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T040914Z&X-Amz-Expires=86400&X-Amz-Signature=4252491d32b3ff79154049e27d7a00fb601318281bbda57d3d37698a878c680e&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22detail_profile_2.png.png%22&x-id=GetObject',
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
                          'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f75ee353-8f54-428a-a35c-0092d7e81b9d/profile_bg_yellow_type_1.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T133130Z&X-Amz-Expires=86400&X-Amz-Signature=f41b6ee758f06ec2c7f78b61c868969d64977b4c59fde86966cd4c6df8e020d4&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_yellow_type_1.png%22&x-id=GetObject',
                          maskImage:
                          'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/af5d3de3-cd16-4507-a89c-4a1db63f89d9/profile_type_1.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T133137Z&X-Amz-Expires=86400&X-Amz-Signature=ddb4c2336ded49156470a07d18b034c6e6cfde11550c9190ea416504054f22b7&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_1.png%22&x-id=GetObject',
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
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
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

class DetailPlace extends StatelessWidget {
  // final double? bottom;
  // final double? top;
  // final double? left;
  // final double? right;
  final VoidCallback? onTab;
  // final double? width;
  // final double? height;

  const DetailPlace({
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
        Blur(
          blur: 6,
          blurColor: ContentsColors.redColor,
          child: const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Pong!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Mont',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 6,
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
                          '\u{1F370}  OO대 케이크 맛집',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: Get.width * 0.75,
                            height: Get.height / 2,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/0889de84-a108-4aab-bb95-34b82f8d8148/cafe.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T040748Z&X-Amz-Expires=86400&X-Amz-Signature=ee8097e4c222243e607cb0181b4368654df14eb0483b5699e0b9ab181d3bd4ae&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22cafe.png%22&x-id=GetObject',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Stack(
                              children: [
                                Container(
                                  width: Get.width * 0.75,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: Get.width * 0.75,
                                  height: 100,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 2,
                                            color: ContentsColors.redColor,
                                          ),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                              'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/872316e5-7817-4454-96bd-29a099ac5cc6/cafe_logo.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211126T040622Z&X-Amz-Expires=86400&X-Amz-Signature=8cf093bf378f3597f3411f447a1007094badb2cce935a964126fdedebdbc75a4&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22cafe_logo.png%22&x-id=GetObject',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Pav Coffee',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Mont',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}