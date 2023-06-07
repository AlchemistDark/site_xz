import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/global/theme.dart';
import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/main_screen/celebrate_widget.dart';
import 'package:site_xz/main_screen/month_circular_face/day_arc_segment.dart';
import 'package:site_xz/main_screen/rus_month_class.dart';

// ToDo протестировать декабрь и следующий за ним январь на согласованность, так как у них разные годы.

class MonthCircularClockFaceLogic{
  final AppTheme theme;
  final List<Celebrate> celebrates;
  final Function(int) celebrateIconCallback;

  final int currentDay = DateTime.now().day;
  final int currentMonth = DateTime.now().month;
  final int currentYear = DateTime.now().year;

  late final List<Celebrate> currentCelebrates;

  MonthCircularClockFaceLogic({
    required this.theme,
    required this.celebrates,
    required this.celebrateIconCallback,
  }) {
    currentCelebrates = _getCurrentCelebrates();
  }

  /// Arrow text.
  String currentDate() => '$currentDay ${RusMonth(currentYear, currentMonth).rusLongMonth} $currentYear';

  /// Returns from the list of all celebrations only those celebrations
  /// that should be displayed on the current screen.
  List<Celebrate> _getCurrentCelebrates(){
    List<Celebrate> result = [];
    for(Celebrate celebrate in celebrates){
      if(celebrate.month == currentMonth && celebrate.day >= currentDay) {
        result.add(celebrate);
      }
      if(celebrate.month == (currentMonth + 1) && celebrate.day < currentDay) {
        result.add(celebrate);
      }
    }
    return result;
  }

  /// Arrow text.
  String getCurrentDate() => '$currentDay ${RusMonth(currentYear, currentMonth).rusLongMonth} $currentYear';

  /// Returns the rotation angle of the arrow's tail.
  double getArrowTailAngle(){
    int turnSegmentsNumber = 14;
    int numberOfDays = RusMonth(currentYear, currentMonth).numberOfDays;
    if ((numberOfDays - currentDay) < 14) {
      /// 45 = 31 (number of screen segments) + 14 (two weeks).
      turnSegmentsNumber = 45 - numberOfDays;
    }
    return ((-math.pi / 2) + ((math.pi * 2 / 31) * (currentDay - 15.5 + turnSegmentsNumber)));
  }

  /// Draw clock face.
  List<Widget> segments(List<Celebrate> celebrates) {
    List<Widget> result = [];
    int count = 1;
    for (int i = (currentDay + 1); i < (currentDay + 31); i++) {
      int number = (i < 32)? i : (i - 31);
      int month = (i < 32)? currentMonth : (currentMonth + 1);
      bool isPresent =
        (number <= RusMonth(currentYear, currentMonth).numberOfDays)
          ?  true : false;
      final DaySegment daySegment = DaySegment(
        number: number,
        count: count,
        isPresent: isPresent,
        theme: theme,
      );
      if (number <= RusMonth(currentYear, currentMonth).numberOfDays) {
        count++;
      }
      result.add(
      Transform.rotate(
        angle: daySegment.angle,
        child: CustomArcDaySegment(
          topText: daySegment.topText,
          topTextColor: daySegment.topTextColor,
          topColor: daySegment.topColor,
          bottomText: daySegment.bottomText,
          bottomTextColor: daySegment.bottomTextColor,
          bottomColor: daySegment.bottomColor,
          pointColor: daySegment.pointColor,
          clockFaceDiameter: 262,
          isCurrent: false,
          isPresent: isPresent,
          isCelebrate: isCelebrate(number, month)// ToDo
          )
        )
      );
    }

    /// The last segment is special.
    CurrentDaySegment currentDaySegment = CurrentDaySegment(
      number: currentDay,
      theme: theme
    );
    result.add(
      Transform.rotate(
        angle: currentDaySegment.angle,
        child: CustomArcDaySegment(
          topText: currentDaySegment.topText,
          topTextColor: currentDaySegment.topTextColor,
          topColor: currentDaySegment.topColor,
          bottomText: currentDaySegment.bottomText,
          bottomTextColor: currentDaySegment.bottomTextColor,
          bottomColor: currentDaySegment.bottomColor,
          pointColor: currentDaySegment.pointColor,
          clockFaceDiameter: 262,
          isCurrent: true,
          isPresent: true,
          isCelebrate: isCelebrate(currentDay, currentMonth)
        )
      )
    );
    return result;
  }

  bool isCelebrate(int day, int month){
    for (var celebrate in currentCelebrates) {
      if (celebrate.day == day && celebrate.month == month) {
        return true;
      }
    }
    return false;
  }

