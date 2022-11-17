import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:site_xz/theme.dart';
import 'package:site_xz/month_circular_face.dart';
import 'package:site_xz/user_class.dart';
import 'dart:math' as math;

class MinePlanner extends StatefulWidget {
  final String title;
  final double mineWidth;
  final double mineHeight;
  final double widthScaleFactor;
  final double heightScaleFactor;

  const MinePlanner(
    this.title,
    this.mineWidth,
    this.mineHeight,
    this.widthScaleFactor,
    this.heightScaleFactor,
    {Key? key}
  ) : super(key: key);

  @override
  State<MinePlanner> createState() => _MinePlannerState();

}

class _MinePlannerState extends State<MinePlanner> {
  int userNumber = 0;  // todo логику работы с юзерами придётся переписать.
  String avatarImagePath = "assets/images/avatar.png";

  void userNumberDown(){// todo проверить не надо ли будет переписать.
    if (userNumber > 0) {
      userNumber = userNumber - 1;
    } else {
      userNumber = usersList.length - 1;
    }
    setState((){});
  }

  void userNumberUp(){// todo проверить не надо ли будет переписать.
    if (userNumber < usersList.length - 1) {
      userNumber = userNumber + 1;
    } else {
      userNumber = 0;
    }
    setState((){});
  }


  _MinePlannerState();

