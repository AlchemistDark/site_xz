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
        /// Draw the months rings.
        Stack(
          children: segments()
        ),



          Center (
            child: Container(
              width: 52,
              height: 43,
              //color: Color(0xFF00FF00),
              margin: const EdgeInsets.only(bottom: 96),
              child: Image.asset(
                "assets/images/logo_dark.png",
                fit:BoxFit.scaleDown
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
  /// Рисует циферблат.
  List<Widget> segments() {




    int numberOfDays = 12;
    int day = DateTime.now().day;
    String topText = ' ';
    bool isCurrent = false;
    bool isPresent = true;
    bool isCelebrate = false;
    Color topColor = mainGreenColor;
    Color bottomTextColor = mainGreenColor;
    Color pointColor = mainPinkColor;
    List<Widget> result = [];

    /// Clock face drawer.

    for (int i = (_currentMonth); i < (_currentMonth + 12); i++) {

      /// Get the day of the week for each day of the month.
      // DateTime date = DateTime(DateTime.now().year, DateTime.now().month, (i + 1));
      // switch (date.weekday){
      //   case 1:
      //     topText = 'пн';
      //     break;
      //   case 6:
      //     topText = 'сб';
      //     break;
      //   case 7:
      //     topText = 'вс';
      //     break;
      //   default:
      //     topText = ' ';
      // }
      // if (i == 0) {
      //   topText = rusMonthNowShort();
      // }
      // /// Elements colors.
      // topColor = mainGreenColor;
      // bottomTextColor = mainGreenColor;
      // pointColor = mainPinkColor;
      // if ((((i + 1) > day) && (i < (day + 15))) || (i < (day - 16)) ) {
      //   topColor = mainPinkColor;
      //   bottomTextColor = mainPinkColor;
      //   pointColor = mainGreenColor;
      // }
      // if ((day == i)) {
      //   isCurrent = true;
      // }
      // if ((i + 1) > numberOfDaysInCurrentMonth()) {
      //   isPresent = false;
      // }
      // if ((i < 2) || !isPresent) {
      //   topColor = calendarSegmentDarkColor;
      // }

      //print(i);

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