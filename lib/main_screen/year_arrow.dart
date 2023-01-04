import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:site_xz/global/paths.dart';

import 'package:site_xz/global/theme.dart';

/// This class implements an arrow for a month circular face.
class YearArrow extends StatelessWidget {
  final String data;
  final AppTheme theme;
  final VoidCallback callback;

  const YearArrow(
    this.data,
    this.theme,
    this.callback,
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// Tail
        Center(
          child: CustomPaint(
            size: const Size(172, 172),
            painter: TailPainter(
              theme: theme
            )
          )
        ),
        /// Tail text
        Center(
          child: Transform.rotate(
            angle: (math.pi),
            child: Container(
              width: 172,
              height: 172,
              margin: const EdgeInsets.only(right: 145, top: 154),
              child: Column(
                children: [
                  Text(
                    '3+ ',
                    style: TextStyle(
                      color: theme.yearArrowTailColor,
                      fontSize: 8,
                      fontFamily: 'Roboto'
                    )
                  ),
                  Text(
                    'мес',
                    style: TextStyle(
                      color: theme.yearArrowTailColor,
                      fontSize: 8,
                      fontFamily: 'Roboto'
                    ),
                  )
                ]
              ),
            )
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: (-math.pi / 2),
            child: Container(
              width: 172,
              height: 172,
              margin: const EdgeInsets.only(right: 145, top: 154),
              child: Column(
                children: [
                  Text(
                    '6+ ',
                    style: TextStyle(
                      color: theme.yearArrowTailColor,
                      fontSize: 8,
                      fontFamily: 'Roboto'
                    )
                  ),
                  Text(
                    'мес',
                    style: TextStyle(
                      color: theme.yearArrowTailColor,
                      fontSize: 8,
                      fontFamily: 'Roboto'
                    ),
                  )
                ]
              ),
            )
          ),
        ),
        Center(
          child: Container(
            width: 172,
            height: 172,
            margin: const EdgeInsets.only(right: 145, top: 154),
            child: Column(
              children: [
                Text(
                  '9+ ',
                  style: TextStyle(
                    color: theme.yearArrowTailColor,
                    fontSize: 8,
                    fontFamily: 'Roboto'
                  )
                ),
                Text(
                  'мес',
                  style: TextStyle(
                    color: theme.yearArrowTailColor,
                    fontSize: 8,
                    fontFamily: 'Roboto'
                  ),
                )
              ]
            )
          )
        ),
        /// Arrow
        Center(
          child: Container(
            width: 172,
            height: 172,
            padding: const EdgeInsets.only(bottom: 70.25, right: 1.25),
            child: SvgPicture.asset(
              clockFaceArrow,
              color: theme.yearCircularArrowColor,
              fit: BoxFit.fitHeight
            )
          )
        ),
        /// Arrow text
        Center(
          child: Transform.rotate(
            angle: (-math.pi / 2),
            child: GestureDetector(
              onTap: callback,
              child: Center(
                widthFactor: 172,
                heightFactor: 172,
                child: Padding(
                  padding: const EdgeInsets.only(left: 90, bottom: 18.0),
                  child: Center(
                    child: Text(
                      data,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Roboto',
                        color: theme.yearCircularArrowTextColor
                      )
                    ),
                  )
                ),
              )
            )
          )
        )
      ],
    );
  }
}

/// Tail drawing.
class TailPainter extends CustomPainter{
  final AppTheme theme;

  const TailPainter({required this.theme});

  @override
  void paint(Canvas canvas, Size size){

    final line = Paint()
      ..color = theme.yearArrowTailColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(
      const Offset(0.0, (172.0 / 2)),
      const Offset(30.0, (172.0 / 2)),
      line
    );
    canvas.drawLine(
      const Offset(142.0, (172.0 / 2)),
      const Offset(172.0, (172.0 / 2)),
      line
    );
    canvas.drawLine(
      const Offset((172.0 / 2), 142.0),
      const Offset((172.0 / 2), 172.0),
      line
    );
  }

  @override
  bool shouldRepaint(CustomPainter old){
    return false;
  }
}


