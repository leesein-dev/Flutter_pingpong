import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class CustomPositionProfile extends StatelessWidget {
  final double? bottom;
  final double? top;
  final double? left;
  final double? right;
  final VoidCallback? onTab;
  final void Function(DragUpdateDetails)? onPanUpdate;
  final double? bgWidth;
  final double? maskWidth;
  final String? bgImage;
  final String? maskImage;
  final String? profileImage;

  const CustomPositionProfile({
    Key? key,
    this.bottom,
    this.top,
    this.left,
    this.right,
    this.onTab,
    this.onPanUpdate,
    this.bgWidth,
    this.maskWidth,
    this.bgImage,
    this.maskImage,
    this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        onTap: onTab,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: bgWidth,
              child: Image.network(
                bgImage!,
                fit: BoxFit.cover,
              ),
            ),
            WidgetMask(
              blendMode: BlendMode.srcATop,
              childSaveLayer: true,
              mask: Image.network(
                profileImage!,
                fit: BoxFit.cover,
              ),
              child: Image.network(
                maskImage!,
                fit: BoxFit.cover,
                width: maskWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomProfileTab extends StatelessWidget {
  final VoidCallback? onTab;
  final double? bgWidth;
  final double? maskWidth;
  final String? bgImage;
  final String? maskImage;
  final String? profileImage;

  const CustomProfileTab({
    Key? key,
    this.onTab,
    this.bgWidth,
    this.maskWidth,
    this.bgImage,
    this.maskImage,
    this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: bgWidth,
            child: Image.network(
              bgImage!,
              fit: BoxFit.cover,
            ),
          ),
          WidgetMask(
            blendMode: BlendMode.srcATop,
            childSaveLayer: true,
            mask: Image.network(
              profileImage!,
              fit: BoxFit.cover,
            ),
            child: Image.network(
              maskImage!,
              fit: BoxFit.cover,
              width: maskWidth,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomProfile extends StatelessWidget {
  final double? bgWidth;
  final double? maskWidth;
  final String? bgImage;
  final String? maskImage;
  final String? profileImage;

  const CustomProfile({
    Key? key,
    this.bgWidth,
    this.maskWidth,
    this.bgImage,
    this.maskImage,
    this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: bgWidth,
            child: Image.network(
              bgImage!,
              fit: BoxFit.cover,
            ),
          ),
          WidgetMask(
            blendMode: BlendMode.srcATop,
            childSaveLayer: true,
            mask: Image.network(
              profileImage!,
              fit: BoxFit.cover,
            ),
            child: Image.network(
              maskImage!,
              fit: BoxFit.cover,
              width: maskWidth,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPositionPlace extends StatelessWidget {
  final double? bottom;
  final double? top;
  final double? left;
  final double? right;
  final VoidCallback? onTab;
  final double? size;
  final String? unicode;
  final bool? visible;

  const CustomPositionPlace({
    Key? key,
    this.bottom,
    this.top,
    this.left,
    this.right,
    this.onTab,
    this.size,
    this.unicode,
    this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Visibility(
        visible: visible!,
        child: GestureDetector(
          onTap: onTab,
          child: Text(
            unicode!,
            style: TextStyle(
              fontSize: size,
            ),
          ),
        ),
      ),
    );
  }
}