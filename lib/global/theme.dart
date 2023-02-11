import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/global/paths.dart';

/// Custom theme model.

class AppTheme{
  final bool isDark;

  final String logoPath;
  final String buttonBasePath;

  final Color appBarColor;
  final Color appBarTextColor;
  final Color avatarText1Color;
  final Color avatarText2Color;
  final Color celebrateStatusColor;
  final Color celebrateTextBackgroundColor;
  final Color celebrateTextColor;
  final Color clockFaceButtonTextColor;
  final Color clockFaceCenterColor;
  final Color clockFaceCircleColor;
  final Color clockFaceCurrentCelebrateIconTextColor;
  final Color clockFaceMainColor;
  final Color currentMonthSegmentTextColor;
  final Color daySegmentBorderColor;
  final Color daySegmentBottomTextColor;
  final Color daySegmentColor;
  final Color listButtonColor;
  final Color mainButtonBorderColor1;
  final Color mainButtonBorderColor2;
  final Color mainButtonFillColor1;
  final Color mainButtonFillColor2;
  final Color mainColor;
  final Color monthSegmentTopColor;
  final Color monthSegmentBottomColor;
  final Color monthSegmentLabelColor;
  final Color yearCircularFaceDecorTextColor;
  final Color yearCircularArrowCenterColor;
  final Color yearCircularArrowColor;
  final Color yearCircularArrowTextColor;

  final buttonIconColor = const Color(0xFFA6ADB5);
  final mainGreenColor = const Color(0xFF52B69A);
  final mainPinkColor = const Color(0xFFCE3B82);
  final mainWhiteColor = const Color(0xFFFFFFFF);

  final yearArrowTailColor = const Color(0xFF9DA7B0);
  final yearCircularFaceDecorColor = const Color(0xFF547CC7);

  final familyGroupButtonColor = const Color(0xFF53AABE);
  final friendsGroupButtonColor = const Color(0xFF678FDA);
  final relativesGroupButtonColor = const Color(0xFF7B6CE8);
  final colleaguesGroupButtonColor = const Color(0xFFB668EC);
  final partnersGroupButtonColor = const Color(0xFFEC69E4);

  final celebrateIconDefaultColor = const Color(0xFF9388CC);

  AppTheme.light({
    this.isDark = false,
    this.logoPath = lightLogo,
    this.buttonBasePath = lightButtonsBase,
    this.appBarColor = const Color(0xFFF0F7FE),
    this.appBarTextColor = const Color(0xFF161A1D),
    this.avatarText1Color = const Color(0xFF161A1D),
    this.avatarText2Color = const Color(0xFF627684),
    this.celebrateStatusColor = const Color(0xFFFFFFFF),
    this.clockFaceButtonTextColor = const Color(0xFF414E58),
    this.clockFaceCenterColor = const Color(0xFFFFFFFF),
    this.clockFaceCircleColor = const Color(0xFFF0F7FE),
    this.clockFaceCurrentCelebrateIconTextColor = const Color(0xFF414E58),
    this.clockFaceMainColor = const Color(0xFFE0EBF5),
    this.celebrateTextBackgroundColor = const Color(0xFFFFFFFF),
    this.celebrateTextColor = const Color(0xFF627684),
    this.currentMonthSegmentTextColor = const Color(0xFF627684),
    this.daySegmentBorderColor = const Color(0xFF627684),
    this.daySegmentBottomTextColor = const Color(0xFF161A1D),
    this.daySegmentColor = const Color(0xFFF0F7FE),
    this.listButtonColor = const Color(0xFFDDE8F5),
    this.mainButtonBorderColor1 = const Color(0xFFFFFFFF),
    this.mainButtonBorderColor2 = const Color(0xFFFFFFFF),
    this.mainButtonFillColor1 = const Color(0xFFE0ECFA),
    this.mainButtonFillColor2 = const Color(0xFFFFFFFF),
    this.mainColor = const Color(0xFFF0F7FE),
    this.monthSegmentTopColor = const Color(0xFFF0F7FE),
    this.monthSegmentBottomColor = const Color(0xFFE3F1E1),
    this.monthSegmentLabelColor = const Color(0xFFDFF0D8),
    this.yearCircularFaceDecorTextColor = const Color(0xFF414E58),
    this.yearCircularArrowCenterColor = const Color(0xFFFFFFFF),
    this.yearCircularArrowColor = const Color(0xFF627684),
    this.yearCircularArrowTextColor = const Color(0xFF627684)
  });

  AppTheme.dark({
    this.isDark = true,
    this.logoPath = darkLogo,
    this.buttonBasePath = darkButtonsBase,
    this.appBarTextColor = const Color(0xFFFFFFFF),
    this.avatarText1Color = const Color(0xFFE0EBED),
    this.avatarText2Color = const Color(0xFFBCC0C8),
    this.appBarColor = const Color(0xFF1B1C22),
    this.celebrateStatusColor = const Color(0xFF43484E),
    this.celebrateTextBackgroundColor = const Color(0xFF24262D),
    this.celebrateTextColor = const Color(0xFF8F99A3),
    this.clockFaceButtonTextColor= const Color(0xFFFFFFFF),
    this.clockFaceCenterColor = const Color(0xFF474952),
    this.clockFaceCircleColor = const Color(0xFF000000),
    this.clockFaceCurrentCelebrateIconTextColor = const Color(0xFFBCC0C8),
    this.clockFaceMainColor = const Color(0xFF2F313A),
    this.currentMonthSegmentTextColor = const Color(0xFF8D9392),
    this.daySegmentBorderColor = const Color(0xFFFFFFFF),
    this.daySegmentBottomTextColor = const Color(0xFFFFFFFF),
    this.daySegmentColor = const Color(0xFF1B2826),
    this.listButtonColor = const Color(0xFF454E54),
    this.mainButtonBorderColor1 = const Color(0xFF1C1F26),
    this.mainButtonBorderColor2 = const Color(0xFF4B4F5F),
    this.mainButtonFillColor1 = const Color(0xFF282B33),
    this.mainButtonFillColor2 = const Color(0xFF464851),
    this.mainColor = const Color(0xFF24262D),
    this.monthSegmentTopColor = const Color(0xFF1B2826),
    this.monthSegmentBottomColor = const Color(0xFF1B2826),
    this.monthSegmentLabelColor = const Color(0xFF1B2826),
    this.yearCircularFaceDecorTextColor = const Color(0xFFFFFFFF),
    this.yearCircularArrowCenterColor = const Color(0xFF43454E),
    this.yearCircularArrowColor = const Color(0xFF52B69A),
    this.yearCircularArrowTextColor = const Color(0xFFFFFFFF)
  });

}

/// List of all colors.
/// Список всех цветов. 414E58

const mainWhiteColor = Color(0xFFFFFFFF);

const appBarDarkColor = Color(0xFF1B1C22);

const mainPinkColor = Color(0xFFCE3B82); // ToDo

const buttonMainDarkColor = Color(0xFF454E54);

const calendarSegmentDarkColor = Color(0xFF1B2826);

const arrowDarkColor = Color(0xFFB4B4B8);

const arrowTailTextDarkColor = Color(0xFFA9BDE3);

///
const familyGroupButtonColor = Color(0xFF53AABE);
const friendsGroupButtonColor = Color(0xFF678FDA);
const relativesGroupButtonColor = Color(0xFF7B6CE8);
const colleaguesGroupButtonColor = Color(0xFFB668EC);
const partnersGroupButtonColor = Color(0xFFEC69E4);
