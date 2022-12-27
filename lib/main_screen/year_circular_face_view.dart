import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/global/theme.dart';
import 'package:site_xz/main_screen/day_position_on_year_circle.dart';
import 'package:site_xz/main_screen/year_arrow.dart';
import 'package:site_xz/main_screen/year_circular_face_logic.dart';

class YearCircleClockFace extends StatelessWidget {
  final AppTheme theme;
  final List<Celebrate> celebrates;
  final int currentCelebrate;
  final VoidCallback arrowCallback;
  final Function(int) celebrateIconCallback;
  late final YearCircularFaceLogic logic;

  YearCircleClockFace({
    required this.theme,
    required this.celebrates,
    required this.currentCelebrate,
    required this.arrowCallback,
    required this.celebrateIconCallback,
    Key? key
  }) : super(key: key) {
    logic = YearCircularFaceLogic(theme: theme, celebrates: celebrates, celebrateIconCallback: celebrateIconCallback);
  }

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
          children: logic.segments()
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
                  "${logic.currentYear + 1}",
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
        Center(
          child: Container(
            width: 55,
            height: 45,
            margin: const EdgeInsets.only(bottom: 70),
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
        /// Draw the clock hand.
        Transform.rotate(
          angle: DayPosition(
            logic.currentYear,
            logic.currentMonth,
            logic.currentDay
          ).degree,
          child: GestureDetector(
            onTap: arrowCallback,
            child: YearArrow(logic.currentDate(), theme)
          )
        ),
        Center(
          child: Container(
            width: 5.5,
            height: 5.5,
            decoration: BoxDecoration(
              color: theme.yearCircularArrowCenterColor,
              shape: BoxShape.circle,
            )
          )
        ),
        /// Draw dots that indicate that there is a celebration on this day.
        Stack(
          children: logic.celebrationDots()
        ),
        /// Draw celebration icons.
        Stack(
          children: logic.celebrationIcons()
        ),
        logic.currentCelebrationIcon(currentCelebrate),//currentCelebrate),
      ]
    );
  }

}

