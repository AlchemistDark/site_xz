import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:site_xz/global/theme.dart';
import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/main_screen/month_arrow.dart';
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

      ]
    );
  }  // child: Stack(
        //   children: <Widget>[
        //     /// Draw the calendar dial.
        //     /// Рисует циферблат календаря.
        //     Stack(
        //       children: segments(celebrationList)
        //     ),

        //     Center(
        //       child: Container(
        //         width: 15.5,
        //         height: 15.5,
        //         decoration: const BoxDecoration(
        //           color: Color(0xFF474952),
        //           shape: BoxShape.circle,
        //         )
        //       )
        //     ),
        //     Center (
        //       child: Container(
        //         width: 52,
        //         height: 43,
        //         //color: Color(0xFF00FF00),
        //         margin: const EdgeInsets.only(bottom: 96),
        //         child: Image.asset(
        //           "assets/images/logo_dark.png",
        //           fit:BoxFit.contain
        //         )
        //       )
        //     ),
        //     /// Draw celebration icons.
        //     /// Рисуем иконки праздников.
        //     Center(
        //       child: Container(
        //         //color: Colors.deepPurpleAccent.withOpacity(0.75),
        //         height: 375,
        //         width:  375,
        //         margin: const EdgeInsets.only(right: 3),
        //         child: Stack(
        //           children: celebrationIcons()
        //         )
        //       )
        //     ),
        //     /// Draw the clock hand.
        //     /// Рисуем стрелку.
        //     Transform.rotate(
        //       angle: ((math.pi * 2 / 31) * (_currentDay - 0.5)),
        //       child: GestureDetector(
        //         onTap: (){},
        //         child: MonthArrow(CustomRusDateNow().rusLongMonth)
        //       )
        //     ),
        //     Center(
        //       child: Container(
        //         width: 5.32,
        //         height: 5.32,
        //         decoration: const BoxDecoration(
        //           color: Color(0xFF474952),
        //           shape: BoxShape.circle,
        //         )
        //       )
        //     )
        //   ]
        // )
      // )
    // );
  // }

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