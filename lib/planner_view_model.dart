import 'package:flutter/cupertino.dart';

class PlannerVM{

}

class MonthVM{

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