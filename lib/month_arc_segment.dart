import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/rus_month_class.dart';
import 'package:site_xz/theme.dart';

/// This class implements a segment of a circular clock face-calendar.

class MonthArcSegment extends StatelessWidget {
  final MonthCategory monthCategory;
  final AppTheme theme;
  final int number;

  const MonthArcSegment({
    required this.monthCategory,
    required this.theme,
    required this.number,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(monthCategory){
      case MonthCategory.current:
        return FirstHalfMonthSegment(theme, number);
      case MonthCategory.firstHalf:
        return FirstHalfMonthSegment(theme, number);
      case MonthCategory.opposite:
        return FirstHalfMonthSegment(theme, number);
      case MonthCategory.secondHalf:
        return FirstHalfMonthSegment(theme, number);
    } // CurrentMonthSegment
  }
}

/// This class implements a segment of a current month segment.
class FirstHalfMonthSegment extends StatelessWidget {
  final AppTheme theme;
  final int number;

  const FirstHalfMonthSegment(
    this.theme,
    this.number,
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // For position test.
        // Center(
        //   child: Container(
        //     color: const Color(0xFFFF00FF),
        //     width: 258,
        //     height: 258,
        //   )
        // ),
        // Center(
        //   child: Container(
        //     color: const Color(0xFF00FFFF),
        //     width: 232,
        //     height: 232,
        //   )
        // ),
        // Center(
        //   child: Container(
        //     color: const Color(0xFFFF00FF),
        //     width: 228,
        //     height: 228,
        //   )
        // ),
        // Center(
        //   child: Container(
        //     color: const Color(0xFF00FFFF),
        //     width: 176,
        //     height: 176,
        //   )
        // ),
        // Center(
        //     child: Container(
        //         width: 322,
        //         height: 322,
        //         decoration: const BoxDecoration(
        //           color: Color(0xFF00FFFF),
        //           shape: BoxShape.circle,
        //         )
        //     )
        // ),
        // Center(
        //     child: Container(
        //         width: 299.5,
        //         height: 299.5,
        //         decoration: const BoxDecoration(
        //           color: Color(0xFF008888),
        //           shape: BoxShape.circle,
        //         )
        //     )
        // ),
        // For position test
        // Center(
        //   child: Container(
        //     color: const Color(0xFF444488),
        //     width: 222.5,
        //     height: 222.5,
        //   )
        // ),
        // // For position test
        // Center(
        //   child: Container(
        //     color: const Color(0xFF8888FF),
        //     width: 181,
        //     height: 181,
        //   )
        // ),
        /// Background.
        Center(
          child: CustomPaint(
            size: const Size(258, 258),
            painter: FirstHalfMonthSegmentPainter(
              width: 258,
              theme: theme
            ),
          )
        ),
        /// Text.
        Center(
          widthFactor: 375,
          heightFactor: 375,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 205),
            child: Text(
              RusMonth(DateTime.now().year, (number + 1)).rusCapitalLettersShortMonth,
              style: TextStyle(
                color: theme.mineGreenColor,
                fontSize: (14),
                fontFamily: 'Roboto',
                height: 1.595
              ),
            )
          )
        ),
      ],
    );
  }
}

class FirstHalfMonthSegmentPainter extends CustomPainter{

  /// The diameter of the area in which the arcs fit.
  /// Диаметр области, в которую вписываются дуги.
  final double width;

  /// This number is inversely proportional to the length of the arc.
  /// It determines how many such arcs fit on a full circle.
  /// Данное число обратно пропорционально длине дуги.
  /// Оно определяет сколько таких дуг поместится на полную окружность.
  final double quantity = 12;

  final AppTheme theme;

  const FirstHalfMonthSegmentPainter({
    required this.width,
    required this.theme
  });

  @override
  void paint(Canvas canvas, Size size){

    /// (-90 degrees) - (length of circle / number of circle segments / 2) +
    /// + (0.5 degree is half the spacing between segments)
    /// (-90 градусов) - (длина окружности / число сегментов окружности / 2) +
    /// + (0,5 градуса это половина интервала между сегментами)
    final startAngle = ((-math.pi / 2) - (math.pi / quantity) + (math.pi / 360));
    /// (length of circle / number of circle segments) - (1 degree is the spacing between segments)
    /// (длина окружности / число сегментов окружности) - (1 градус это половина интервала между сегментами)
    final sweepAngle = ((math.pi * 2 / quantity) - (math.pi / 180));
    const useCenter = false;

    /// Top arc.

    /// Center coordinates, width and height of the rectangle in which the ellipse is inscribed, of which the arc is a part.
    /// Координаты центра, ширина и высота прямоугольника, в который вписан элипс, частью которого является дуга.
    final topRect = Rect.fromCenter(
      center: Offset(((width) / 2), ((width) / 2)),
      width: (width - 13),
      height: (width - 13)
    );
    final paintTop = Paint()
      ..color = theme.mineGreenColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;
    canvas.drawArc(topRect, startAngle, sweepAngle, useCenter, paintTop);

    /// Bottom arc

    /// Center coordinates, width and height of the rectangle in which the ellipse is inscribed, of which the arc is a part.
    /// Координаты центра, ширина и высота прямоугольника, в который вписан элипс, частью которого является дуга.
    final bottomRect = Rect.fromCenter(
      center: Offset(((width) / 2), ((width) / 2)),
      width: (width - 56),
      height: (width - 56)
    );
    final paintBottom = Paint()
      ..color = theme.monthSegmentTopColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 26;
    canvas.drawArc(bottomRect, startAngle, sweepAngle, useCenter, paintBottom);

    /// Label arc.

    /// (-90 degrees) - (length of circle / number of circle segments / 2) +
    /// + (0.5 degree is half the spacing between segments) +
    /// + (180 degree / (width - 56) is degre of one pixel of arc)
    /// (-90 градусов) - (длина окружности / число сегментов окружности / 2) +
    /// + (0,5 градуса это половина интервала между сегментами) +
    /// + (180 градусов / (width - 56) это угол одного пикселя дуги)
    final startLabelAngle = ((-math.pi / 2) - (math.pi / quantity) + (math.pi / 360) + (math.pi / (width - 56)));
    /// (length of circle / number of circle segments) -
    /// - (1 degree is the spacing between segments) -
    /// - (180 degree / ((width - 56) / 2) is degre of two pixels of arc)
    /// (длина окружности / число сегментов окружности) -
    /// - (1 градус это половина интервала между сегментами) -
    /// - (180 градусов / ((width - 56) / 2) это угол двух пикселей дуги)
    final sweepLabelAngle = ((math.pi * 2 / quantity) - (math.pi / 180) - (math.pi / ((width - 56) / 2)));

    /// Center coordinates, width and height of the rectangle in which the ellipse is inscribed, of which the arc is a part.
    /// Координаты центра, ширина и высота прямоугольника, в который вписан элипс, частью которого является дуга.
    final labelRect = Rect.fromCenter(
        center: Offset(((width) / 2), ((width) / 2)),
        width: (width - 56),
        height: (width - 56)
    );
    final paintLabel = Paint()
      ..color = theme.monthSegmentLabelColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 24;
    canvas.drawArc(labelRect, startLabelAngle, sweepLabelAngle, useCenter, paintLabel);
  }

  @override
  bool shouldRepaint(CustomPainter old){
    return false;
  }
}

enum MonthCategory{current, opposite, firstHalf, secondHalf}