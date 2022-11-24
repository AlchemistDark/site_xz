import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:site_xz/theme.dart';
import 'package:site_xz/user_class.dart';

class DaySegment{

  final int day = DateTime.now().day;
  final double opacity = 0.50;

  /// Input.
  final int number;
  final List<Celebrate> celebrationList;

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

//   //bool isCelebrate;



  DaySegment({
    required this.number,
    required this.celebrationList
  }){
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
    isCelebrate = _getIsCelebrate(celebrationList, i);
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