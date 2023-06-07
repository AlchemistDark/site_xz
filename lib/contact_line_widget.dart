import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/global/paths.dart';
import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/global/theme.dart';

/// This class implements an celebrate icon widget.

class ContactListWidget extends StatelessWidget {
  final Contact contact;
  final AppTheme theme;
  final VoidCallback callBackDelete;
  final VoidCallback callBackUpdate;
  final VoidCallback callBackDetails;

  const ContactListWidget({
    required this.contact,
    required this.theme,
    required this.callBackDelete,
    required this.callBackUpdate,
    required this.callBackDetails,
    Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      margin: const EdgeInsets.only(left: 16, right: 16),
      color: theme.mainColor,
      child: Row(
        children: [
          /// Avatar.
          SizedBox(
            height: 54,
            width: 54,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(27),
              child: Image.asset(
                // ToDo Аватар должен браться с сервера
                "assets/images/avatar.png",//avatarImagePath = usersList[userNumber].avatarImagePath,
                fit:BoxFit.fitHeight,
              )
            )
          ),
          /// Name and address.
          Expanded(
            child: Container(
              height: 72,
              margin: const EdgeInsets.only(left: 16, right: 16),
              color: theme.mainColor,
              child: Row(
                children: [

                  /// Name and address.
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contact.name,
                            style: TextStyle(
                              color: theme.avatarText1Color,
                              fontSize: 16,
                              fontFamily: 'Roboto'
                            )
                          ),
                          Text(
                            contact.region,
                            style: TextStyle(
                              color: theme.avatarText2Color,
                              fontSize: 14,
                              fontFamily: 'Roboto'
                            )
                          ),
                          Text(
                            contact.birthday  ,
                            style: const TextStyle(
                              color: Color(0xFF7FA4EA),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              decoration: TextDecoration.underline
                            )
                          )
                        ]
                      )
                    )
                  ),
                  /// List buttons.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 36,
                        width: 36,
                        /// Delete button.
                        child: AnimatedButton(
                          theme: theme,
                          icon: const Icon(
                              Icons.delete,
                              color: Color(0xFFA6ADB5),
                          ),
                          onPressed: callBackDelete
                        )
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      SizedBox(
                        height: 36,
                        width: 36,
                        /// Edit button.
                        child: AnimatedButton(
                          theme: theme,
                          icon: const Icon(
                            Icons.edit,
                            color: Color(0xFFA6ADB5),
                          ),
                          onPressed: callBackUpdate
                        )
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      SizedBox(
                        height: 36,
                        width: 36,
                        /// Detail button.
                        child: AnimatedButton(
                          theme: theme,
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Color(0xFFA6ADB5),
                          ),
                          onPressed: callBackDetails
                        )
                      )
                    ],
                  ),
                ]
              )
            )
          ),
        ]
      )
    );
  }
}

/// Buttons with clicking animation at the icon and shadow (color changes) without a gradient.
class AnimatedButton extends StatefulWidget {
  final AppTheme theme;
  final Icon icon;
  final Function onPressed;

  const AnimatedButton({
    required this.theme,
    required this.icon,
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
        child: widget.icon
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
