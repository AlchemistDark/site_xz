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

    /// (360 degrees / 12 is the beginning of the month on the circle) +
    /// + (math.pi / (circle diameter / 3))
    /// is the angle of the three pixels of the arc, that is,
    /// the place from which the counting of days begins in the month segment) +
    /// + ((((360 degrees / 12) -
    /// - (180 degrees / (258 / 6) is a six pixel angle)
    /// this is where allotted for days inside the month segment) /
    /// / number of days in a month ) * number of the current day)

    /// (360 градусов / 12 это начало месяца на окружности) +
    /// + (math.pi / (диаметр окружности / 3)) это угол трёх пикселей дуги,
    /// то есть место, с которого начинается отчёт дней в сегменте месяца) +
    /// + ((((360 градусов / 12) -
    /// - (180 градусов / (258 / 6) это угол шести пикселей) это место,
    /// отведённое под дни внутри сегмента месяца) /
    ///  / количество дней в месяце ) * номер текущего дня)
    degree = ((((math.pi * 2 / 12)) * (month - 0.5)) + (math.pi / (258 / 3))
      + ((((math.pi * 2 / 12) - (math.pi / (258 / 6))) / daysPerMonth) * day));
    cos = math.cos(degree);
    sin = math.sin(degree);
    print('asdasd ${(
        ((math.pi * 2 / 12) * (month - 0.5)) + (math.pi / (258 / 3))
    ) * (180 / math.pi)}');

  }
}