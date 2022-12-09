import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlannerVM{

}

class YearVM{

}

class MonthVM{
  final List<DayVM> month;
  MonthVM({
    required this.month
  });
}

class DayVM{
  final String captionText;
  final Color captionColor;
  final Color dayNumberColor;
  final bool isCurrent;
  final bool isPresent;
  final bool isCelebrate; // toDo

  DayVM({
    required this.captionText,
    required this.captionColor,
    required this.dayNumberColor,
    required this.isCurrent,
    required this.isPresent,
    required this.isCelebrate
  });
}

class Celebration{
  final int month;
  final int date;
  Celebration(this.month, this.date);
}

