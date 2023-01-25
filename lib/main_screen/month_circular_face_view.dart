import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:site_xz/global/theme.dart';
import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/main_screen/month_arrow.dart';
import 'package:site_xz/main_screen/month_arrow_tail.dart';
import 'package:site_xz/main_screen/month_circular_face_logic.dart';

/// Month circle clock Face for main Planner screen.
class MonthCircularClockFace extends StatelessWidget {
  final AppTheme theme;
  final List<Celebrate> celebrates;
  final int currentCelebrate;
  final VoidCallback arrowCallback;
  final Function(int) celebrateIconCallback;
  late final MonthCircularClockFaceLogic logic;

  MonthCircularClockFace({
    required this.theme,
    required this.celebrates,
    required this.currentCelebrate,
    required this.arrowCallback,
    required this.celebrateIconCallback,
    Key? key
  }) : super(key: key) {
    logic = MonthCircularClockFaceLogic(
      theme: theme,
      celebrates: celebrates,
      celebrateIconCallback: celebrateIconCallback
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// Draw the calendar dial.
        Center(
          child: Container(
            width: 375,
            height: 375,
            decoration: BoxDecoration(
              color: theme.clockFaceMainColor,
              shape: BoxShape.circle
            )
          )
        ),
        Center(
          child: Container(
            width: 181,
            height: 181,
            decoration: BoxDecoration(
              color: theme.clockFaceCircleColor,
              shape: BoxShape.circle
            )
          )
        ),
        Center(
          child: Container(
            width: 169,
            height: 169,
            decoration: BoxDecoration(
              color: theme.clockFaceMainColor,
              shape: BoxShape.circle,
            )
          )
        ),
        /// Draw the days rings.
        Stack(
          children: logic.segments(celebrates)
        ),
        /// Decoration.
        Center(
          child: Container(
            width: 55,
            height: 45,
            margin: const EdgeInsets.only(bottom: 70),
            child: Image.asset(
              theme.logoPath,
              scale: 0.5,
              fit: BoxFit.contain
            )
          )
        ),
        Center(
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: theme.clockFaceCenterColor,
              shape: BoxShape.circle,
            )
          )
        ),
        Transform.rotate(
          angle: logic.getArrowTailAngle(),//(-math.pi / 2),//((math.pi * 2 / 31) * (_currentDay - 0.5)),
          child: GestureDetector(
            onTap: (){},
            child: const MonthArrowTail()
          )
        ),
        /// Draw the clock hand.
        Transform.rotate(
          angle: ((math.pi * 2 / 31) * (logic.currentDay - 0.5)),
          child: GestureDetector(
            onTap: (){},
            child: MonthArrow(
              logic.currentDate(),
              theme,
              arrowCallback,
              logic.currentDay
            )
          )
        ),
        Center(
          child: Container(
            width: 5.5,
            height: 5.5,
            decoration: BoxDecoration(
              color: theme.yearCircularArrowCenterColor,
              shape: BoxShape.circle,
            )
          )
        ),
        /// Draw celebration icons.
        Stack(
          children: logic.celebrationIcons()
        ),
        logic.currentCelebrationIcon(currentCelebrate)
      ]
    );
  }  // child: Stack(


  // /// Draw celebration icons.
  // /// Рисует иконки праздников.
  // List<Widget> celebrationIcons() {
  //   List<Widget> result = [];
  //   for (int i = 0; i < 31; i++) {
  //     if (isCelebrate(celebrationList, (i + 1))) {
  //       result.add(
  //         Container(
  //           alignment: Alignment.topLeft,
  //           width: 375,
  //           height: 375,
  //           margin: EdgeInsets.only(
  //             top: ((187.5 - (161 * (math.cos(math.pi * 2 / 31 * (i + 0.5)))) - 22.5)),
  //             left: ((187.5 + (161 * (math.sin(math.pi * 2 / 31 * (i + 0.5)))) - 22.5))
  //           ),
  //           child:Container(
  //             alignment: Alignment.topLeft,
  //             width: 375,
  //             height: 375,
  //             child: Container(
  //               width: 45,
  //               height: 45,
  //               padding: EdgeInsets.all(5),
  //               child: SvgPicture.asset(
  //                 'assets/images/relatives_group_icon.svg',
  //                 fit: BoxFit.scaleDown
  //               ),
  //               decoration: const BoxDecoration(
  //                 color: relativesGroupButtonColor,
  //                 shape: BoxShape.circle,
  //               )
  //             )
  //           )
  //         )
  //       );
  //     }
  //   }
  //   return result;
  // }
}