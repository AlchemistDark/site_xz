import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/global/theme.dart';
import 'package:site_xz/main_screen/rus_month_class.dart';

/// This class implements the monthly segment for the first half of the year circle.
class SecondHalfMonthSegment extends StatelessWidget {
  final AppTheme theme;
  final int number;

  const SecondHalfMonthSegment(
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
        //   child: Container(
        //     width: 322,
        //     height: 322,
        //     decoration: const BoxDecoration(
        //       color: Color(0xFF00FFFF),
        //       shape: BoxShape.circle,
        //     )
        //   )
        // ),
        // Center(
        //   child: Container(
        //     width: 299.5,
        //     height: 299.5,
        //     decoration: const BoxDecoration(
        //       color: Color(0xFF008888),
        //       shape: BoxShape.circle,
        //     )
        //   )
        // ),
        // Center(
        //   child: Container(
        //     color: const Color(0xFF444488),
        //     width: 222.5,
        //     height: 222.5,
        //   )
        // ),
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
              RusMonth(DateTime.now().year, number).rusCapitalLettersShortMonth,
              style: TextStyle(
                color: theme.mainPinkColor,
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
  final double width;

  /// This number is inversely proportional to the length of the arc.
  /// It determines how many such arcs fit on a full circle.
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
    final startAngle = ((-math.pi / 2) - (math.pi / quantity) + (math.pi / 360));

    /// (length of circle / number of circle segments) - (1 degree is the spacing between segments)
    final sweepAngle = ((math.pi * 2 / quantity) - (math.pi / 180));
    const useCenter = false;

    /// Top arc.

    /// Center coordinates, width and height of the rectangle in which the ellipse is inscribed, of which the arc is a part.
    final topRect = Rect.fromCenter(
      center: Offset(((width) / 2), ((width) / 2)),
      width: (width - 13),
      height: (width - 13)
    );

    final paintTop = Paint()
      ..color = theme.monthSegmentTopColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;
    canvas.drawArc(topRect, startAngle, sweepAngle, useCenter, paintTop);

    /// Bottom arc

    /// Center coordinates, width and height of the rectangle in which the ellipse is inscribed, of which the arc is a part.
    final bottomRect = Rect.fromCenter(
      center: Offset(((width) / 2), ((width) / 2)),
      width: (width - 56),
      height: (width - 56)
    );

    final paintBottom = Paint()
      ..color = theme.monthSegmentBottomColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 26;
    canvas.drawArc(bottomRect, startAngle, sweepAngle, useCenter, paintBottom);

    /// Label arc.

    /// (-90 degrees) - (length of circle / number of circle segments / 2) +
    /// + (0.5 degree is half the spacing between segments) +
    /// + (180 degree / (width - 56) is degre of one pixel of arc)
    final startLabelAngle = ((-math.pi / 2) - (math.pi / quantity) + (math.pi / 360) + (math.pi / (width - 56)));

    /// (length of circle / number of circle segments) -
    /// - (1 degree is the spacing between segments) -
    /// - (180 degree / ((width - 56) / 2) is degre of two pixels of arc)
    final sweepLabelAngle = ((math.pi * 2 / quantity) - (math.pi / 180) - (math.pi / ((width - 56) / 2)));

    /// Center coordinates, width and height of the rectangle in which the ellipse is inscribed, of which the arc is a part.
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