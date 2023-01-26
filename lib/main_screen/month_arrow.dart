import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:site_xz/global/theme.dart';
import 'package:site_xz/global/paths.dart';

/// This class implements an arrow for a month circular face.

class MonthArrow extends StatelessWidget {
  final String data;
  final AppTheme theme;
  final VoidCallback callback;
  final int currentDay;

  const MonthArrow(
    this.data,
    this.theme,
    this.callback,
    this.currentDay,
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
        if (currentDay < 17)
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
        ),
        if (currentDay > 16)
        Center(
          child: Transform.rotate(
            angle: (math.pi / 2),
            child: GestureDetector(
              onTap: callback,
              child: Center(
                widthFactor: 172,
                heightFactor: 172,
                child: Padding(
                  padding: const EdgeInsets.only(right: 90, bottom: 18.0),
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