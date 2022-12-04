import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:site_xz/theme.dart';

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
    Color green = widget.theme.mineGreenColor;
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
          child: isPressed
            ? SvgPicture.asset(
              widget.iconPath,
              fit: BoxFit.scaleDown,
              color: green,
              width: 16,
              height: 16,
            )
            : SvgPicture.asset(
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