  // ToDo провести рефакторинг.
  // ToDo очень усложнило код в MainPlanner(State) то,
  // что я сразу не догадался праздники с конца считать.
  /// Draw celebration icons.
  List<Widget> celebrationIcons() {
    List<Widget> result = [];
    int day;
    int indexOfCurrent = 0;
    for (Celebrate celebrate in currentCelebrates) {
      day = (celebrate.day - 1);
      double cos = math.cos(math.pi * 2 / 31 * (day + 0.5));
      double sin = math.sin(math.pi * 2 / 31 * (day + 0.5));
      result.add(
        Center(
          child: SizedBox(
            width: 371,
            height: 375,
              child: Align(
                alignment: Alignment(sin, -cos),
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
    Celebrate celebrate = currentCelebrates[(indexOfCurrent)];
    int day = (celebrate.day - 1);
    double cos = math.cos(math.pi * 2 / 31 * (day + 0.5));
    double sin = math.sin(math.pi * 2 / 31 * (day + 0.5));
    result = Center(
      child: SizedBox(
        width: 373,
        height: 377,
        child: Align(
          alignment: Alignment(sin, -cos),
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

class DaySegment{

  final int currentDay = DateTime.now().day;
  final int currentMonth = DateTime.now().month;
  final int currentYear = DateTime.now().year;

  /// Input.
  final int number;
  final int count;
  final bool isPresent;
  final AppTheme theme;

  /// Output.
  late double angle;
  late String topText;
  late Color topTextColor;
  late Color topColor;
  late String bottomText;
  late Color bottomTextColor;
  late Color bottomColor;
  late Color pointColor;

  DaySegment({
    required this.number,
    required this.count,
    required this.isPresent,
    required this.theme
  }){
    angle = ((math.pi * 2 / 31) * (number - 0.5));
    topText = _getTopText(number);
    topTextColor = _getColors()[0];
    topColor = _getColors()[1];
    bottomText = '$number';
    bottomTextColor = _getColors()[2];
    bottomColor = _getColors()[3];
    pointColor = _getColors()[4];
  }

  String _getTopText(int i){
    if (!isPresent) {
      return '';
    }
    if (i == 1) {
      int monthText = (currentMonth < 12)? (currentMonth + 1) : 1;
      return RusMonth(currentYear, monthText).rusShortMonth;
    }
    DateTime today = DateTime(currentYear, currentMonth, currentDay);
    int topCount = (today.weekday + count) % 7;
    switch (topCount){
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

  List<Color> _getColors(){
    List<Color> result = [];
    double opacity = isPresent? 1.00 : 0.50;
    Color tempTopTextColor = theme.mainWhiteColor.withOpacity(opacity);
    Color tempTopColor = theme.mainGreenColor.withOpacity(opacity);
    Color tempBottomTextColor = theme.mainGreenColor.withOpacity(opacity);
    Color tempBottomColor = theme.daySegmentColor.withOpacity(opacity);
    Color tempPointColor = theme.mainPinkColor.withOpacity(opacity);
    if (count < 15) {
      tempTopColor = theme.mainPinkColor.withOpacity(opacity);
      tempBottomTextColor = theme.mainPinkColor.withOpacity(opacity);
      tempPointColor = theme.mainGreenColor.withOpacity(opacity);
    }

    result.add(tempTopTextColor);
    result.add(tempTopColor);
    result.add(tempBottomTextColor);
    result.add(tempBottomColor);
    result.add(tempPointColor);
    return result;
  }
}

class CurrentDaySegment{

  final int currentDay = DateTime.now().day;
  final int currentMonth = DateTime.now().month;
  final int currentYear = DateTime.now().year;

  /// Input.
  final int number;
  final AppTheme theme;

  /// Output.
  late double angle;
  late String topText;
  late Color topTextColor = theme.mainWhiteColor;
  late Color topColor = theme.mainGreenColor;
  late String bottomText;
  late Color bottomTextColor = theme.mainWhiteColor;
  late Color bottomColor = theme.mainGreenColor;
  late Color pointColor = theme.mainGreenColor;

  CurrentDaySegment({
    required this.number,
    required this.theme
  }){
    angle = ((math.pi * 2 / 31) * (number - 0.5));
    topText = RusMonth(currentYear, currentMonth).rusShortMonth;
    topTextColor = theme.daySegmentBorderColor;
    topColor = theme.clockFaceMainColor;
    bottomText = '$number';
    bottomTextColor = theme.daySegmentBottomTextColor;
    bottomColor = theme.daySegmentBorderColor;
    pointColor = theme.mainPinkColor;
  }

}