import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingpong/components/profile/custom_profile.dart';
import 'package:pingpong/controller/pong_send_controller.dart';

class CardPong extends StatelessWidget {
  const CardPong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PongSendController>(
      id: 'PongSend',
      init: PongSendController(),
      builder: (controller) => Stack(
        children: [
          GestureDetector(
            onTap: (){
              controller.downloadDetail();
            },
            child: Container(
              width: Get.width * 0.75,
              height: Get.height / 2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/af0fc4af-6525-4a18-8eb4-97138a35cf5b/pic_2.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T065412Z&X-Amz-Expires=86400&X-Amz-Signature=855275591a8474193559e84b12a7eef42718bf03d4e246864ac321abfb0c7cfa&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22pic_2.jpeg%22&x-id=GetObject',
                  ),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: (){
                controller.profileDetail();
              },
              child: Stack(
                children: [
                  Container(
                    width: Get.width * 0.75,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFE1F23D),
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
                      children: const [
                        CustomProfile(
                          bgWidth: 50,
                          maskWidth: 42,
                          bgImage:
                              'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/fc81369a-29ea-4050-a40b-ec1076c48a13/profile_bg_blue_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T022236Z&X-Amz-Expires=86400&X-Amz-Signature=9803ac80073cd17784c7043acc75558f2688b841e66a4c30fcb223e632952d7b&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_bg_blue_type_2.png%22&x-id=GetObject',
                          maskImage:
                              'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/0f74cb13-8b78-4293-9a6f-1e6df38f8239/profile_type_2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211127T022256Z&X-Amz-Expires=86400&X-Amz-Signature=e3e8b1e356838b1e023d3a14b5babc8f92ae6025209a395a336f07e7f35c7b77&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22profile_type_2.png%22&x-id=GetObject',
                          profileImage:
                              'https://blog.kakaocdn.net/dn/sOFQo/btqFXIdG4BC/OSX6phlqjlj7p3EYH1jZjk/img.png',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Yeini',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
