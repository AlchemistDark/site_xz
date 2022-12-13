import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/global/theme.dart';
import 'package:site_xz/main_screen/custom_arc_day_segment.dart';
import 'package:site_xz/main_screen/month_arc_segment.dart';
import 'package:site_xz/main_screen/month_arrow.dart';
import 'package:site_xz/main_screen/planner_view_model.dart';
import 'package:site_xz/main_screen/planner_main_screen_logic.dart';

class YearCircleClockFace extends StatelessWidget {
  final AppTheme theme;
  final List<Celebrate> celebrates;
  final int _currentDay = DateTime.now().day; // ToDo
  final int _currentMonth = DateTime.now().month; //ToDo

  YearCircleClockFace({
    required this.theme,
    required this.celebrates,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// Draw the calendar dial.
        Center(
          child: Container(
            width: 375,
            height: 375,
            decoration: BoxDecoration(
              color: theme.clockFaceMainColor,
              shape: BoxShape.circle
            )
          )
        ),
        Center(
          child: Container(
            width: 181,
            height: 181,
            decoration: BoxDecoration(
              color: theme.clockFaceCircleColor,
              shape: BoxShape.circle
            )
          )
        ),
        Center(
          child: Container(
            width: 169,
            height: 169,
            decoration: BoxDecoration(
              color: theme.clockFaceMainColor,
              shape: BoxShape.circle,
            )
          )
        ),
        /// Draw the months rings.
        Stack(
          children: segments()
        ),
        /// Decoration
        Center(
          child: CustomPaint(
            size: const Size(172, 172),
            painter: DecorPainter(
              theme: theme
            )
          )
        ),
        Center(
          child: Transform.rotate(
            angle: (math.pi / 2),
            child: SizedBox(
              width: 172,
              height: 172,
              child: Padding(
                padding: const EdgeInsets.only(left: 2, top: 75),
                child: Text(
                  "${DateTime.now().year + 1}",
                  style: TextStyle(
                    color: theme.yearCircularFaceDecorTextColor,
                    fontSize: 10,
                    fontFamily: 'Roboto'
                  ),
                )
              )
            )
          )
        ),
        Center (
          child: Container(
            width: 55,
            height: 45,
            margin: const EdgeInsets.only(bottom: 70),
              // child: SvgPicture.asset(
              //     theme.logoPath,
               //   color: arrowDarkColor,
               //   fit: BoxFit.fitHeight
              // )
            child: Image.asset(
              theme.logoPath,
              scale: 0.5,
              fit: BoxFit.contain
            )
          )
        ),


        Center(
            child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: theme.clockFaceCenterColor,
                  shape: BoxShape.circle,
                )
            )
        ),



          /// Draw celebration icons.
          /// Рисуем иконки праздников.
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 3, bottom: 3),
              child: Stack(
                children: celebrationIcons()
              )
            )
          ),
          /// Draw the clock hand.
          /// Рисуем стрелку.
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * (_currentDay - 0.5)),
            // child: GestureDetector(
            //   onTap: (){},
            //   child: MonthArrow(rusDateNow())
            // )
          ),
          Center(
            child: Container(
              width: 5.32,
              height: 5.32,
              decoration: const BoxDecoration(
                color: Color(0xFF474952),
                shape: BoxShape.circle,
              )
            )
          )
        ]
      );
  }
  /// Draw clock face.
  List<Widget> segments() {
    List<Widget> result = [];
    for (int i = (_currentMonth); i < (_currentMonth + 12); i++) {
      result.add(
        Transform.rotate(
          angle: ((math.pi * 2 / 12) * (i - 0.5)),
          child: MonthArcSegment(
            theme: theme,
            iterator: i
          )
        )
      );
    }
    return result;
  }
  /// Draw celebration icons.
  /// Рисует иконки праздников.
  List<Widget> celebrationIcons() {
    List<Widget> result = [];
    for (int i = 0; i < 31; i++) {
      result.add(
        Padding(
          padding: EdgeInsets.only(
            top: (187.5 + (161 * (math.cos(math.pi * 2 / 31 * i))) - 22.5),
            left: (187.5 + (161 * (math.sin(math.pi * 2 / 31 * i))) - 22.5)
          ),
          child: Container(
            width: 45,
            height: 45,
            padding: EdgeInsets.all(5),
            child: SvgPicture.asset(
              'assets/images/relatives_group_icon.svg',
              fit: BoxFit.scaleDown
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF9388CC),
              shape: BoxShape.circle,
            )
          )
        )
      );
    }
    return result;
  }
}

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

class DecorPainter extends CustomPainter{
  final AppTheme theme;

  const DecorPainter({required this.theme});

  @override
  void paint(Canvas canvas, Size size){

    final paintHorizontalLine = Paint()
      ..color = theme.yearCircularFaceDecorColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(
      const Offset(0.0, (172.0 / 2)),
      const Offset(172.0, (172.0 / 2)),
      paintHorizontalLine
    );

    final paintVerticalLongLine = Paint()
      ..color = theme.yearCircularFaceDecorColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(
      const Offset((172.0 / 2), 172),
      const Offset((172.0 / 2), 73.5),
      paintVerticalLongLine
    );

    final paintVerticalShortLine = Paint()
      ..color = theme.yearCircularFaceDecorColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(
      const Offset((172.0 / 2), 0),
      const Offset((172.0 / 2), 25.5),
      paintVerticalShortLine
    );

  }

  @override
  bool shouldRepaint(CustomPainter old){
    return false;
  }
}