import 'package:flutter/material.dart';
import 'package:pingpong/components/color/custom_color.dart';

class Indicator extends StatelessWidget {
  final int currentPage;

  const Indicator({
    Key? key,
    this.currentPage = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color:
                  currentPage == 1 ? Colors.black : ContentsColors.enableColor,
            ),
          ),
          child: Text(
            '1',
            style: TextStyle(
              color:
                  currentPage == 1 ? Colors.black : ContentsColors.enableColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mont',
            ),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Container(
          width: 12,
          height: 2.0,
          color: ContentsColors.enableColor,
        ),
        const SizedBox(
          width: 3,
        ),
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color:
                  currentPage == 2 ? Colors.black : ContentsColors.enableColor,
            ),
          ),
          child: Text(
            '2',
            style: TextStyle(
              color:
                  currentPage == 2 ? Colors.black : ContentsColors.enableColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mont',
            ),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Container(
          width: 12,
          height: 2.0,
          color: ContentsColors.enableColor,
        ),
        const SizedBox(
          width: 3,
        ),
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color:
                  currentPage == 3 ? Colors.black : ContentsColors.enableColor,
            ),
          ),
          child: Text(
            '3',
            style: TextStyle(
              color:
                  currentPage == 3 ? Colors.black : ContentsColors.enableColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mont',
            ),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Container(
          width: 12,
          height: 2.0,
          color: ContentsColors.enableColor,
        ),
        const SizedBox(
          width: 3,
        ),
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color:
                  currentPage == 4 ? Colors.black : ContentsColors.enableColor,
            ),
          ),
          child: Text(
            '4',
            style: TextStyle(
              color:
                  currentPage == 4 ? Colors.black : ContentsColors.enableColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mont',
            ),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Container(
          width: 12,
          height: 2.0,
          color: ContentsColors.enableColor,
        ),
        const SizedBox(
          width: 3,
        ),
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color:
                  currentPage == 5 ? Colors.black : ContentsColors.enableColor,
            ),
          ),
          child: Text(
            '5',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Mont',
              color:
                  currentPage == 5 ? Colors.black : ContentsColors.enableColor,
            ),
          ),
        ),
      ],
    );
  }
}
