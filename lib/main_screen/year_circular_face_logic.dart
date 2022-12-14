import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/global/theme.dart';
import 'package:site_xz/main_screen/custom_arc_day_segment.dart';
import 'package:site_xz/main_screen/day_position_on_year_circle.dart';
import 'package:site_xz/main_screen/month_arc_segment.dart';
import 'package:site_xz/main_screen/month_arrow.dart';
import 'package:site_xz/main_screen/planner_view_model.dart';
import 'package:site_xz/main_screen/planner_main_screen_logic.dart';
import 'package:site_xz/main_screen/rus_month_class.dart';
import 'package:site_xz/main_screen/year_arrow.dart';

class Logic {
  final AppTheme theme;
  final List<Celebrate> celebrates;
  final VoidCallback callback;

  final int _currentDay = DateTime.now().day; // ToDo
  final int _currentMonth = DateTime.now().month; //ToDo
  final int _currentYear = DateTime.now().year; //ToDo

  Logic({
    required this.theme,
    required this.celebrates,
    required this.callback,
  });

  /// Arrow text.
  String currentDate() => '$_currentDay ${RusMonth(_currentYear, _currentMonth).rusLongMonth} $_currentYear';

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

  /// Draw dots that indicate that there is a celebration on this day.
  List<Widget> celebrationsDots() {
    List<Widget> result = [];
    int year;
    int month;
    int day;
    for (Celebrate celebrate in celebrates) {
      day = celebrate.day;
      month = celebrate.month;
      year = (month < _currentMonth)? (_currentYear + 1) : _currentYear;
      result.add(
        Transform.rotate(
          angle: DayPosition(year, month, day).degree,
          child: Center(
            child: SizedBox(
              height: 262,
              width: 262,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.mainPinkColor,
                    shape: BoxShape.circle,
                  ),
                )
              )
            )
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
            // child: Container(
            //   width: 45,
            //   height: 45,
            //   padding: EdgeInsets.all(5),
            //   child: SvgPicture.asset(
            //     'assets/images/relatives_group_icon.svg',
            //     fit: BoxFit.scaleDown
            //   ),
            //   decoration: const BoxDecoration(
            //     color: Color(0xFF9388CC),
            //     shape: BoxShape.circle,
            //   )
            // )
          )
      );
    }
    return result;
  }
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