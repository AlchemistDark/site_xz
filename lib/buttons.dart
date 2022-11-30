import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:site_xz/theme.dart';

class AppBarButton extends StatefulWidget {
  final AppTheme theme;
  final String iconPath;
  final Function onPressed;

  const AppBarButton({
    required this.theme,
    required this.iconPath,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  int index = 0;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color green = widget.theme.mineGreenColor;
    Color color1 = widget.theme.appBarButtonColor1;
    Color color2 = widget.theme.appBarButtonColor2;
    Color iconColor = widget.theme.buttonIconDarkColor;
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