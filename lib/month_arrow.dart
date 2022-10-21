import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

/// This class implements an arrow for a month circular face.
/// Данный класс реализуе стрелку для месячного циферблата.

class MonthArrow extends StatelessWidget {
  const MonthArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Tail
        // Хвост
        Center(
          widthFactor: 188,
          heightFactor: 188,
          child: ClipPath(
            clipper: MyCustomClipper(), // <--
            child: Container(
              width: 188,
              height: 188,
              color: const Color(0xFFE9549B),
            )
          )
        ),
        // Arrow
        // Стрелка
        Center (
          child: Container(
            width: 184,
            height: 184,
            padding: const EdgeInsets.only(bottom: 75),
            child: Image.asset(
              "assets/images/clock_arrow.png",
              fit:BoxFit.scaleDown
            )
          )
        ),
        // Arrow text
        // Текст стрелки
        Center(
          child: Transform.rotate(
            angle: (-math.pi / 2),
            child: Center(
              widthFactor: 186,
              heightFactor: 186,
              child: Padding(
                padding: const EdgeInsets.only(left: 100, bottom: 18.0),
                child: RichText(
                  text: const TextSpan(
                    text: "",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Roboto'
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Дата",
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
        // Tail text
        // Текст хвоста
        Center(
          child: Transform.rotate(
            angle: (-math.pi / 2),
            child: Container(
              width: 186,
              height: 186,
              child: Padding(
                padding: const EdgeInsets.only(right: 153, top: 83.5),
                child: Column(
                  children: const [
                    Text(
                      'число',
                      style: TextStyle(
                      color: Color(0xFF547CC7),
                        fontSize: 8,
                        fontFamily: 'Roboto'
                      )
                    ),
                    Text(
                      'дней',
                      style: TextStyle(
                        color: Color(0xFF547CC7),
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

class MyCustomClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path()
      // ..moveTo(94, 94)
      // ..lineTo(186, 94) // Добавить отрезок p1p2
      ..addRect(const Rect.fromLTWH(93.5, 94, 1, 93))
      ..addOval(Rect.fromCircle(center: const Offset(94, 186), radius: 2)) // Добавить отрезок p2p3
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}


