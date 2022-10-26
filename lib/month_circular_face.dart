//import 'dart:async';
import 'dart:js';

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

  const CircleClockFace(this.mineWidth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Our [mineWidth] is 250 logical pixels, so 1 pixel is [mineWidth] / 250.
    /// [mineWidth] у нас равен 250 логических пикселей, поэтому 1 пиксель равен [mineWidth] / 250.
    final pix = (mineWidth / 250);
    return SizedBox(
      width: (mineWidth),
      height: (mineWidth),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              color: const Color(0xFF24262D),
              width: (mineWidth),
              height: (mineWidth),
            )
          ),
          // For position test.
          // Center(
          //   child: Container(
          //     color: const Color(0xFFFF0000),
          //     width: (mineWidth),
          //     height: (mineWidth),
          //   )
          // ),
          // Center(
          //   child: Container(
          //     color: const Color(0xFF00FF00),
          //     width: (225 * pix),
          //     height: (225 * pix),
          //   )
          // ),
          // Center(
          //   child: Container(
          //     color: const Color(0xFFFFFF00),
          //     width: (222.5 * pix),
          //     height: (222.5 * pix),
          //   )
          // ),
          // Center(
          //   child: Container(
          //     color: const Color(0xFF00FFFF),
          //     width: (178 * pix),
          //     height: (178 * pix),
          //   )
          // ),
          /// Draw the calendar dial.
          /// Рисует циферблат календаря.
          Center(
            child: Container(
              width: (181 * pix),
              height: (181 * pix),
              decoration: const BoxDecoration(
                color: Color(0xFF2F313A),
                shape: BoxShape.circle
              )
            )
          ),
          Stack(
            children: segments(mineWidth)
          ),
          Center(
            child: Container(
              width: (169 * pix),
              height: (169 * pix),
              decoration: const BoxDecoration(
                color: Color(0xFF000000),
                shape: BoxShape.circle,
              )
            )
          ),
          Center(
            child: Container(
              width: (164 * pix),
              height: (164 * pix),
              decoration: BoxDecoration(
                color: Color(0xFF2F313A),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF2F313A),
                    blurRadius: (4 * pix),
                    spreadRadius: (5 * pix),
                  )
                ]
              )
            )
          ),
          Center(
            child: Container(
              width: (15.5 * pix),
              height: (15.5 * pix),
              decoration: const BoxDecoration(
                color: Color(0xFF474952),
                shape: BoxShape.circle,
              )
            )
          ),
          Center (
            child: Container(
              width: (52 * pix),
              height: (43 * pix),
              //color: Color(0xFF00FF00),
              margin: EdgeInsets.only(bottom: (90 * pix)),
              child: Image.asset(
                "assets/images/logo_dark.png",
                fit:BoxFit.scaleDown
              )
            )
          ),
          /// Draw the clock hand.
          /// Рисуем стрелку.
          Transform.rotate(
              angle: ((math.pi * 2 / 31) * 8.5),
              child: MonthArrow(pix: pix)
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
            clockFaceDiameter: (mineWidth)
          )
        )
      );
    }
    return result;
  }
}