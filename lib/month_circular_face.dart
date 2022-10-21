//import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:site_xz/custom_arc_segment.dart';
import 'package:site_xz/month_arrow.dart';
//import 'package:site_xz/mok.dart';
import 'dart:math' as math;

class CircleClockFace extends StatelessWidget {
  const CircleClockFace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2F313A),
      child: Stack(
        children: <Widget>[
          // For position test.
          // Center(
          //   child: Container(
          //     color: const Color(0xFFFF0000),
          //     width: 260,
          //     height: 260,
          //   )
          // ),
          // Center(
          //   child: Container(
          //     color: const Color(0xFF00FF00),
          //     width: 230,
          //     height: 230,
          //   )
          // ),
          // Center(
          //   child: Container(
          //     color: const Color(0xFF00FFFF),
          //     width: 186,
          //     height: 186,
          //   )
          // ),
          // Center(
          //   child: Container(
          //     color: const Color(0xFFFF0000),
          //     width: 260,
          //     height: 260,
          //   )
          // ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 0.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 1.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 2.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 3.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 4.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 5.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 6.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 7.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 8.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 9.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 10.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 11.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 12.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 13.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 14.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 15.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 16.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 17.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 18.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 19.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 20.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 21.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 22.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 23.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 24.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 25.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 26.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 27.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 28.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 29.5),
            child: const CustomArcSegment()
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 30.5),
            child: const CustomArcSegment()
          ),
          Center(
            child: Container(
              width: 186.5,
              height: 186.5,
              decoration: const BoxDecoration(
                color: Color(0xFF2F313A),
                shape: BoxShape.circle
              )
            )
          ),
          Center(
            child: Container(
              width: 176.5,
              height: 176.5,
              decoration: const BoxDecoration(
                color: Color(0xFF1F212A),
                shape: BoxShape.circle,
              )
            )
          ),
          Center(
            child: Container(
              width: 171.5,
              height: 171.5,
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
              margin: const EdgeInsets.only(bottom: 100),
              child: Image.asset(
                "assets/images/logo_dark.png",
                fit:BoxFit.scaleDown
              )
            )
          ),
          Transform.rotate(
            angle: ((math.pi * 2 / 31) * 8.5),
            child: MonthArrow()
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
}

