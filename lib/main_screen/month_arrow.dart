import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:site_xz/global/theme.dart';

/// This class implements an arrow for a month circular face.
/// Данный класс реализуе стрелку для месячного циферблата.

class MonthArrow extends StatelessWidget {
  final String data;
  const MonthArrow(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// Tail
        /// Хвост
        Center(
          widthFactor: 194,
          heightFactor: 194,
          child: ClipPath(
            clipper: MyCustomClipper(), // <--
            child: Container(
              width: 194,
              height: 194,
              color: mainPinkColor,
            )
          )
        ),
        /// Arrow
        /// Стрелка
        Center(
          child: Container(
            width: 187,
            height: 187,
            padding: const EdgeInsets.only(bottom: 76, right: 1),
            child: SvgPicture.asset(
              "assets/images/clock_arrow3.svg",
              color: arrowDarkColor,
              fit: BoxFit.fitHeight
            )
          )
        ),
        /// Arrow text
        /// Текст стрелки
        Center(
          child: Transform.rotate(
            angle: (-math.pi / 2),
            child: Center(
              widthFactor: 186,
              heightFactor: 186,
              child: Padding(
                padding: const EdgeInsets.only(left: 95, bottom: 18.0),
                child: Text(
                  data,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    color: mainWhiteColor
                  ),
                // child: RichText(
                //   text: TextSpan(
                //     text: "",
                //     style: TextStyle(
                //       fontSize: 12,
                //       fontFamily: 'Roboto'
                //     ),
                //     children: <TextSpan>[
                //       TextSpan(
                //         text: "Дата  ",
                //         style: TextStyle(
                //           color: Color(0xFF52B69A)
                //         )
                //       ),
                //       TextSpan(
                //         text: "Год",
                //         style: TextStyle(
                //           color: Color(0xFF7FA4EA),
                //           decoration: TextDecoration.underline
                //         ),
                //       ),
                //     ]
                //   )
                )
              ),
            )
          ),
        ),
        /// Tail text
        /// Текст хвоста
        Center(
          child: Transform.rotate(
            angle: (-math.pi / 2),
            child: Container(
              width: 186,
              height: 186,
              child: Padding(
                padding: EdgeInsets.only(right: 152, top: 83.5),
                child: Column(
                  children: [
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
/// Отрисовка хвоста.
class MyCustomClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final width = size.width - 1;
    Path path = Path()
      ..addRect(Rect.fromLTWH((((size.width) / 2) - 0.5), (width / 2), 1, ((width - 1) / 2)))
      ..addOval(Rect.fromCircle(center: Offset((size.width / 2), (width - 1.5)), radius: 1.5)) // Добавить отрезок p2p3
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}


