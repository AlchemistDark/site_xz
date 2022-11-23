import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:site_xz/custom_arc_day_segment.dart';
import 'package:site_xz/month_arrow.dart';
import 'dart:math' as math;

import 'package:site_xz/theme.dart';
import 'package:site_xz/user_class.dart';

const String assetName = 'assets/images/flutter_logo.svg';

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

            /// Draw the calendar dial.
            /// Рисует циферблат календаря.
            Stack(
              children: segments()
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
    //bool isCelebrate;
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
      // if (i == 0) {
      //   topText = rusMonthNowShort();
      // }
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
      // if ((i + 1) > numberOfDaysInCurrentMonth()) {
      //   isPresent = false;
      // }
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

class DaySegment{

  final int day = DateTime.now().day;
  final double opacity = 0.50;

  /// Input.
  final int number;

  /// Output.
  late double angle;
  late bool isCurrent;
  late bool isPresent;
  late String topText;
  late Color topTextColor;
  late Color topColor;
  late String bottomText;
  late Color bottomTextColor;
  late Color bottomColor;
  late Color pointColor;
//   isCelebrate: isCelebrate(celebrationList, (i + 1))

//   //bool isCelebrate;

  DaySegment(this.number){
    int i = (number + 1);
    angle = ((math.pi * 2 / 31) * (i - 0.5));
    isCurrent = (day == i);
    isPresent = (!(i > CustomRusDateNow().numberOfDays));
    topText = _getTopText(i);
    bottomText = '$i';
    topTextColor = _getColors(i, isPresent)[0];
    topColor = _getColors(i, isPresent)[1];
    bottomTextColor = _getColors(i, isPresent)[2];
    bottomColor = _getColors(i, isPresent)[3];
    pointColor = _getColors(i, isPresent)[4];
  }

  String _getTopText(int i){
    DateTime date = DateTime(DateTime.now().year, DateTime.now().month, (i));
    if (i == 1) {
      return CustomRusDateNow().rusShortMonth;
    }
    switch (date.weekday){
      case 1:
        return 'пн';
      case 6:
        return 'сб';
      case 7:
        return 'вс';
      default:
        return '';
    }
  }

  List<Color> _getColors(int i, bool b){
    List<Color> result = [];
    Color tempTopTextColor = mineWhiteColor;
    Color tempTopColor = mineGreenColor;
    Color tempBottomTextColor = mineGreenColor;
    Color tempBottomColor = calendarSegmentDarkColor;
    Color tempPointColor = minePinkColor;
    if (((i > day) && (i < (day + 14))) || (i < (day - 15)) ) {
      tempTopColor = minePinkColor;
      tempBottomTextColor = minePinkColor;
      tempPointColor = mineGreenColor;
    }
    if (i == 1) {
      tempTopColor = calendarSegmentDarkColor;
    }
    if (!b){
      tempTopTextColor = tempTopTextColor.withOpacity(opacity);
      tempTopColor = tempTopColor.withOpacity(opacity);
      tempBottomTextColor = tempBottomTextColor.withOpacity(opacity);
      tempBottomColor = tempBottomColor.withOpacity(opacity);
      tempPointColor = tempPointColor.withOpacity(opacity);
    }
    result.add(tempTopTextColor);
    result.add(tempTopColor);
    result.add(tempBottomTextColor);
    result.add(tempBottomColor);
    result.add(tempPointColor);
    return result;
  }
}

class CustomRusDateNow{
  late String rusLongMonth;
  late String rusShortMonth;
  late int numberOfDays;

  CustomRusDateNow(){
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    switch(month){
      case 1:
        rusLongMonth = 'января';
        rusShortMonth = 'янв';
        numberOfDays = 31;
        break;
      case 2:
        rusLongMonth = 'февраля';
        rusShortMonth = 'фев';
        if ((year % 4) == 0) {
          numberOfDays = 29;
        } else {
          numberOfDays = 28;
        }
        break;
      case 3:
        rusLongMonth = 'марта';
        rusShortMonth = 'мар';
        numberOfDays = 31;
        break;
      case 4:
        rusLongMonth = 'апреля';
        rusShortMonth = 'апр';
        numberOfDays = 30;
        break;
      case 5:
        rusLongMonth = 'мая';
        rusShortMonth = 'май';
        numberOfDays = 31;
        break;
      case 6:
        rusLongMonth = 'июня';
        rusShortMonth = 'июн';
        numberOfDays = 30;
        break;
      case 7:
        rusLongMonth = 'июля';
        rusShortMonth = 'июл';
        numberOfDays = 31;
        break;
      case 8:
        rusLongMonth = 'августа';
        rusShortMonth = 'авг';
        numberOfDays = 31;
        break;
      case 9:
        rusLongMonth = 'сентября';
        rusShortMonth = 'сен';
        numberOfDays = 30;
        break;
      case 10:
        rusLongMonth = 'октября';
        rusShortMonth = 'окт';
        numberOfDays = 31;
        break;
      case 11:
        rusLongMonth = 'ноября';
        rusShortMonth = 'ноя';
        numberOfDays = 30;
        break;
      case 12:
        rusLongMonth = 'декабря';
        rusShortMonth = 'дек';
        numberOfDays = 31;
        break;
      default:
        rusLongMonth = 'месяц';
        rusShortMonth = 'мес';
    }
  }
}