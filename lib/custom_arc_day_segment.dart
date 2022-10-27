import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

/// This class implements a segment of a circular clock face-calendar.
/// Данный класс реализует сегмент кругового циферблата-календаря.

class CustomArcSegment extends StatelessWidget {
  final String topText;
  final Color topTextColor;
  final Color topColor;
  final String bottomText;
  final Color bottomTextColor;
  final Color bottomColor;
  final double numberOfSegments;
  final double clockFaceDiameter;

  const CustomArcSegment({
    required this.topText,
    required this.topTextColor,
    required this.topColor,
    required this.bottomText,
    required this.bottomTextColor,
    required this.bottomColor,
    required this.numberOfSegments,
    required this.clockFaceDiameter,
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
        // // For position test
        // Center(
        //   child: Container(
        //     color: const Color(0xFF8888FF),
        //     width: 181,
        //     height: 181,
        //   )
        // ),

        /// The top fillet of the top element.
        /// Верхнее скругление верхнего элемента.
        Center(
          child: CustomPaint(
            size: const Size(246, 246),
            painter: MyPainterWithRoundStrokeCap(
              width: 246,
              quantity: numberOfSegments,
              color: topColor, //Color(0xFFFF8888),
              strokeWidth: 4,
            ),
          )
        ),
        /// The top element.
        /// Верхний элемент.
        Center(
          child: CustomPaint(
            size: const Size(237.5, 237.5),
            painter: MyPainterWithoutStrokeCap(
              width: 237.5,
              quantity: numberOfSegments,
              color: topColor, //Color(0xFF88FF88),
              strokeWidth: 9
            ),
          )
        ),
        /// The bottom fillet of the top element.
        /// Нижнее скругление верхнего элемента.
        Center(
          child: CustomPaint(
            size: const Size(229, 229),
            painter: MyPainterWithRoundStrokeCap(
              width: 229,
              quantity: numberOfSegments,
              color: topColor,
              strokeWidth: 4,
            ),
          )
        ),
        /// The top fillet of the bottom element.
        /// Верхнее скругление нижнего элемента.
        Center(
          child: CustomPaint(
            size: const Size(218, 218),
              painter: MyPainterWithRoundStrokeCap(
                width: 218,
                quantity: numberOfSegments,
                color: bottomColor,
                strokeWidth: 4,
              ),
            )
        ),
        /// The bottom element.
        /// Нижний элемент.
        Center(
          child: CustomPaint(
            size: const Size(200, 200),
            painter: MyPainterWithoutStrokeCap(
              width: 200,
              quantity: numberOfSegments,
              color: bottomColor,
              strokeWidth: 18
            ),
          )
        ),
        /// The bottom fillet of the bottom element.
        /// Нижнее скругление нижнего элемента.
        Center(
          widthFactor: clockFaceDiameter,
          heightFactor: clockFaceDiameter,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: CustomPaint(
              size: const Size(182, 182),
              painter: MyPainterWithRoundStrokeCap(
                width: 182,
                quantity: numberOfSegments,
                color: bottomColor,
                strokeWidth: 4,
              ),
            )
          ),
        ),
        /// Top text.
        /// Верхний текст.
        Center(
          widthFactor: clockFaceDiameter,
          heightFactor: clockFaceDiameter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 238),
            child: Text(
              topText,
              style: TextStyle(
                color: topTextColor,
                fontSize: 10.5,
                fontFamily: 'Roboto'
              ),
            )
          )
        ),
        /// Bottom text.
        /// Нижний текст.
        Center(
          widthFactor: clockFaceDiameter,
          heightFactor: clockFaceDiameter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 202),
            child: Text(
              bottomText,
              style: TextStyle(
                color: bottomTextColor,
                fontSize: (16),
                fontFamily: 'Roboto'
              ),
            )
          )
        ),
        if (1 == 1)
        /// Ray for an icon.
        /// Луча для иконки.
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 275),
            child: SizedBox(
              width: 30,
              height: 30,
              child: ClipPath(
                clipper: MyCustomClipper(), // <--
                child: Container(
                  width: 30,
                  height: 30,
                  color: const Color(0xFF7FA4EA),
                )
              )
            )
          )
        ),
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
  final double strokeWidth;

  const MyPainterWithRoundStrokeCap({
    required this.width,
    required this.quantity,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size){
    /// Center coordinates, width and height of the rectangle in which the ellipse is inscribed, of which the arc is a part.
    /// Координаты центра, ширина и высота прямоугольника, в который вписан элипс, частью которого является дуга.
    final rect = Rect.fromCenter(center: Offset((width / 2), (width / 2)), width: width, height: width);
    /// (-90 degrees) - (length of circle / number of circle segments / 2) +
    /// + (0.5 degree is half the spacing between segments) + ([strokeWidth] / 2 is rounding radius)
    /// (-90 градусов) - (длина окружности / число сегментов окружности / 2) +
    /// + (0,5 градуса это половина интервала между сегментами) + ([strokeWidth] / 2 это радиус скругления)
    final startAngle = ((-math.pi / 2) - (math.pi / quantity) + (math.pi / 360)) + (math.pi * strokeWidth / width / 3);
    /// (length of circle / number of circle segments) - (1 degree is the spacing between segments) +
    /// + ([strokeWidth] / 2 is rounding radius)
    /// (длина окружности / число сегментов окружности) - 1 градус это половина интервала между сегментами) +
    /// + ([strokeWidth] / 2 это радиус скругления)
    final sweepAngle = ((math.pi * 2 / quantity) - (math.pi / 180) - (math.pi * strokeWidth / width / 1.5));
    const useCenter = false;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
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
  final double strokeWidth;

  const MyPainterWithoutStrokeCap({
    required this.width,
    required this.quantity,
    required this.color,
    required this.strokeWidth
  });

  @override
  void paint(Canvas canvas, Size size){
    /// Center coordinates, width and height of the rectangle in which the ellipse is inscribed, of which the arc is a part.
    /// Координаты центра, ширина и высота прямоугольника, в который вписан элипс, частью которого является дуга.
    final rect = Rect.fromCenter(center: Offset((width / 2), (width / 2)), width: width, height: width);
    /// (-90 degrees) - (length of circle / number of circle segments / 2) +
    /// + (0.5 degree is half the spacing between segments)
    /// (-90 градусов) - (длина окружности / число сегментов окружности / 2) +
    /// + (0,5 градуса это половина интервала между сегментами)
    final startAngle = ((-math.pi / 2) - (math.pi / quantity) + (math.pi / 360));
    /// (length of circle / number of circle segments) - (1 degree is the spacing between segments)
    /// (длина окружности / число сегментов окружности) - (1 градус это половина интервала между сегментами)
    final sweepAngle = ((math.pi * 2 / quantity) - (math.pi / 180));
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

/// Drawing a ray for an icon.
/// Отрисовка луча для иконки.
class MyCustomClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final width = size.width - 4;
    Path path = Path()
      ..addRect(Rect.fromLTWH((((size.width) / 2) - 0.5), (width / 2), 1, ((width - 2) / 2)))
      ..addOval(Rect.fromCircle(center: Offset((size.width / 2), (width)), radius: (size.width / 15))) // Добавить отрезок p2p3
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}

