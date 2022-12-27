import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/global/theme.dart';
import 'package:site_xz/main_screen/current_month_segment.dart';
import 'package:site_xz/main_screen/first_half_month_segment.dart';
import 'package:site_xz/main_screen/opposite_month_segment.dart';
import 'package:site_xz/main_screen/second_half_month_segment.dart';

/// This class implements a segment of a circular clock face-calendar.

class MonthArcSegment extends StatelessWidget {
  final AppTheme theme;
  final int iterator;

  const MonthArcSegment({
    required this.theme,
    required this.iterator,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int number(int iterator) => (iterator < 13)? iterator : (iterator - 12);

    switch(monthCategory(iterator)){
      case MonthCategory.current:
        return CurrentMonthSegment(theme, number(iterator));
      case MonthCategory.firstHalf:
        return FirstHalfMonthSegment(theme, number(iterator));
      case MonthCategory.opposite:
        return OppositeMonthSegment(theme, number(iterator));
      case MonthCategory.secondHalf:
        return SecondHalfMonthSegment(theme, number(iterator));
    } // CurrentMonthSegment
  }
}

enum MonthCategory{current, opposite, firstHalf, secondHalf}

MonthCategory monthCategory(int i){
  if (i == DateTime.now().month) {
    return MonthCategory.current;
  }
  if (i < (DateTime.now().month + 6)) {
    return MonthCategory.firstHalf;
  }
  if (i == (DateTime.now().month + 6)) {
    return MonthCategory.opposite;
  }
  return MonthCategory.secondHalf;
}