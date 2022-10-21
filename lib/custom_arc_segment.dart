import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

/// This class implements a segment of a circular clock face-calendar.
/// Данный класс реализует сегмент кругового циферблата-календаря.

class CustomArcSegment extends StatelessWidget {
  const CustomArcSegment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const <Widget>[
        // The top fillet of the top element.
        // Верхнее скругление верхнего элемента.
        Center(
          widthFactor: 260,
          heightFactor: 260,
          child: CustomPaint(
            size: Size(256, 256),
            painter: MyPainterWithRoundStrokeCap(
              width: 256,
              quantity: 31,
              color: Color(0xFF52B69A),
              strokeCap: StrokeCap.round,
              strokeWidth: 4,
            ),
          )
        ),
        // The top element.
        // Верхний элемент.
        Center(
          widthFactor: 260,
          heightFactor: 260,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: CustomPaint(
              size: Size(247, 247),
              painter: MyPainterWithoutStrokeCap(
                width: 247,
                quantity: 31,
                color: Color(0xFF52B69A),
                strokeCap: StrokeCap.square,
                strokeWidth: 10
              ),
            )
          ),
        ),
        // The bottom fillet of the top element.
        // Нижнее скругление верхнего элемента.
        Center(
          widthFactor: 260,
          heightFactor: 260,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: CustomPaint(
              size: Size(236, 236),
              painter: MyPainterWithRoundStrokeCap(
                width: 236,
                quantity: 31,
                color: Color(0xFF52B69A),
                strokeCap: StrokeCap.round,
                strokeWidth: 4,
              ),
            )
          ),
        ),
        // The top fillet of the bottom element.
        // Верхнее скругление нижнего элемента.
        Center(
          widthFactor: 260,
          heightFactor: 260,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: CustomPaint(
              size: Size(225, 225),
              painter: MyPainterWithRoundStrokeCap(
                width: 225,
                quantity: 31,
                color: Color(0xFF3F414A),
                strokeCap: StrokeCap.round,
                strokeWidth: 4,
              ),
            )
          ),
        ),
        // The bottom element.
        // Нижний элемент.
        Center(
          widthFactor: 260,
          heightFactor: 260,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: CustomPaint(
              size: Size(209, 209),
              painter: MyPainterWithoutStrokeCap(
                width: 209,
                quantity: 31,
                color: Color(0xFF3F414A),
                strokeCap: StrokeCap.round,
                strokeWidth: 18
              ),
            )
          ),
        ),
        // The bottom fillet of the bottom element.
        // Нижнее скругление нижнего элемента.
        Center(
          widthFactor: 260,
          heightFactor: 260,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: CustomPaint(
              size: Size(190, 190),
              painter: MyPainterWithRoundStrokeCap(
                width: 190,
                quantity: 31,
                color: Color(0xFF3F414A),
                strokeCap: StrokeCap.round,
                strokeWidth: 4,
              ),
            )
          ),
        ),
        Center(
          widthFactor: 260,
          heightFactor: 260,
          child: Padding(
            padding: EdgeInsets.only(bottom: 247),
            child: Text(
              'июн',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 11,
                fontFamily: 'Roboto'
              ),
            )
          )
        ),
        Center(
          widthFactor: 260,
          heightFactor: 260,
          child: Padding(
            padding: EdgeInsets.only(bottom: 207),
            child: Text(
              '33',
              style: TextStyle(
                color: Color(0xFFE9549B),
                fontSize: 14,
                fontFamily: 'Roboto'
              ),
            )
          )
        )
      ],
    );
  }
}


class MyPainterWithRoundStrokeCap extends CustomPainter{

  /// The diameter of the circle that the arc should be part of.
  /// Диаметр круга, частью которого должна быть дуга.
  final double width;

  /// This number is inversely proportional to the length of the arc.
  /// It determines how many such arcs fit on a full circle.
  /// Данное число обратно пропорционально длине дуги.
  /// Оно определяет сколько таких дуг поместится на полную окружность.
  final double quantity;

  /// Parameters of the line that draws the arc.
  /// Параметры линии, которой рисуется дуга.
  final Color color;
  final StrokeCap strokeCap;
  final double strokeWidth;

  const MyPainterWithRoundStrokeCap({
    required this.width,
    required this.quantity,
    required this.color,
    required this.strokeCap,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size){
    final rect = Rect.fromCenter(center: Offset((width / 2), (width / 2)), width: width, height: width);
    final startAngle = ((-math.pi / 2) - ((math.pi / quantity) - ((3 + (2 * strokeWidth)) / (2 * width))));
    final sweepAngle = ((math.pi * 2 / quantity) - ((3 + (2 * strokeWidth)) / width));
    const useCenter = false;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = strokeCap
      ..strokeWidth = strokeWidth;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old){
    return false;
  }
}

class MyPainterWithoutStrokeCap extends CustomPainter{

  /// The diameter of the circle that the arc should be part of.
  /// Диаметр круга, частью которого должна быть дуга.
  final double width;

  /// This number is inversely proportional to the length of the arc.
  /// It determines how many such arcs fit on a full circle.
  /// Данное число обратно пропорционально длине дуги.
  /// Оно определяет сколько таких дуг поместится на полную окружность.
  final double quantity;

  /// Parameters of the line that draws the arc.
  /// Параметры линии, которой рисуется дуга.
  final Color color;
  final StrokeCap strokeCap;
  final double strokeWidth;

  const MyPainterWithoutStrokeCap({
    required this.width,
    required this.quantity,
    required this.color,
    required this.strokeCap,
    required this.strokeWidth
  });

  @override
  void paint(Canvas canvas, Size size){
    double truncation = 1.09;
    final rect = Rect.fromCenter(center: Offset((width / 2), (width / 2)), width: width, height: width);
    final startAngle = ((-math.pi/ 2) - ((math.pi / quantity) - (1.5 / width)));
    final sweepAngle = ((math.pi * 2 / quantity) - (3 / width));
    const useCenter = false;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old){
    return false;
  }
}