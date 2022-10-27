//import 'dart:async';
//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:site_xz/custom_arc_day_segment.dart';
import 'package:site_xz/month_arrow.dart';
//import 'package:site_xz/mok.dart';
import 'dart:math' as math;

const String assetName = 'assets/images/flutter_logo.svg';

class CircleClockFace extends StatelessWidget {
  final double mineWidth;
  final double scaleFactor;

  const CircleClockFace(this.mineWidth, this.scaleFactor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleFactor,
      child:  SizedBox(
        width: 250,
        height: 250,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                color: const Color(0xFF24262D),
                width: 250,
                height: 250,
              )
            ),
            // For position test.
            // Center(
            //   child: Container(
            //     color: const Color(0xFFFF0000),
            //     width: 250,
            //     height: 250,
            //   )
            // ),
            // Center(
            //   child: Container(
            //     color: const Color(0xFF00FF00),
            //     width: 225,
            //     height: 225,
            //   )
            // ),
            // Center(
            //   child: Container(
            //     color: const Color(0xFFFFFF00),
            //     width: 222.5,
            //     height: 222.5,
            //   )
            // ),
            // Center(
            //   child: Container(
            //     color: const Color(0xFF00FFFF),
            //     width: 178,
            //     height: 178,
            //   )
            // ),
            /// Draw the calendar dial.
            /// Рисует циферблат календаря.
            Center(
              child: Container(
                width: 181,
                height: 181,
                decoration: const BoxDecoration(
                  color: Color(0xFF2F313A),
                  shape: BoxShape.circle
                )
              )
            ),
            Stack(
              children: segments(250)
            ),
            Center(
              child: Container(
                width: 169,
                height: 169,
                decoration: const BoxDecoration(
                  color: Color(0xFF000000),
                  shape: BoxShape.circle,
                )
              )
            ),
            Center(
              child: Container(
                width: 164,
                height: 164,
                decoration: const BoxDecoration(
                  color: Color(0xFF2F313A),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF2F313A),
                      blurRadius: 4,
                      spreadRadius: 5,
                    )
                  ]
                )
              )
            ),
            Center(
              child: Container(
                width: 15.5,
                height: 15.5,
                decoration: const BoxDecoration(
                  color: Color(0xFF474952),
                  shape: BoxShape.circle,
                )
              )
            ),
            Center (
              child: Container(
                width: 52,
                height: 43,
                //color: Color(0xFF00FF00),
                margin: const EdgeInsets.only(bottom: 90),
                child: Image.asset(
                  "assets/images/logo_dark.png",
                  fit:BoxFit.scaleDown
                )
              )
            ),
            /// Draw the clock hand.
            /// Рисуем стрелку.
            Transform.rotate(
              angle: ((math.pi * 2 / 31) * 18.5),
              child: const MonthArrow()
            ),
            Center(
              child: Container(
                width: 5.32,
                height: 5.32,
                decoration: const BoxDecoration(
                  color: Color(0xFF474952),
                  shape: BoxShape.circle,
                )
              )
            )
          ]
        )
      )
    );
  }
  /// Draw clock face.
  /// Рисует циферблат.
  List<Widget> segments(double mineWidth) {
    List<Widget> result = [];
    for (int i = 0; i < 31; i++) {
      result.add(
        Transform.rotate(
          angle: ((math.pi * 2 / 31) * (i + 0.5)),
          child: CustomArcSegment(
            topText: 'пн',
            topTextColor: const Color(0xFFFFFFFF),
            topColor: const Color(0xFF52B69A),
            bottomText: '${i + 1}',
            bottomTextColor:  const Color(0xFFE9549B),
            bottomColor: const Color(0xFF3F414A),
            numberOfSegments: 31,
            clockFaceDiameter: (250)
          )
        )
      );
    }
    return result;
  }
}