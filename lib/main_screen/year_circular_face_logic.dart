import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/global/theme.dart';
import 'package:site_xz/main_screen/celebrate_widget.dart';
import 'package:site_xz/main_screen/day_position_on_year_circle.dart';
import 'package:site_xz/main_screen/month_arc_segment.dart';
import 'package:site_xz/main_screen/rus_month_class.dart';

class YearCircularClockFaceLogic {
  final AppTheme theme;
  final List<Celebrate> celebrates;
  final Function(int) celebrateIconCallback;

  final int currentDay = DateTime.now().day;
  final int currentMonth = DateTime.now().month;
  final int currentYear = DateTime.now().year;

  YearCircularClockFaceLogic({
    required this.theme,
    required this.celebrates,
    required this.celebrateIconCallback,
  });

  /// Arrow text.
  String currentDate() => '$currentDay ${RusMonth(currentYear, currentMonth).rusLongMonth} $currentYear';

  /// Draw clock face.
  List<Widget> segments(VoidCallback segmentCallback) {
    List<Widget> result = [];
    for (int i = (currentMonth + 1); i < (currentMonth + 12); i++) {
      result.add(
        Transform.rotate(
          angle: ((math.pi * 2 / 12) * (i - 0.5)),
          child: MonthArcSegment(
            theme: theme,
            iterator: i,
            callback: segmentCallback
          )
        )
      );
    }
    // It is necessary that the current month is added last.
    result.add(
      Transform.rotate(
        angle: ((math.pi * 2 / 12) * (currentMonth - 0.5)),
        child: MonthArcSegment(
          theme: theme,
          iterator: currentMonth,
          callback: segmentCallback
        )
      )
    );
    return result;
  }

  /// Draw dots that indicate that there is a celebration on this day.
  List<Widget> celebrationDots() {
    List<Widget> result = [];
    int year;
    int month;
    int day;
    for (Celebrate celebrate in celebrates) {
      day = celebrate.day;
      month = celebrate.month;
      year = (month < currentMonth)? (currentYear + 1) : currentYear;
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

  // ToDo Провести рефакторинг.
  // ToDo очень усложнило код в MainPlanner(State) то,
  // что я сразу не догадался праздники с конца считать.
  /// Draw celebration icons.
  List<Widget> celebrationIcons() {
    List<Widget> result = [];
    DayPosition position;
    int year;
    int month;
    int day;
    int indexOfCurrent = 0;
    for (Celebrate celebrate in celebrates) {
      day = celebrate.day;
      month = celebrate.month;
      year = (month < currentMonth)? (currentYear + 1) : currentYear;
      position = DayPosition(year, month, day);
      result.add(
        Center(
          child: SizedBox(
            width: 371,
            height: 375,
            child: Align(
              alignment: Alignment(position.sin, (-position.cos)),
              child: CelebrateWidget(
                theme: theme,
                celebrate: celebrate,
                isCurrent: false,
                haveStatus: false,
                isForYear: true,
                mainCallback: celebrateIconCallback,
                indexOfCurrent: indexOfCurrent,
                statusCallback: (){},
              )
            )
          )
        )
      );
      indexOfCurrent++;
    }
    return result;
  }

  /// Draw current celebration icon.
  Widget currentCelebrationIcon(int indexOfCurrent) {
    Widget result;
    DayPosition position;
    int year;
    int month;
    int day;
    Celebrate celebrate = celebrates[(indexOfCurrent)];
    day = (celebrate.day - 1);
    month = celebrate.month;
    year = (month < currentMonth)? (currentYear + 1) : currentYear;
    position = DayPosition(year, month, day);
    result = Center(
      child: SizedBox(
        width: 371,
        height: 375,
        child: Align(
          alignment: Alignment(position.sin, (-position.cos)),
          child: CelebrateWidget(
            theme: theme,
            celebrate: celebrate,
            isCurrent: true,
            haveStatus: false,
            isForYear: true,
            mainCallback: celebrateIconCallback,
            indexOfCurrent: indexOfCurrent,
            statusCallback: (){},
          )
        )
      )
    );
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