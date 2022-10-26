import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

/// This class implements an arrow for a month circular face.
/// Данный класс реализуе стрелку для месячного циферблата.

class MonthArrow extends StatelessWidget {
  /// Scale factor for adaptive layout.
  /// Масштабный коэффициент для адаптивной вёрстки.
  final double pix;
  const MonthArrow({required this.pix, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// Tail
        /// Хвост
        Center(
          widthFactor: (182 * pix),
          heightFactor: (182 * pix),
          child: ClipPath(
            clipper: MyCustomClipper(), // <--
            child: Container(
              width: (182 * pix),
              height: (182 * pix),
              color: const Color(0xFFE9549B),
            )
          )
        ),
        /// Arrow
        /// Стрелка
        Center (
          child: Container(
            width: (175 * pix),
            height: (175 * pix),
            padding: EdgeInsets.only(bottom: (71.5 * pix)),
            child: Image.asset(
              "assets/images/clock_arrow.png",
              fit:BoxFit.scaleDown
            )
          )
        ),
        /// Arrow text
        /// Текст стрелки
        Center(
          child: Transform.rotate(
            angle: (-math.pi / 2),
            child: Center(
              widthFactor: (186 * pix),
              heightFactor: (186 * pix),
              child: Padding(
                padding: EdgeInsets.only(left: (95 * pix), bottom: (18.0 * pix)),
                child: RichText(
                  text: TextSpan(
                    text: "",
                    style: TextStyle(
                      fontSize: (12 * pix),
                      fontFamily: 'Roboto'
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Дата  ",
                        style: TextStyle(
                          color: Color(0xFF52B69A)
                        )
                      ),
                      TextSpan(
                        text: "Год",
                        style: TextStyle(
                          color: Color(0xFF7FA4EA),
                          decoration: TextDecoration.underline
                        ),
                      ),
                    ]
                  )
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
              width: (186 * pix),
              height: (186 * pix),
              child: Padding(
                padding: EdgeInsets.only(right: (140 * pix), top: (83.5 * pix)),
                child: Column(
                  children: [
                    Text(
                      'число',
                      style: TextStyle(
                      color: Color(0xFF547CC7),
                        fontSize: (8 * pix),
                        fontFamily: 'Roboto'
                      )
                    ),
                    Text(
                      'дней',
                      style: TextStyle(
                        color: Color(0xFF547CC7),
                        fontSize: (8 * pix),
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
    final width = size.width - 4;
    Path path = Path()
      ..addRect(Rect.fromLTWH((((size.width) / 2) - 0.5), (width / 2), 1, ((width - 2) / 2)))
      ..addOval(Rect.fromCircle(center: Offset((size.width / 2), (width)), radius: (size.width / (size.width / 2)))) // Добавить отрезок p2p3
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}


