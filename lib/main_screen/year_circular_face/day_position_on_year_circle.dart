import 'dart:math' as math;

import 'package:site_xz/main_screen/rus_month_class.dart';

/// Contains the angle of the specified day of the month,
/// and the sine and cosine of that angle.

class DayPosition{
  final int year;
  final int month;
  final int day;
  late final double degree;
  late final double cos;
  late final double sin;

  DayPosition(this.year, this.month, this.day){

    int daysPerMonth = RusMonth(year, month).numberOfDays;

    /// The angle from which the sector of the month begins.
    final double monthDegree = (((math.pi * 2 / 12)) * (month - 1));

    /// Indent from the edge where the month begins
    /// to the point where the countdown of days begins.
    const double border = (math.pi / (258 / 3));

    /// This is where allotted for days inside the month segment.
    const double dayPlace = ((math.pi * 2 / 12) - (border * 2));

    degree = (monthDegree + border + ((dayPlace / daysPerMonth) * day));
    cos = math.cos(degree);
    sin = math.sin(degree);
  }
}