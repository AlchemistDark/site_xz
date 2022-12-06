import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:site_xz/custom_arc_day_segment.dart';
import 'package:site_xz/month_arrow.dart';
import 'package:site_xz/theme.dart';
import 'package:site_xz/user_class.dart';
import 'package:site_xz/month_circular_face_logic.dart';
import 'dart:math' as math;

/// Month circle clock Face for mine Planner screen.

class MonthCircleClockFace extends StatelessWidget {
  final int _currentDay = DateTime.now().day;
  final List<Celebrate> celebrationList;

  bool isCelebrate(List<Celebrate> celebrationList, int day){
    for (var celebrate in celebrationList) {
      if (celebrate.month == DateTime.now().month) {
        if (celebrate.date == day) {
          return true;
        }
      }
    }
    return false;
  }

  MonthCircleClockFace({required this.celebrationList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1, //scaleFactor,
      child:  Container(
        //color: Color(0xFF00FF00),
        width: 375,
        height: 375,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                color: const Color(0xFF24262D),
                width: 262,
                height: 262,
              )
            ),
            // For position test.
            // Center(
            //   child: Container(
            //     color: const Color(0xFFFF0000),
            //     width: 262,
            //     height: 262,
            //   )
            // ),
            // Center(
            //   child: Container(
            //     color: const Color(0xFF00FF00),
            //     width: 225,
            //     height: 225,
            //   )
            // ),
            // Center(
            //   child: Container(
            //     color: const Color(0xFFFFFF00),
            //     width: 222.5,
            //     height: 222.5,
            //   )
            // ),
            // Center(
            //   child: Container(
            //     color: const Color(0xFF00FFFF),
            //     width: 178,
            //     height: 178,
            //   )
            // ),
            // Center(
            //   child: Container(
            //     width: 322,
            //     height: 322,
            //     decoration: const BoxDecoration(
            //       color: Color(0xFF00FFFF),
            //       shape: BoxShape.circle,
            //     )
            //   )
            // ),
            // Center(
            //   child: Container(
            //     width: 299.5,
            //     height: 299.5,
            //     decoration: const BoxDecoration(
            //       color: Color(0xFF008888),
            //       shape: BoxShape.circle,
            //     )
            //   )
            // ),
            /// Draw the calendar dial.
            /// Рисует циферблат календаря.
            // Center(
            //   child: SizedBox(
            //     width: 375,
            //     height: 388,
            //     child: OverflowBox(
            //       maxWidth: 388,
            //       child: SizedBox(
            //         width: 388,
            //         height: 388,
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(194),
            //           child: Container(
            //             color: mineDarkColor
            //           )
            //         )
            //       )
            //     )
            //   )
            // ),
            Center(
              child: Container(
                width: 378,
                height: 378,
                decoration: const BoxDecoration(
                  color: buttonMineDarkColor,
                  shape: BoxShape.circle
                )
              )
            ),
            Center(
              child: Container(
                width: 193,
                height: 193,
                decoration: const BoxDecoration(
                  color: Color(0xFF2F313A),
                  shape: BoxShape.circle
                )
              )
            ),
            Stack(
              children: segments(celebrationList)
            ),
            Center(
              child: Container(
                width: 181,
                height: 181,
                decoration: const BoxDecoration(
                  color: Color(0xFF000000),
                  shape: BoxShape.circle,
                )
              )
            ),
            Center(
              child: Container(
                width: 176,
                height: 176,
                decoration: const BoxDecoration(
                  color: Color(0xFF2F313A),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF2F313A),
                      blurRadius: 4,
                      spreadRadius: 5,
                    )
                  ]
                )
              )
            ),
            Center(
              child: Container(
                width: 15.5,
                height: 15.5,
                decoration: const BoxDecoration(
                  color: Color(0xFF474952),
                  shape: BoxShape.circle,
                )
              )
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
                //color: Colors.deepPurpleAccent.withOpacity(0.75),
                height: 375,
                width:  375,
                margin: const EdgeInsets.only(right: 3),
                child: Stack(
                  children: celebrationIcons()
                )
              )
            ),
            /// Draw the clock hand.
            /// Рисуем стрелку.
            Transform.rotate(
              angle: ((math.pi * 2 / 31) * (_currentDay - 0.5)),
              child: GestureDetector(
                onTap: (){},
                child: MonthArrow(CustomRusDateNow().rusLongMonth)
              )
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
        )
      )
    );
  }
  /// Draw clock face.
  /// Рисует циферблат.
  List<Widget> segments(List<Celebrate> celebrationList) {
    List<Widget> result = [];
    for (int i = 0; i < 31; i++) {
      final DaySegment daySegment = DaySegment(number: i, celebrationList: celebrationList);
      result.add(
        Transform.rotate(
          angle: daySegment.angle,
          child: CustomArcDaySegment(
            topText: daySegment.topText,
            topTextColor: daySegment.topTextColor,
            topColor: daySegment.topColor,//
            bottomText: daySegment.bottomText,//
            bottomTextColor: daySegment.bottomTextColor,//
            bottomColor: daySegment.bottomColor,//
            pointColor: daySegment.pointColor,//
            numberOfSegments: 31,//
            clockFaceDiameter: 262,//
            isCurrent: daySegment.isCurrent,
            isPresent: daySegment.isPresent,//
            isCelebrate: isCelebrate(celebrationList, (i + 1))
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
      if (isCelebrate(celebrationList, (i + 1))) {
        result.add(
          Container(
            alignment: Alignment.topLeft,
            width: 375,
            height: 375,
            margin: EdgeInsets.only(
              top: ((187.5 - (161 * (math.cos(math.pi * 2 / 31 * (i + 0.5)))) - 22.5)),
              left: ((187.5 + (161 * (math.sin(math.pi * 2 / 31 * (i + 0.5)))) - 22.5))
            ),
            child:Container(
              alignment: Alignment.topLeft,
              width: 375,
              height: 375,
              child: Container(
                width: 45,
                height: 45,
                padding: EdgeInsets.all(5),
                child: SvgPicture.asset(
                  'assets/images/relatives_group_icon.svg',
                  fit: BoxFit.scaleDown
                ),
                decoration: const BoxDecoration(
                  color: relativesGroupButtonColor,
                  shape: BoxShape.circle,
                )
              )
            )
          )
        );
      }
    }
    return result;
  }
}