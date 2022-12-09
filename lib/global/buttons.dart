import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:site_xz/global/theme.dart';

/// Buttons with clicking animation at the icon and shadow (color changes) without a gradient.
class AnimatedButton extends StatefulWidget {
  final AppTheme theme;
  final String iconPath;
  final Function onPressed;

  const AnimatedButton({
    required this.theme,
    required this.iconPath,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color green = widget.theme.mainGreenColor;
    Color color = widget.theme.listButtonColor;
    Color iconColor = widget.theme.buttonIconColor;

    return Listener(
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: color,
          boxShadow: [
            BoxShadow(
              color: isPressed? green : color,
              blurRadius: isPressed? 5 : 0,
              spreadRadius: 0,
            )
          ]
        ),
        child: SvgPicture.asset(
          widget.iconPath,
          fit: BoxFit.scaleDown,
          color: isPressed? green : iconColor,
          width: 16,
          height: 16,
        )
      ),
      onPointerDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onPointerUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      }
    );
  }
}

/// Buttons with click animation at the border and shadow (color changes).
/// The button itself has a gradient and a gradient border.
class GradientAnimatedButtonWithGreenIcon extends StatefulWidget {
  final AppTheme theme;
  final String iconPath;
  final Function onPressed;

  const GradientAnimatedButtonWithGreenIcon({
    required this.theme,
    required this.iconPath,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  State<GradientAnimatedButtonWithGreenIcon> createState() => _GradientAnimatedButtonWithGreenIconState();
}

class _GradientAnimatedButtonWithGreenIconState extends State<GradientAnimatedButtonWithGreenIcon> {
  int index = 0;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color green = widget.theme.mainGreenColor;
    Color color1 = widget.theme.mainButtonBorderColor1;
    Color color2 = widget.theme.mainButtonBorderColor2;
    Color color3 = widget.theme.mainButtonFillColor1;
    Color color4 = widget.theme.mainButtonFillColor2;
    Color iconColor = widget.theme.buttonIconColor;
    List<List<Color>> gradientColours = [[color1, color2],[green, green]];

    return Listener(
      child: Container(
        height: 35,
        width: 35,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.5),
            boxShadow: [
              BoxShadow(
                color: isPressed ? green : color1,
                blurRadius: 5,
                spreadRadius: 0,
                offset: const Offset(0, 0),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: gradientColours[index]
            )
          ),
          child: Container(
            margin: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.5),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color4, color3]
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
          print('pressed');
          setState(() {
            index = 1;
            isPressed = true;
          });
        },
        onPointerUp: (_) {
          print('upped');
          setState(() {
            index = 0;
            isPressed = false;
          });
          widget.onPressed();
        }
    );
  }
}