  @override
  Widget build(BuildContext context) {
    double scaleFactor = widget.mineWidth / 375;
    return Scaffold(
      body: Container(
        color: mineDarkColor,
        child: Column(
          children: <Widget>[
            /// appBar. // ToDo
            Container(
              color: appBarDarkColor,
              width: widget.mineWidth,
              height: 49,
              child: Row(
                children: [
                  Container(
                    height: 36,
                    width: 36,
                    margin: const EdgeInsets.only(left: 14),
                    child: FloatingActionButton(
                      onPressed: (){},
                      backgroundColor: buttonMineDarkColor,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: buttonIconDarkColor,
                        size: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'События ближайшего месяца',
                            style: TextStyle(
                              color: mineWhiteColor,
                              fontSize: 17,
                              fontFamily: 'Roboto'
                            ),
                          ),
                          Text(
                            'Группа “Natalya Bloom” ($userNumber/${usersList.length})',
                            style: const TextStyle(
                              color: mineWhiteColor,
                              fontSize: 14,
                              fontFamily: 'Roboto'
                            ),
                          )
                        ]
                      )
                    )
                  ),
                  Container(
                    height: 36,
                    width: 36,
                    margin: const EdgeInsets.only(right: 14),
                    child: FloatingActionButton(
                      onPressed: (){},
                      backgroundColor: buttonMineDarkColor,
                      child: const Icon(
                        Icons.wb_sunny_outlined,
                        color: buttonIconDarkColor,
                        size: 16,
                      ),
                    ),
                  )
                ]
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: widget.mineWidth,
              )
            ),
            /// Contact avatar line.
            Container(
              width: widget.mineWidth,
              height: 72,
              margin: const EdgeInsets.only(left: 16, right: 16),
              color: mineDarkColor,
              child: Row(
                children: [
                  /// Avatar.
                  SizedBox(
                    height: 54,
                    width: 54,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(27),
                      child: Image.asset(
                        avatarImagePath = usersList[userNumber].avatarImagePath,
                        fit:BoxFit.fitHeight,
                      )
                    )
                  ),
                  /// Name and address.
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            usersList[userNumber].username,
                            style: const TextStyle(
                              color: text1DarkColor,
                              fontSize: 16,
                              fontFamily: 'Roboto'
                            ),
                          ),
                          Text(
                            usersList[userNumber].region,
                            style: const TextStyle(
                              color: text2DarkColor,
                              fontSize: 14,
                              fontFamily: 'Roboto'
                            ),
                          )
                        ]
                      )
                    )
                  ),
                  /// List buttons.
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            padding: const EdgeInsets.only(right: 2),
                            //margin: const EdgeInsets.all(0),
                            child: FloatingActionButton(
                              onPressed: userNumberDown,
                              backgroundColor: buttonMineDarkColor,
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: buttonIconDarkColor,
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 36,
                            width: 36,
                            padding: const EdgeInsets.only(left: 2),
                            //margin: const EdgeInsets.all(0),
                            child: FloatingActionButton(
                              onPressed: userNumberUp,
                              backgroundColor: buttonMineDarkColor,
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: buttonIconDarkColor,
                                size: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: (
                          SizedBox(
                            height: 36,
                            width: 36,
                            child: FloatingActionButton(
                              onPressed: (){},
                              backgroundColor: buttonMineDarkColor,
                              child: SvgPicture.asset(
                                "assets/images/list_button.svg",
                                fit: BoxFit.scaleDown,
                                color: buttonIconDarkColor,
                                width: 16,
                                height: 16,
                              ),
                            ),
                          )
                        ),
                      )
                    ]
                  )
                ]
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: widget.mineWidth,
              )
            ),
            /// todo
            Container(
              width: widget.mineWidth,
              height: (widget.mineWidth + 30),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: [
                      /// Add buttons line.
                      Container(
                        height: 80,
                        margin: const EdgeInsets.only(top: 0),
                        color: buttonDarkDarkColor,
                        child: Row(
                          children: [
                            /// Left button.
                            Container(
                              margin: const EdgeInsets.only(left: 12, top: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Добавить",
                                    style: TextStyle(
                                      color: mineWhiteColor,
                                      fontSize: 12,
                                      fontFamily: 'Roboto'
                                    ),
                                  ),
                                  const Text(
                                    "повод",
                                    style: TextStyle(
                                      color: mineWhiteColor,
                                      fontSize: 12,
                                      fontFamily: 'Roboto'
                                    ),
                                  ),
                                  Container(
                                    height: 36,
                                    width: 36,
                                    // margin: const EdgeInsets.only(left: 14),
                                    child: FloatingActionButton(
                                      onPressed: (){},
                                      backgroundColor: buttonMineDarkColor,
                                      elevation: 5,
                                      child: const Icon(
                                        Icons.add_outlined,
                                        color: mineGreenColor,
                                        size: 30,
                                      )
                                    )
                                  ),
                                ]
                              )
                            ),
                            Expanded(
                              child: Container()
                            ),
                            /// Right button.
                            Container(
                              margin: const EdgeInsets.only(right: 12, top: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Добавить",
                                    style: TextStyle(
                                      color: mineWhiteColor,
                                      fontSize: 12,
                                      fontFamily: 'Roboto'
                                    ),
                                  ),
                                  const Text(
                                    "контакт",
                                    style: TextStyle(
                                      color: mineWhiteColor,
                                      fontSize: 12,
                                      fontFamily: 'Roboto'
                                    ),
                                  ),
                                  Container(
                                    height: 36,
                                    width: 36,
                                    // margin: const EdgeInsets.only(left: 14),
                                    child: FloatingActionButton(
                                      onPressed: (){},
                                      backgroundColor: buttonMineDarkColor,
                                      elevation: 5,
                                      child: const Icon(
                                        Icons.add_outlined,
                                        color: mineGreenColor,
                                        size: 30,
                                      )
                                    )
                                  ),
                                ]
                              )
                            ),
                          ]
                        )
                      ),
                      Expanded(
                        child: Container()
                      ),
                      /// Celebration line.
                      Container(
                        height: 85,
                        margin: EdgeInsets.only(bottom: 0),
                        color: buttonDarkDarkColor,
                        child: Row(
                          children: [
                            /// Celebration group.
                            Container(
                              margin: const EdgeInsets.only(left: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(22.5),
                                      child: Container(
                                        color: friendsGroupButtonColor,
                                        child: SvgPicture.asset(
                                          usersList[userNumber].nextHolidayIconPath,
                                          fit: BoxFit.scaleDown,
                                          height: 35,
                                          width: 35,
                                        )
                                      )
                                    )
                                  ),
                                  Text(
                                    usersList[userNumber].nextHoliday,
                                    style: const TextStyle(
                                      color: text2DarkColor,
                                      fontSize: 11,
                                      fontFamily: 'Roboto'
                                    ),
                                  ),
                                  Text(
                                    usersList[userNumber].nextHolidayName,
                                    style: const TextStyle(
                                      color: mineWhiteColor,
                                      fontSize: 12,
                                      fontFamily: 'Roboto'
                                    ),
                                  ),
                                ]
                              )
                            ),
                            Expanded(
                              child: Container()
                            ),
                            // margin: const EdgeInsets.only(top: 4),
                            /// Buttons group.
                            Container(
                              margin: const EdgeInsets.only(right: 12, top: 8),
                              child: Stack(
                                children: [
                                  // SizedBox(
                                  //   width: 85,
                                  //   height: 85,
                                  //   child: SvgPicture.asset(
                                  //     'assets/images/button_group.svg',
                                  //     fit: BoxFit.contain,
                                  //     color: calendarSegmentDarkColor,
                                  //   )
                                  // ),
                                  Transform.rotate(
                                    angle: (-math.pi / 180 * 39),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 36,
                                          width: 36,
                                          padding: const EdgeInsets.only(right: 2),
                                          //margin: const EdgeInsets.all(0),
                                          child: FloatingActionButton(
                                            onPressed: userNumberDown,
                                            backgroundColor: buttonMineDarkColor,
                                            child: const Icon(
                                              Icons.arrow_back_ios_new,
                                              color: mineGreenColor,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Container(
                                          height: 36,
                                          width: 36,
                                          padding: const EdgeInsets.only(left: 2),
                                          //margin: const EdgeInsets.all(0),
                                          child: FloatingActionButton(
                                            onPressed: userNumberUp,
                                            backgroundColor: buttonMineDarkColor,
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: mineGreenColor,
                                              size: 20,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ),
                                ]
                              )
                            ),
                          ]
                        )
                      )
                    ],
                  ),
                  /// Clock face. // ToDo
                  Center(
                    child: SizedBox(
                      height: widget.mineWidth,
                      child: Transform.scale(
                        scale: scaleFactor, //scaleFactor,
                        child: MonthCircleClockFace(
                          celebrationList: usersList[userNumber].holidays
                        )
                      )
                    )
                  ),
                ]
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: widget.mineWidth,
              )
            ),
            /// Groups line.
            Container(
              width: widget.mineWidth,
              height: 90,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  /// Family group button.
                  MyGroupButton(
                    callback: (){},
                    buttonColor: familyGroupButtonColor,
                    iconPath: 'assets/images/family_group_icon.svg',
                    count: usersList[userNumber].peopleCount[0].toString(),
                    buttonName: 'Семья',
                    date: usersList[userNumber].peopleDates[0],
                  ),
                  /// Separator.
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 90,
                    ),
                  ),
                  /// Friends group button.
                  MyGroupButton(
                    callback: (){},
                    buttonColor: friendsGroupButtonColor,
                    iconPath: 'assets/images/friends_group_icon.svg',
                    count: usersList[userNumber].peopleCount[1].toString(),
                    buttonName: 'Друзья',
                    date: usersList[userNumber].peopleDates[1],
                  ),
                  /// Separator.
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 90,
                    ),
                  ),
                  /// Relatives group button.
                  MyGroupButton(
                    callback: (){},
                    buttonColor: relativesGroupButtonColor,
                    iconPath: 'assets/images/relatives_group_icon.svg',
                    count: usersList[userNumber].peopleCount[2].toString(),
                    buttonName: 'Близкие',
                    date: usersList[userNumber].peopleDates[2],
                  ),
                  /// Separator.
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 90,
                    ),
                  ),
                  /// Colleagues group button.
                  MyGroupButton(
                    callback: (){},
                    buttonColor: colleaguesGroupButtonColor,
                    iconPath: 'assets/images/colleagues_group_icon.svg',
                    count: usersList[userNumber].peopleCount[3].toString(),
                    buttonName: 'Коллеги',
                    date: usersList[userNumber].peopleDates[3],
                  ),
                  /// Separator.
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 90,
                    ),
                  ),
                  /// Partners group button.
                  MyGroupButton(
                    callback: (){},
                    buttonColor: partnersGroupButtonColor,
                    iconPath: 'assets/images/partners_group_icon.svg',
                    count: usersList[userNumber].peopleCount[4].toString(),
                    buttonName: 'Партнёры',
                    date: usersList[userNumber].peopleDates[4],
                  )
                ]
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: widget.mineWidth,
              )
            ),
            /// navBar. // ToDo
            Container(
              width: widget.mineWidth,
              height: 46,
              padding: const EdgeInsets.all(0.0),
              margin: const EdgeInsets.all(0.0),
              color: appBarDarkColor,
              child: Row(
                children: const [
                  Text('Здесь будет navBar') // ToDo
                      //  FloatingActionButton(
                      //    onPressed: () => {},
                      //    foregroundColor: Color(0xFF00FF00),
                      //    backgroundColor: Color(0xFFFFFF00),
                      //    //hoverColor: Color(0xFFFF0000),
                      //    elevation: 5.0,
                      //      child:
                      //      (const Icon(
                      //        Icons.arrow_back_ios_new,
                      //        color: Color(0xFFBBBBBB),
                      //      ))
                      //  ),
                      //  RawMaterialButton(
                      //    onPressed: () {},
                      //    elevation: 2.0,
                      //    child: const Icon(
                      //      Icons.wb_sunny_outlined,
                      //      color: appBarDarkColor,
                      //    )
                      // ),
                      // padding: const EdgeInsets.all(0.0),
                ]
              )
            ),
          ]
        )
      )
    );
  }
}

