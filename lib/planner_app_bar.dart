import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:site_xz/paths.dart';
import 'package:site_xz/person_class.dart';
import 'package:site_xz/theme.dart';
import 'package:site_xz/app_controller.dart';

/// Custom AppBar for Planner.

class PlannerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function callBack;
  final AppController controller;
  final Widget child;

  late final AppTheme theme;

  /// Constructor.
  PlannerAppBar({
    required this.callBack,
    required this.controller,
    required this.child,
    Key? key
  }) : super(key: key){
    theme = controller.currentAppState.theme;
  }

  void _changeTheme() async {
    Person person = controller.currentAppState.userData;
    if (controller.currentAppState.theme.isDark) {
      controller
        .themeChange(AppState(userData: person, theme: AppTheme.light()));
    } else {
      controller
        .themeChange(AppState(userData: person, theme: AppTheme.dark()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.appBarColor,
      height: 49,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 14),
              child: GradientAnimatedButton(
              theme: theme,
              iconPath: backButtonIcon,
              onPressed: callBack,
            )
          ),
          Expanded(
            child: child,
          ),
          Container(
            margin: const EdgeInsets.only(right: 14),
            child: GradientAnimatedButton(
              theme: theme,
              iconPath: theme.isDark? sunButtonIcon : moonButtonIcon,
              onPressed: _changeTheme
            )
          )
        ]
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(49);

}

/// Buttons with click animation at the icon and shadow (color changes).
/// The button itself has a gradient,
/// and a gradient border that also changes color when clicked.
class GradientAnimatedButton extends StatefulWidget {
  final AppTheme theme;
  final String iconPath;
  final Function onPressed;

  const GradientAnimatedButton({
    required this.theme,
    required this.iconPath,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  State<GradientAnimatedButton> createState() => _GradientAnimatedButtonState();
}

class _GradientAnimatedButtonState extends State<GradientAnimatedButton> {
  int index = 0;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color green = widget.theme.mineGreenColor;
    Color color1 = widget.theme.appBarButtonColor1;
    Color color2 = widget.theme.appBarButtonColor2;
    Color iconColor = widget.theme.buttonIconColor;
    List<List<Color>> gradientColours = [[color1, color2],[green, green]];

    return Listener(
      child: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          boxShadow: [
            BoxShadow(
              color: isPressed ? green : color1,
              blurRadius: 5,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColours[index]
          )
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color2, color1]
            )
          ),
          child: isPressed?
            SvgPicture.asset(
              widget.iconPath,
              fit: BoxFit.scaleDown,
              color: green,
              width: 16,
              height: 16,
            ):
            SvgPicture.asset(
              widget.iconPath,
              fit: BoxFit.scaleDown,
              color: iconColor,
              width: 16,
              height: 16,
            ),
        )
      ),
      onPointerDown: (_) {
        setState(() {
          index = 1;
          isPressed = true;
        });
      },
      onPointerUp: (_) {
        setState(() {
          index = 0;
          isPressed = false;
        });
        widget.onPressed();
      }
    );
  }
}