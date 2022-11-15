import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:site_xz/provider.dart';
import 'package:site_xz/theme.dart';
import 'package:site_xz/month_circular_face.dart';


class MinePlanner extends StatefulWidget {
  final String title;
  final Provider provider;
  final double mineWidth;
  final double mineHeight;
  final double widthScaleFactor;
  final double heightScaleFactor;

  const MinePlanner(
    this.title,
    this.provider,
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

  _MinePlannerState();

  @override
  Widget build(BuildContext context) {
    // double height = widget.mineHeight - 395;//450;
    // double scaleFactor = (height < widget.mineWidth)
    //     ? (height / 375) : (widget.mineWidth / 375);
    // print(scaleFactor); // ToDo
    // print(height);
    // print(widget.mineHeight);
    // print(widget.mineWidth);
    // if (widget.provider.authState.token != 'pass') {
    //   widget.provider.postRequest(widget.provider.authState.token);
    //   print(widget.provider.postRequest(widget.provider.authState.token));
    // }
    print('token: ${widget.provider.authState.token}');
    double scaleFactor = widget.mineWidth / 375;
    return Scaffold(
      body: Container(
        color: mineDarkColor,
        child: Column(
          children: <Widget>[
            /// appBar. // ToDo
            Container(
              width: widget.mineWidth,
              height: 46,
              padding: const EdgeInsets.all(0.0),
              margin: const EdgeInsets.all(0.0),
              color: appBarDarkColor,
              child: Row(
                children: const [
                  Text('Здесь будет appBar') // ToDo
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(37),
                      child: Image.asset(
                        "assets/images/avatar.png",
                        fit:BoxFit.scaleDown,
                      )
                    )
                  ),
                  /// Name and address.
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Имя Фамилия',
                            style: TextStyle(
                              color: text1DarkColor,
                               fontSize: 16,
                              fontFamily: 'Roboto'
                            ),
                          ),
                          Text(
                            'Город, Страна',
                            style: TextStyle(
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
                              onPressed: (){},
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
                              onPressed: (){},
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
            /// Add buttons line
            Container(
              width: widget.mineWidth,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                /// Left button.
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 46,
                      margin: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: buttonDarkDarkColor,
                            border: Border.all(color: mineGreenColor, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 36,
                                  width: 36,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Container(
                                      color: buttonMineDarkColor,
                                      child: const Icon(
                                        Icons.add_outlined,
                                        color: buttonIconDarkColor,
                                        size: 20,
                                      ),
                                    )
                                  )
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 12, top: 6),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Добавить',
                                        style: TextStyle(
                                          color: mineWhiteColor,
                                          fontSize: 14,
                                          fontFamily: 'Roboto'
                                        ),
                                      ),
                                      Text(
                                        'праздник',
                                        style: TextStyle(
                                          color: mineWhiteColor,
                                          fontSize: 14,
                                          fontFamily: 'Roboto'
                                        ),
                                      )
                                    ]
                                  )
                                )
                              ]
                            )
                          )
                        ),
                      ),
                    ),
                  ),
                  /// Right button.
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 46,
                      margin: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: buttonDarkDarkColor,
                            border: Border.all(color: mineGreenColor, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 36,
                                  width: 36,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Container(
                                      color: buttonMineDarkColor,
                                      child: const Icon(
                                        Icons.add_outlined,
                                        color: buttonIconDarkColor,
                                        size: 20,
                                      ),
                                    )
                                  )
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 12, top: 6),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Добавить',
                                        style: TextStyle(
                                          color: mineWhiteColor,
                                          fontSize: 14,
                                          fontFamily: 'Roboto'
                                        ),
                                      ),
                                      Text(
                                        'праздник',
                                        style: TextStyle(
                                          color: mineWhiteColor,
                                          fontSize: 14,
                                          fontFamily: 'Roboto'
                                        ),
                                      )
                                    ]
                                  )
                                )
                              ]
                            )
                          )
                        )
                      )
                    )
                  )
                ]
              )
            ),
            /// Clock face. // ToDo
            SizedBox(
              height: widget.mineWidth,
              child: Transform.scale(
                scale: scaleFactor, //scaleFactor,
                child: CircleClockFace()
              )
            ),
            /// Celebration line.
            Container(
              width: widget.mineWidth,
              height: 42,
              margin: const EdgeInsets.only(left: 16, right: 16),
              color: mineDarkColor,
              child: Row(
                children: [
                  /// Celebration icon.
                  SizedBox(
                    width: 42,
                    height: 42,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(21),
                      child: SvgPicture.asset(
                        "assets/images/flutter_logo.svg",
                        fit: BoxFit.scaleDown
                      )
                    )
                  ),
                  /// Celebration name.
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'День рождения',
                            style: TextStyle(
                              color: mineWhiteColor,
                              fontSize: 10,
                              fontFamily: 'Roboto'
                            ),
                          ),
                          Text(
                            'Дата',
                            style: TextStyle(
                              color: mineGreenColor,
                              fontSize: 10,
                              fontFamily: 'Roboto'
                            ),
                          )
                        ]
                      )
                    )
                  ),
                  /// Buttons.
                  Container(
                    child: (
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            padding: const EdgeInsets.only(right: 2),
                            child: FloatingActionButton(
                              onPressed: (){},
                              backgroundColor: buttonMineDarkColor,
                              child: const Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: buttonIconDarkColor,
                                size: 26,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 36,
                            width: 36,
                            padding: const EdgeInsets.only(left: 2),
                            child: FloatingActionButton(
                              onPressed: (){},
                              backgroundColor: buttonMineDarkColor,
                              child: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: buttonIconDarkColor,
                                size: 26,
                              ),
                            ),
                          )
                        ],
                      )
                    )
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
                    count: '0',
                    buttonName: 'Семья',
                    date: 'Дата',
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
                    count: '0',
                    buttonName: 'Друзья',
                    date: 'Дата',
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
                    count: '0',
                    buttonName: 'Близкие',
                    date: 'Дата',
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
                    count: '0',
                    buttonName: 'Коллеги',
                    date: 'Дата',
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
                    count: '0',
                    buttonName: 'Партнёры',
                    date: 'Дата',
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
