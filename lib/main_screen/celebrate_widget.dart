import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/global/paths.dart';
import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/global/theme.dart';

/// This class implements an celebrate icon widget.

class CelebrateWidget extends StatelessWidget {
  final AppTheme theme;
  final Celebrate celebrate;
  final bool isCurrent;
  final bool haveStatus; // ToDo в ТЗ было добавить на будущее, но пока неизвестно, как оно будет реализовано.
  final bool isForYear;
  final Function(int) mainCallback;
  final int indexOfCurrent;
  final VoidCallback statusCallback;

  late double fontSize;

  CelebrateWidget({
    required this.theme,
    required this.celebrate,
    required this.isCurrent,
    required this.haveStatus,
    required this.isForYear,
    required this.mainCallback,
    required this.indexOfCurrent,
    required this.statusCallback,
    Key? key}
  ) : super(key: key) {
    fontSize = isCurrent? 8.0 : 7.0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      height: 63,
      child: Stack(
        children: <Widget>[
          /// White border.
          if (isCurrent)
            Center(
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: theme.mainWhiteColor,
                  shape: BoxShape.circle
                )
              )
            ),
          /// Main icon.
          Center(
            child: GestureDetector(
              onTap: () {
                mainCallback(indexOfCurrent);
              },
              child: SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Stack(
                    children: <Widget>[
                      Row(
                        children: background(celebrate.peopleCategory, theme)
                      ),
                      Image.asset(
                        "$celebratesIconsPath/${celebrate.icon}.png",
                        fit: BoxFit.contain,
                        color: theme.mainWhiteColor,
                      )
                    ]
                  )
                )
              )
            )
          ),
          /// Status icon.
          if (haveStatus)
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: statusCallback,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: theme.celebrateStatusColor.withOpacity(0.75),
                      child: Image.asset(
                        "assets/images/actions/vector.png",  // ToDo Временное решение
                        fit: BoxFit.contain,
                        color: theme.mainGreenColor,
                      )
                    )
                  )
                )
              )
            ),
          /// Date text.
          if (isForYear)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 45,
                decoration: BoxDecoration(
                  color: isCurrent? const Color(0xFFFF40B0) : theme.celebrateTextBackgroundColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                //color: theme.celebrateTextBackgroundColor.withOpacity(0.5),
                child: Text(
                  "${celebrate.day.toString().padLeft(2, '0')}.${celebrate.month.toString().padLeft(2, '0')}.2023",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isCurrent? const Color(0xFFFFFFFF) : theme.celebrateTextColor,
                    fontSize: fontSize,
                    fontFamily: 'Roboto',
                    height: 1.102
                  )
                )
              )
            )
        ]
      )
    );
  }
}

List<Widget> background(List<int> colors, AppTheme theme) {
  List<Widget> result = [];
  Color color;
    for (int i in colors) {
      switch(i) {
        case 1:
          color = theme.familyGroupButtonColor;
          break;
        case 2:
          color = theme.friendsGroupButtonColor;
          break;
        case 3:
          color = theme.relativesGroupButtonColor;
          break;
        case 4:
          color = theme.colleaguesGroupButtonColor;
          break;
        case 5:
          color = theme.partnersGroupButtonColor;
          break;
        default:
          color = theme.celebrateIconDefaultColor;
      }
      result.add(
        Expanded(
          flex: 1,
          child: Container(
            color: color
          )
        )
      );
    }
  return result;
}