class MyGroupButton extends StatelessWidget {
  final VoidCallback callback;
  final Color buttonColor;
  final String iconPath;
  final String count;
  final String buttonName;
  final String date;

  const MyGroupButton({
    required this.callback,
    required this.buttonColor,
    required this.iconPath,
    required this.count,
    required this.buttonName,
    required this.date,
    Key? key}
  ) : super(key: key);

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
                    color: buttonColor,
                    // border: Border.all(color: familyGroupButtonColor, width: 1.0), todo добавить внутреннюю тень
                    borderRadius: BorderRadius.circular(9.0),
                  )
                ),
                Container(
                  width: 52,
                  height: 52,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(4.0),
                    // boxShadow: const [ // todo добавить тень
                    //   BoxShadow(
                    //     color: Colors.white,
                    //     blurRadius: 1,
                    //     spreadRadius: 5,
                    //     offset: Offset(0, 0)
                    //   ),
                    //   BoxShadow(
                    //     color: Colors.black,
                    //     blurRadius: 5,
                    //     spreadRadius: 1,
                    //     offset: Offset(5, 5)
                    //   ),
                    // ],
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        iconPath,
                        fit: BoxFit.scaleDown
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
                      style: const TextStyle(
                        color: croupButtonsTextColor,
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
          style: const TextStyle(
            color: mineWhiteColor,
            fontSize: 10,
            fontFamily: 'Roboto'
          ),
        ),
        Text(
          date,
          style: const TextStyle(
            color: mineWhiteColor,
            fontSize: 10,
            fontFamily: 'Roboto'
          ),
        )
      ]
    );
  }

}
