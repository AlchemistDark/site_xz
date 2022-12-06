import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Custom theme model.

class AppTheme{
  final bool isDark;
  final Color mineColor;
  final Color appBarColor;
  final Color mainButtonBorderColor1;
  final Color mainButtonBorderColor2;
  final Color mainButtonFillColor1;
  final Color mainButtonFillColor2;
  final Color appBarTextColor;
  final Color avatarText1Color;
  final Color avatarText2Color;
  final Color listButtonColor;
  final Color clockFaceMineColor;

  final mineGreenColor = const Color(0xFF52B69A);
  final minePinkColor = const Color(0xFFCE3B82);
  final buttonIconColor = const Color(0xFFA6ADB5);

  AppTheme.light({
    this.isDark = false,
    this.mineColor = const Color(0xFFF0F7FE),
    this.appBarColor = const Color(0xFFFFFFFF),
    this.mainButtonBorderColor1 = const Color(0xFFE0ECFA),
    this.mainButtonBorderColor2 = const Color(0xFFFFFFFF),
    this.mainButtonFillColor1 = const Color(0xFFFFFFFF),
    this.mainButtonFillColor2 = const Color(0xFFFFFFFF),
    this.appBarTextColor = const Color(0xFF161A1D),
    this.avatarText1Color = const Color(0xFF161A1D),
    this.avatarText2Color = const Color(0xFF627684),
    this.listButtonColor = const Color(0xFFDDE8F5),
    this.clockFaceMineColor = const Color(0xFFE0EBF5)
  });//282B33  464851 fill

  AppTheme.dark({
    this.isDark = true,
    this.mineColor = const Color(0xFF24262D),
    this.appBarColor = const Color(0xFF1B1C22),
    this.mainButtonBorderColor1 = const Color(0xFF1C1F26),
    this.mainButtonBorderColor2 = const Color(0xFF4B4F5F),
    this.mainButtonFillColor1 = const Color(0xFF282B33),
    this.mainButtonFillColor2 = const Color(0xFF464851),
    this.appBarTextColor = const Color(0xFFFFFFFF),
    this.avatarText1Color = const Color(0xFFE0EBED),
    this.avatarText2Color = const Color(0xFFBCC0C8),
    this.listButtonColor = const Color(0xFF454E54),
    this.clockFaceMineColor = const Color(0xFF2F313A)
  });

}

/// List of all colors.
/// Список всех цветов.

const mineWhiteColor = Color(0xFFFFFFFF);

const appBarDarkColor = Color(0xFF1B1C22);

const mineDarkColor = Color(0xFF24262D); // ToDo

const mineGreenColor = Color(0xFF52B69A); // ToDo
const minePinkColor = Color(0xFFCE3B82); // ToDo

const buttonMineDarkColor = Color(0xFF454E54);

const buttonIconDarkColor = Color(0xFFA6ADB5);

const calendarSegmentDarkColor = Color(0xFF1B2826);

const arrowDarkColor = Color(0xFFB4B4B8);

const arrowTailTextDarkColor = Color(0xFFA9BDE3);

///
const familyGroupButtonColor = Color(0xFF53AABE);
const friendsGroupButtonColor = Color(0xFF678FDA);
const relativesGroupButtonColor = Color(0xFF7B6CE8);
const colleaguesGroupButtonColor = Color(0xFFB668EC);
const partnersGroupButtonColor = Color(0xFFEC69E4);
const croupButtonsTextColor = Color(0xFF393939);