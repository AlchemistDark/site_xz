import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:site_xz/custom_arc_day_segment.dart';
import 'package:site_xz/month_arrow.dart';
import 'dart:math' as math;

import 'package:site_xz/planner_view_model.dart';
import 'package:site_xz/theme.dart';

const String assetName = 'assets/images/flutter_logo.svg';

class YearCircleClockFace extends StatelessWidget {
  final int _currentDay = DateTime.now().day;
  //final int _currentMonth = DateTime.now().month;

  YearCircleClockFace({Key? key}) : super(key: key);

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
            Center(
              child: SizedBox(
                width: 375,
                height: 388,
                child: OverflowBox(
                  maxWidth: 388,
                  child: SizedBox(
                    width: 388,
                    height: 388,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(388 / 2),
                      child: Container(
                        color: mineDarkColor
                      )
                    )
                  )
                )
              )
            ),
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
              children: segments()
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
              child: GestureDetector(
                onTap: (){},
                child: MonthArrow(rusDateNow())
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
  List<Widget> segments() {
    int numberOfDays = 31;
    int day = DateTime.now().day;
    String topText = ' ';
    bool isCurrent = false;
    bool isPresent = true;
    bool isCelebrate = false;
    Color topColor = mineGreenColor;
    Color bottomTextColor = mineGreenColor;
    Color pointColor = minePinkColor;
    List<Widget> result = [];
    /// Clock face drawer.
    for (int i = 0; i < 31; i++) {
      /// Get the day of the week for each day of the month.
      DateTime date = DateTime(DateTime.now().year, DateTime.now().month, (i + 1));
      switch (date.weekday){
        case 1:
          topText = 'пн';
          break;
        case 6:
          topText = 'сб';
          break;
        case 7:
          topText = 'вс';
          break;
        default:
          topText = ' ';
      }
      if (i == 0) {
        topText = rusMonthNowShort();
      }
      /// Elements colors.
      topColor = mineGreenColor;
      bottomTextColor = mineGreenColor;
      pointColor = minePinkColor;
      if ((((i + 1) > day) && (i < (day + 15))) || (i < (day - 16)) ) {
        topColor = minePinkColor;
        bottomTextColor = minePinkColor;
        pointColor = mineGreenColor;
      }
      if ((day == i)) {
        isCurrent = true;
      }
      if ((i + 1) > numberOfDaysInCurrentMonth()) {
        isPresent = false;
      }
      if ((i < 2) || !isPresent) {
        topColor = calendarSegmentDarkColor;
      }
      result.add(
        Transform.rotate(
          angle: ((math.pi * 2 / 31) * (i + 0.5)),
          child: CustomArcSegment(
            topText: topText,
            topTextColor: mineWhiteColor,
            topColor: topColor,
            bottomText: '${i + 1}',
            bottomTextColor: bottomTextColor,
            bottomColor: calendarSegmentDarkColor,
            pointColor: pointColor,
            numberOfSegments: 31,
            clockFaceDiameter: (262),
            isCurrent: isCurrent,
            isPresent: isPresent,
            isCelebrate: isCelebrate
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

String rusDateNow(){ // ToDo объеденить с остальными подобными.
  String rusMonth;
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  switch(month){
    case 1:
      rusMonth = 'января';
      break;
    case 2:
      rusMonth = 'февраля';
      break;
    case 3:
      rusMonth = 'марта';
      break;
    case 4:
      rusMonth = 'апреля';
      break;
    case 5:
      rusMonth = 'мая';
      break;
    case 6:
      rusMonth = 'июня';
      break;
    case 7:
      rusMonth = 'июля';
      break;
    case 8:
      rusMonth = 'августа';
      break;
    case 9:
      rusMonth = 'сентября';
      break;
    case 10:
      rusMonth = 'октября';
      break;
    case 11:
      rusMonth = 'ноября';
      break;
    case 12:
      rusMonth = 'декабря';
      break;
    default:
      rusMonth = 'месяц';
  }
  return '$day $rusMonth $year';
}

String rusMonthNowShort(){
  String rusMonth;
  int month = DateTime.now().month;
  switch(month){
    case 1:
      rusMonth = 'янв';
      break;
    case 2:
      rusMonth = 'фев';
      break;
    case 3:
      rusMonth = 'мар';
      break;
    case 4:
      rusMonth = 'апр';
      break;
    case 5:
      rusMonth = 'май';
      break;
    case 6:
      rusMonth = 'июн';
      break;
    case 7:
      rusMonth = 'июл';
      break;
    case 8:
      rusMonth = 'авг';
      break;
    case 9:
      rusMonth = 'сен';
      break;
    case 10:
      rusMonth = 'окт';
      break;
    case 11:
      rusMonth = 'ноя';
      break;
    case 12:
      rusMonth = 'дек';
      break;
    default:
      rusMonth = 'мес';
  }
  return rusMonth;
}

int numberOfDaysInCurrentMonth(){ // ToDo объеденить с остальными подобными.
  int month = DateTime.now().month;
  int result;
  switch(month){
    case 1:
      result = 31;
      break;
    case 2:
      result = 28;  // Todo високосные годы
      break;
    case 3:
      result = 31;
      break;
    case 4:
      result = 30;
      break;
    case 5:
      result = 31;
      break;
    case 6:
      result = 30;
      break;
    case 7:
      result = 31;
      break;
    case 8:
      result = 31;
      break;
    case 9:
      result = 30;
      break;
    case 10:
      result = 31;
      break;
    case 11:
      result = 30;
      break;
    case 12:
      result = 31;
      break;
    default:
      result = 31;
  }
  return result;
}

List<Celebration> celebrations = [
  Celebration(11, 4),
  Celebration(11, 7),
  Celebration(11, 15),
  Celebration(11, 27),
  Celebration(12, 3),
  Celebration(12, 13),
  Celebration(12, 31),
];