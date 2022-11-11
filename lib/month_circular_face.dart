import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:site_xz/custom_arc_day_segment.dart';
import 'package:site_xz/month_arrow.dart';
import 'dart:math' as math;

const String assetName = 'assets/images/flutter_logo.svg';

class CircleClockFace extends StatelessWidget {

  const CircleClockFace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1, //scaleFactor,
      child:  Container(
        //color: Color(0xFF00FF00),
        width: 375,
        height: 375,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                color: const Color(0xFF24262D),
                width: 262,
                height: 262,
              )
            ),
            // For position test.
            // Center(
            //   child: Container(
            //     color: const Color(0xFFFF0000),
            //     width: 262,
            //     height: 262,
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
            /// Draw the calendar dial.
            /// Рисует циферблат календаря.
            Center(
              child: Container(
                width: 193,
                height: 193,
                decoration: const BoxDecoration(
                  color: Color(0xFF2F313A),
                  shape: BoxShape.circle
                )
              )
            ),
            Stack(
              children: segments()
            ),
            Center(
              child: Container(
                width: 181,
                height: 181,
                decoration: const BoxDecoration(
                  color: Color(0xFF000000),
                  shape: BoxShape.circle,
                )
              )
            ),
            Center(
              child: Container(
                width: 176,
                height: 176,
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
                margin: const EdgeInsets.only(bottom: 96),
                child: Image.asset(
                  "assets/images/logo_dark.png",
                  fit:BoxFit.scaleDown
                )
              )
            ),
            /// Draw celebration icons.
            /// Рисуем иконки праздников.
            Center(
              child: Stack(
                children: celebrationIcons()
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
  List<Widget> segments() {
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
            clockFaceDiameter: (262)
          )
        )
      );
    }
    return result;
  }
  /// Draw celebration icons.
  /// Рисует иконки праздников.
  List<Widget> celebrationIcons() {
    List<Widget> result = [];
    for (int i = 0; i < 31; i++) {
      result.add(
        Padding(
          padding: EdgeInsets.only(
            top: (187.5 + (161 * (math.cos(math.pi * 2 / 31 * i))) - 22.5),
            left: (187.5 + (161 * (math.sin(math.pi * 2 / 31 * i))) - 22.5)
          ),
          child: Container(
            width: 45,
            height: 45,
            padding: EdgeInsets.all(5),
            child: SvgPicture.asset(
              "assets/images/flutter_logo.svg",
              fit: BoxFit.scaleDown
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFE9549B),
              shape: BoxShape.circle,
            )
          )
        )
      );
    }
    return result;
  }
}