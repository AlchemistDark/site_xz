import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/global/theme.dart';

/// This class implements an arrow tail for a month circular face.

class MonthArrowTail extends StatelessWidget {

  final int currentDay;

  const MonthArrowTail(this.currentDay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// Tail
        Center(
          child: ClipPath(
            clipper: MyCustomClipper(), // <--
            child: Container(
              width: 179,
              height: 179,
              color: mainPinkColor,
            )
          )
        ),
        /// Tail text
        if (currentDay < 17)
        Center(
          child: SizedBox(
            width: 186,
            height: 186,
            child: Padding(
              padding: const EdgeInsets.only(right: 150, top: 83.5),
              child: Column(
                children: const [
                  Text(
                    '+14',
                    style: TextStyle(
                    color: arrowTailTextDarkColor,
                      fontSize: 8,
                      fontFamily: 'Roboto'
                    )
                  ),
                  Text(
                    'дней',
                    style: TextStyle(
                      color: arrowTailTextDarkColor,
                      fontSize: 8,
                      fontFamily: 'Roboto'
                    ),
                  )
                ]
              )
            ),
          ),
        ),
        if (currentDay > 16)
        Center(
          child: Transform.rotate(
            angle: math.pi,
            child: SizedBox(
              width: 186,
              height: 186,
              child: Padding(
                padding: const EdgeInsets.only(left: 150, top: 83.5),
                child: Column(
                  children: const [
                    Text(
                      '+14',
                      style: TextStyle(
                        color: arrowTailTextDarkColor,
                        fontSize: 8,
                        fontFamily: 'Roboto'
                      )
                    ),
                    Text(
                      'дней',
                      style: TextStyle(
                        color: arrowTailTextDarkColor,
                        fontSize: 8,
                        fontFamily: 'Roboto'
                      ),
                    )
                  ]
                )
              ),
            )
          ),
        )
      ],
    );
  }
}

/// Tail drawing.
class MyCustomClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final width = size.width - 1;
    Path path = Path()
      //..addRect(Rect.fromLTWH((((size.width) / 2) - 0.5), (width / 2), 1, ((width - 1) / 2)))
      ..addRect(Rect.fromLTWH(0.75, (((size.width) / 2) - 0.5), ((width - 1) / 2), 1))
      ..addOval(Rect.fromCircle(center: Offset(1.5, (size.width / 2)), radius: 1.5))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}


