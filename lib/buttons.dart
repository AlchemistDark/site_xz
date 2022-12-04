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