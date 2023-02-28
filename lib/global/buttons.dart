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
  }
  ) : super(key: key);

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
    Color iconColor = widget.theme.mainGreenColor;
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

/// Buttons for group line on main screen.
class MyGroupButton extends StatelessWidget {
  final bool isPressed;
  final AppTheme theme;
  final VoidCallback callback;
  final Color buttonColor;
  final String iconPath;
  final String count;
  final String buttonName;
  final String date;

  const MyGroupButton({
    required this.isPressed,
    required this.theme,
    required this.callback,
    required this.buttonColor,
    required this.iconPath,
    required this.count,
    required this.buttonName,
    required this.date,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 62,
          height: 62,
          child: InkWell(
            onTap: callback,
            child: Stack(
              children: [
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isPressed?
                        [Colors.black, Colors.white] :
                        [Colors.white, Colors.black]
                    ),//Colors.white,//buttonColor,
                    border: Border.all(color: buttonColor, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  )
                ),
                Center(
                  child: Container(
                    width: 42,
                    height: 42,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(4.0),
                      boxShadow: [
                        BoxShadow(
                          color: buttonColor,
                          blurRadius: 5,
                          spreadRadius: 7,
                          offset: const Offset(0, 0)
                        ),
                      ],
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        iconPath,
                        fit: BoxFit.scaleDown
                      )
                    )
                  )
                ),
                Container(
                  width: 16,
                  height: 16,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 1, left: 45),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    count,
                    style: TextStyle(
                      color: theme.groupButtonsCountTextColor,
                      fontSize: 13,
                      fontFamily: 'Roboto'
                    ),
                  )
                )
              ]
            )
          )
        ),
        Text(
          buttonName,
          style: TextStyle(
            color: theme.groupButtonsTextColor,
            fontSize: 10,
            fontFamily: 'Roboto'
          ),
        ),
        Text(
          date,
          style: TextStyle(
            color: theme.groupButtonsTextColor,
            fontSize: 10,
            fontFamily: 'Roboto'
          ),
        )
      ]
    );
  }

}

/// Buttons for navBar.
class MyNavBarButton extends StatelessWidget {
  final AppTheme theme;
  final VoidCallback callback;
  final String iconPath;
  final Color iconColor;

  const MyNavBarButton({
    required this.theme,
    required this.callback,
    required this.iconPath,
    required this.iconColor,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color1 = theme.mainButtonFillColor1;
    Color color2 = theme.mainButtonFillColor2;
    //Color iconColor = theme.mainGreenColor;
    return SizedBox(
      width: 56,
      height: 56,
      child: InkWell(
        onTap: callback,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color1, color2]
            ),//Colors.white,//buttonColor,
            border: Border.all(color: color2, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.scaleDown
            )
          )
        )
      )
    );
  }

}


/// Buttons for navBar.
class CentralNavBarButton extends StatelessWidget {
  final AppTheme theme;
  final VoidCallback callback;
  final String iconPath;
  final Color iconColor;

  const CentralNavBarButton({
    required this.theme,
    required this.callback,
    required this.iconPath,
    required this.iconColor,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color1 = theme.mainButtonFillColor1;
    Color color2 = theme.mainButtonFillColor2;
    //Color iconColor = theme.mainGreenColor;
    return SizedBox(
      width: 75,
      height: 75,
      child: InkWell(
        onTap: callback,
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color1, color2]
            ),//Colors.white,//buttonColor,
            border: Border.all(color: theme.mainGreenColor, width: 2.0),
            borderRadius: BorderRadius.circular(75 / 2),
          ),
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              iconPath,
                        fit: BoxFit.scaleDown
                    )
                )
            )
        )
    );
  }

}