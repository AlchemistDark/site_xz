import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This class implements a segment of a circular clock face-calendar.
class CustomArcDaySegment extends StatelessWidget {
  final String topText;
  final Color topTextColor;
  final Color topColor;
  final String bottomText;
  final Color bottomTextColor;
  final Color bottomColor;
  final Color pointColor;
  final double clockFaceDiameter;
  final bool isCurrent;
  final bool isPresent;
  final bool isCelebrate;

  final double numberOfSegments = 31;

  const CustomArcDaySegment({
    required this.topText,
    required this.topTextColor,
    required this.topColor,
    required this.bottomText,
    required this.bottomTextColor,
    required this.bottomColor,
    required this.pointColor,
    required this.clockFaceDiameter,
    required this.isCurrent,
    required this.isPresent,
    required this.isCelebrate,
    Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // For position test
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

        Center(
          child: CustomPaint(
            size: const Size(258, 258),
            painter: DaySegmentPainter(
              isCurrent: isCurrent,
              topColor: topColor,
              bottomColor: bottomColor,
              width: 258,
            ),
          )
        ),

        /// Top text.
        Center(
          widthFactor: clockFaceDiameter,
          heightFactor: clockFaceDiameter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 246),
            child: Text(
              topText,
              style: TextStyle(
                color: topTextColor,
                fontSize: 10,
                fontFamily: 'Roboto',
                height: 1.15
              ),
            )
          )
        ),

        /// Bottom text.
        Center(
          widthFactor: clockFaceDiameter,
          heightFactor: clockFaceDiameter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 210),
            child: Text(
              bottomText,
              style: TextStyle(
                color: bottomTextColor,
                fontSize: 14,
                fontFamily: 'Roboto',
                height: 1.4
              ),
            )
          )
        ),

        if (isCelebrate)
        /// Celebrate dot.
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 292),
            child: SizedBox(
              width: 37,
              height: 37,
              child: ClipPath(
                clipper: MyCustomClipper(), // <--
                child: Container(
                  width: 37,
                  height: 37,
                  color: pointColor,
                )
              )
            )
          )
        ),
      ],
    );
  }
}

/// Arc segment painter.
class DaySegmentPainter extends CustomPainter{

  /// This number is inversely proportional to the length of the arc.
  /// It determines how many such arcs fit on a full circle.
  final double quantity = 31;

  /// Input.
  final bool isCurrent;
  final Color topColor;
  final Color bottomColor;

  /// The diameter of the area in which the arcs fit.
  final double width;

  const DaySegmentPainter({
    required this.isCurrent,
    required this.topColor,
    required this.bottomColor,
    required this.width
  });

  @override
  void paint(Canvas canvas, Size size){

    bool useCenter = false;

    /// Angular size of one segment.
    double angSegmentSize = (2 * math.pi / quantity);

    /// Bottom arc

    /// (-90 degrees) - (angular size of one segment / 2) +
    /// + (0.5 degree is half the spacing between segments)
    double startAngle = ((-math.pi / 2) - (angSegmentSize / 2) + (math.pi / 360));

    /// angular size of one segment - (1 degree is the spacing between segments)
    double sweepAngle = (angSegmentSize - (math.pi / 180));

    /// Center coordinates, width and height of the rectangle in which the ellipse is inscribed, of which the arc is a part.
    final double bottomArcMargin = isCurrent? 41 : 56;
    final double bottomArcStrokeWidth = isCurrent? 41 : 26;
    final bottomRect = Rect.fromCenter(
      center: Offset(((width) / 2), ((width) / 2)),
      width: (width - bottomArcMargin),
      height: (width - bottomArcMargin)
    );

    final paintBottom = Paint()
      ..color = bottomColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = bottomArcStrokeWidth;
    canvas.drawArc(bottomRect, startAngle, sweepAngle, useCenter, paintBottom);

    /// Top arc.
    final double topArcStartMargin = isCurrent? (math.pi / (width - 56)) : 0;
    final startTopAngle = startAngle + topArcStartMargin;
    final sweepTopAngle = sweepAngle - topArcStartMargin * 2;

    /// Center coordinates, width and height of the rectangle in which the ellipse is inscribed, of which the arc is a part.
    final double topArcMargin = isCurrent? 41 : 13;
    final double topArcStrokeWidth = isCurrent? 37 : 13;
    final topRect = Rect.fromCenter(
      center: Offset(((width) / 2), ((width) / 2)),
      width: (width - topArcMargin),
      height: (width - topArcMargin)
    );

    final paintLabel = Paint()
      ..color = topColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = topArcStrokeWidth;
    canvas.drawArc(topRect, startTopAngle, sweepTopAngle, useCenter, paintLabel);
  }

  @override
  bool shouldRepaint(CustomPainter old){
    return false;
  }
}

/// Drawing a dot for an icon.
class MyCustomClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final width = size.width - 2;
    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset((size.width / 2), (width)), radius: 2))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}