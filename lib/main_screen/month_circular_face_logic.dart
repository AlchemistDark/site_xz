import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/global/theme.dart';
import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/main_screen/day_arc_segment.dart';
import 'package:site_xz/main_screen/rus_month_class.dart';

class MonthCircularClockFaceLogic{
  final AppTheme theme;
  final List<Celebrate> celebrates;
  final Function(int) celebrateIconCallback;

  final int currentDay = DateTime.now().day;
  final int currentMonth = DateTime.now().month;
  final int currentYear = DateTime.now().year;

  MonthCircularClockFaceLogic({
    required this.theme,
    required this.celebrates,
    required this.celebrateIconCallback,
  });

  /// Arrow text.
  String currentDate() => '$currentDay ${RusMonth(currentYear, currentMonth).rusLongMonth} $currentYear';


  /// Draw clock face.
  List<Widget> segments(List<Celebrate> celebrates) {
    List<Widget> result = [];
    int count = 0;
    print("cd $currentDay");
    for (int i = currentDay; i < (currentDay + 31); i++) {
      //print('test ${(!(i > RusMonth(currentYear, currentMonth).numberOfDays))} ${(i != currentDay)} ${((!(i > RusMonth(currentYear, currentMonth).numberOfDays)) || (i != currentDay))}');
      if (i != currentDay) {
        print("testtest $i");
        count++;
      }


      // if ((!(i > RusMonth(currentYear, currentMonth)
      //   .numberOfDays)) && (i != currentDay)) {
      //   print("testtest $i");
      //   count++;
      // }
      print("count $count");
      final DaySegment daySegment = DaySegment(
        number: i,
        count: count
      );
      // final OldDaySegment oldDaySegment = OldDaySegment(
      //   number: i,
      //   celebrates: celebrates
      // );
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
            isCelebrate: isCelebrate(celebrates, (i + 1))
          )
        )
      );
    }
    return result;
  }


  // /// Draw clock face.
  // List<Widget> segments() {
  //   List<Widget> result = [];
  //   for (int i = (currentMonth); i < (currentMonth + 12); i++) {
  //     result.add(
  //         Transform.rotate(
  //             angle: ((math.pi * 2 / 12) * (i - 0.5)),
  //             child: MonthArcSegment(
  //                 theme: theme,
  //                 iterator: i
  //             )
  //         )
  //     );
  //   }
  //   return result;
  // }

  bool isCelebrate(List<Celebrate> celebrates, int day){
    for (var celebrate in celebrates) {
      if (celebrate.month == DateTime.now().month) {
        if (celebrate.day == day) {
          return true;
        }
      }
    }
    return false;
  }

}

class DaySegment{

  final int currentDay = DateTime.now().day;
  final int currentMonth = DateTime.now().month;
  final int currentYear = DateTime.now().year;

  /// Input.
  final int number;
  final int count;

  /// Output.
  late double angle;
  late bool isCurrent;
  late bool isPresent;
  late String topText;
  late Color topTextColor = mainWhiteColor;
  late Color topColor  = mainGreenColor;
  late String bottomText;
  late Color bottomTextColor = mainWhiteColor;
  late Color bottomColor  = mainGreenColor;
  late Color pointColor  = mainGreenColor;
  late bool isCelebrate = false;//: isCelebrate(celebrationList, (i + 1))


  DaySegment({
    required this.number,
    required this.count
  }){
    int i = (number > 31)? (number - 31) : number;
    angle = ((math.pi * 2 / 31) * (i - 0.5));
    isCurrent = (count == 0);
    isPresent = (!(i > RusMonth(currentYear, currentMonth).numberOfDays));
    topText = _getTopText(i);
    bottomText = '$i';


  }

  String _getTopText(int i){
    print('i $i');
    if (i == 1) {
      int monthText = (currentMonth > 12)? (currentMonth - 12) : currentMonth;
      return  RusMonth(currentYear, monthText).rusShortMonth;
    }
    DateTime today = DateTime(currentYear, currentMonth, currentDay);
    int start = (today.weekday + count) % 7;
    print("day $start ${today.weekday} $count");
    switch (start){
      case 1:
        return 'пн';
      case 6:
        return 'сб';
      case 0:
        return 'вс';
      default:
        return '';
    }
  }

  List<Color> _getColors(int i, bool b){
    List<Color> result = [];
    Color tempTopTextColor = mainWhiteColor;
    Color tempTopColor = mainGreenColor;
    Color tempBottomTextColor = mainGreenColor;
    Color tempBottomColor = calendarSegmentDarkColor;
    Color tempPointColor = mainPinkColor;
    // if (((i > day) && (i < (day + 14))) || (i < (day - 15)) ) {
    //   tempTopColor = mainPinkColor;
    //   tempBottomTextColor = mainPinkColor;
    //   tempPointColor = mainGreenColor;
    // }
    if (i == 1) {
      tempTopColor = calendarSegmentDarkColor;
    }
    if (!b){
      // tempTopTextColor = tempTopTextColor.withOpacity(opacity);
      // tempTopColor = tempTopColor.withOpacity(opacity);
      // tempBottomTextColor = tempBottomTextColor.withOpacity(opacity);
      // tempBottomColor = tempBottomColor.withOpacity(opacity);
      // tempPointColor = tempPointColor.withOpacity(opacity);
    }
    result.add(tempTopTextColor);
    result.add(tempTopColor);
    result.add(tempBottomTextColor);
    result.add(tempBottomColor);
    result.add(tempPointColor);
    return result;
  }


}

class OldDaySegment{

  final int day = DateTime.now().day;
  final double opacity = 0.50;

  /// Input.
  final int number;
  final List<Celebrate> celebrates;

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
  late bool isCelebrate;//: isCelebrate(celebrationList, (i + 1))

  OldDaySegment({
    required this.number,
    required this.celebrates
  }){
    int i = (number > 31)? (number - 31) : number;
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
    isCelebrate = _getIsCelebrate(celebrates, i);
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
    Color tempTopTextColor = mainWhiteColor;
    Color tempTopColor = mainGreenColor;
    Color tempBottomTextColor = mainGreenColor;
    Color tempBottomColor = calendarSegmentDarkColor;
    Color tempPointColor = mainPinkColor;
    if (((i > day) && (i < (day + 14))) || (i < (day - 15)) ) {
      tempTopColor = mainPinkColor;
      tempBottomTextColor = mainPinkColor;
      tempPointColor = mainGreenColor;
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
  bool _getIsCelebrate(List<Celebrate> celebrationList, int day){
    for (var celebrate in celebrationList) {
      if (celebrate.month == DateTime.now().month) {
        if (celebrate.date == day) {
          return true;
        }
      }
    }
    return false;
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