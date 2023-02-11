import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:site_xz/calendar_screen_view.dart';
import 'package:site_xz/contact_list_view.dart';
import 'package:site_xz/global/app_controller.dart';
import 'package:site_xz/global/buttons.dart';
import 'package:site_xz/global/paths.dart';
import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/global/planner_app_bar.dart';
import 'package:site_xz/global/theme.dart';
import 'package:site_xz/main_screen/celebrate_widget.dart';
import 'package:site_xz/main_screen/month_circular_face/month_circular_face_view.dart';
import 'package:site_xz/main_screen/year_circular_face/year_circular_face_view.dart';

/// The main window of the application.

class MainPlanner extends StatefulWidget {
  static const route = '/planner';

  final String title;
  final double mainWidth;
  final AppController appController;

  const MainPlanner(
    this.title,
    this.mainWidth,
    this.appController,
    {Key? key}
  ) : super(key: key);

  @override
  State<MainPlanner> createState() => _MainPlannerState();
}

class _MainPlannerState extends State<MainPlanner> {
  int userNumber = 0;  // ToDo логику работы с юзерами придётся переписать.
  String avatarImagePath = "assets/images/avatar.png";  // ToDo аватар должен грузиться с сервера.
  bool isMonth = false;
  // int currentYearCelebrate = 0;
  // int currentMonthCelebrate = 0;
  int currentCelebrate = 0;
  int numberOfCelebrations = 0;
  int numberOfYearCelebrates = 0;
  int numberOfMonthCelebrates = 0;
  bool resetCurrentCelebration = true;
  final int _currentDay = DateTime.now().day;
  final int _currentMonth = DateTime.now().month;
  final int _currentYear = DateTime.now().year; //ToDo

  /// Constructor.
  _MainPlannerState();

  String _period(){
    return isMonth? 'месяца' : 'года';
  }

  /// Changes the calendar mode between monthly and yearly.
  void _periodChange(){
    resetCurrentCelebration = true;
    isMonth = !isMonth;
    setState((){});
  }

  void userNumberDown(){// todo проверить не надо ли будет переписать.
    // if (userNumber > 0) {
    //   userNumber = userNumber - 1;
    // } else {
    //   userNumber = usersList.length - 1;
    // }
    // setState((){});
  }

  void userNumberUp(){// todo проверить не надо ли будет переписать.
    // if (userNumber < usersList.length - 1) {
    //   userNumber = userNumber + 1;
    // } else {
    //   userNumber = 0;
    // }
    // setState((){});
  }

  /// Sorts holidays by date starting with the current and the next 365 (in a leap year - 366) days.
  // There is a very big O(n) here because sorting by dates is needed
  // and I didn't come up with anything better :/
  List<Celebrate> getSortedYearCelebrates(List<Celebrate> celebrates) {
    List<Celebrate> result = [];
    for (int l = 31; l > _currentDay; l--) {
      for (Celebrate celebrate in celebrates) {
        if ((celebrate.month == _currentMonth) && (celebrate.day == l)) {
          result.add(celebrate);
          break;
        }
      }
    }
    for (int l = _currentDay; l > 0; l--) {
      for (Celebrate celebrate in celebrates) {
        if ((celebrate.month == _currentMonth) && (celebrate.day == l)) {
          result.add(celebrate);
          break;
        }
      }
    }
    for (int i = (_currentMonth - 1); i > 0; i--) {
      for (int l = 31; l > 0; l--) {
        for (Celebrate celebrate in celebrates) {
          if ((celebrate.month == i) && (celebrate.day == l)) {
            result.add(celebrate);
            break;
          }
        }
      }
    }
    for (int i = 12; i > _currentMonth; i--) {
      for (int l = 31; l > 0; l--) {
        for (Celebrate celebrate in celebrates) {
          if ((celebrate.month == i) && (celebrate.day == l)) {
            result.add(celebrate);
            break;
          }
        }
      }
    }
    numberOfYearCelebrates = result.length;
    return result;
  }

  /// Returns from the list of all celebrations only those celebrations
  /// that should be displayed on the current screen.
  List<Celebrate> getSortedMonthCelebrates(List<Celebrate> celebrates){
    List<Celebrate> result = [];
    for(Celebrate celebrate in celebrates){
      if(celebrate.month == _currentMonth && celebrate.day >= _currentDay) {
        result.add(celebrate);
      }
      if(celebrate.month == (_currentMonth + 1) && celebrate.day < _currentDay) {
        result.add(celebrate);
      }
    }
    numberOfMonthCelebrates = result.length;
    return result;
  }

  /// Changes the index of the current holiday to the selected one.
  void currentCelebrateChange(int newIndex){
    resetCurrentCelebration = false;
    setState(() {
      currentCelebrate = newIndex;
    });
  }

  /// Increment value of the current celebration.
  void currentCelebrateIncrement(){
    resetCurrentCelebration = false;
    setState((){
      if (currentCelebrate == numberOfCelebrations){
        currentCelebrate = 0;
      } else {
        currentCelebrate = currentCelebrate + 1;
      }
    });
  }

  /// Decrement of the value of the current celebration.
  void currentCelebrateDecrement(){
    resetCurrentCelebration = false;
    setState((){
      if (currentCelebrate == 0){
        currentCelebrate = numberOfCelebrations;
      } else {
        currentCelebrate = currentCelebrate - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double scaleFactor = widget.mainWidth / 375;
    return StreamBuilder<AppState>(
      initialData: widget.appController.currentAppState,
      stream: widget.appController.state,
      builder: (context, snapshot) {
        AppTheme theme = snapshot.data!.theme;
        Person person = snapshot.data!.userData;
        List<Celebrate> yearCelebrates = getSortedYearCelebrates(person.celebrates);
        List<Celebrate> monthCelebrates = getSortedMonthCelebrates(yearCelebrates);
        if (resetCurrentCelebration) {
          numberOfCelebrations = (isMonth)
            ? (numberOfMonthCelebrates - 1)
            : (numberOfYearCelebrates - 1);
          currentCelebrate = numberOfCelebrations;
        }
        return Scaffold(
          appBar: PlannerAppBar(
            callBack: (){},
            controller: widget.appController,
            child: Container(
              margin: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "События ближайшего ${_period()}", // ToDo Протестировать
                    style: TextStyle(
                      color: theme.appBarTextColor,
                      fontSize: 17,
                      fontFamily: 'Roboto'
                    ),
                  ),
                  Text(
                    'Группа “Natalya Bloom” (1/1)',//(${userNumber + 1}/${usersList.length})', // ToDo Имя группы должно меняться, а юзер пока один
                    style: TextStyle(
                      color: theme.appBarTextColor,
                      fontSize: 14,
                      fontFamily: 'Roboto'
                    ),
                  )
                ]
              )
            )
          ),
          body: Container(
            color: theme.mainColor,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container()
                ),
                /// Contact avatar line.
                Container(
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
                          padding: const EdgeInsets.only(left: 8, top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                person.userName,
                                style: TextStyle(
                                  color: theme.avatarText1Color,
                                  fontSize: 16,
                                  fontFamily: 'Roboto'
                                ),
                              ),
                              Text(
                                person.region,
                                style: TextStyle(
                                  color: theme.avatarText2Color,
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 34,
                                width: 34,
                                child: AnimatedButton(
                                  theme: theme,
                                  iconPath: leftArrowButtonIcon,
                                  onPressed: (){} //userNumberDown, // ToDo переписать, так как сейчас юзеры приходят не с сервера.
                                )
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              SizedBox(
                                height: 34,
                                width: 34,
                                child: AnimatedButton(
                                  theme: theme,
                                  iconPath: rightArrowButtonIcon,
                                  onPressed: (){} //userNumberUp, // ToDo переписать, так как сейчас юзеры приходят не с сервера.
                                )
                              ),
                            ],
                          ),
                          Center(
                            child: (
                              SizedBox(
                                height: 34,
                                width: 34,
                                child: AnimatedButton(
                                  theme: theme,
                                  iconPath: listButtonIcon,
                                  onPressed: (){setState(() {
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) {
                                          return CalendarScreen(
                                            widget.title,
                                            widget.appController
                                          );
                                        }
                                      )
                                    );
                                  });}
                                )
                              )
                            )
                          )
                        ]
                      )
                    ]
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container()
                ),
                /// Rectangular block with buttons and round clock face.
                SizedBox(
                  height: (widget.mainWidth + 45),
                  child: Stack(
                    children: <Widget>[
                      /// BackGround
                      Column(
                        children: [
                          Container(
                            height: 80,
                            color: theme.clockFaceMainColor,
                          ),
                          Expanded(
                            child: Container()
                          ),
                          Container(
                            height: (40 + (45 * scaleFactor)),
                            color: theme.clockFaceMainColor,
                            padding: const EdgeInsets.only(bottom: 0),
                          )
                        ]
                      ),
                      Center(
                        child: SizedBox(
                          width: (widget.mainWidth + 11),
                          height: (widget.mainWidth + 11),
                          child: OverflowBox(
                            maxWidth: (widget.mainWidth + 11),
                            child: ClipRRect(
                              borderRadius: BorderRadius
                                .circular((widget.mainWidth + 11) / 2),
                              child: Container(
                                color: theme.mainColor
                              )
                            )
                          )
                        )
                      ),
                      /// Clock face.
                      if (!isMonth)
                      Center(
                        child: SizedBox(
                          height: widget.mainWidth,
                          child: Transform.scale(
                            scale: scaleFactor, //scaleFactor,
                            child: YearCircularClockFace(
                              theme: theme,
                              celebrates: yearCelebrates,
                              currentCelebrate: currentCelebrate,
                              arrowCallback: _periodChange,
                              celebrateIconCallback: currentCelebrateChange,
                            )
                          )
                        )
                      ),
                      if (isMonth)
                      Center(
                        child: SizedBox(
                          height: widget.mainWidth,
                          child: Transform.scale(
                            scale: scaleFactor, //scaleFactor,
                            child: MonthCircularClockFace(
                              theme: theme,
                              celebrates: monthCelebrates,
                              currentCelebrate: currentCelebrate,
                              arrowCallback: _periodChange,
                              celebrateIconCallback: currentCelebrateChange,
                            )
                          )
                        )
                      ),
                      /// Left top button.
                      Container(
                        margin: const EdgeInsets.only(left: 12, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Добавить",
                              style: TextStyle(
                                color: theme.clockFaceButtonTextColor,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                height: 0.94
                              )
                            ),
                            Text(
                              "повод",
                              style: TextStyle(
                                color: theme.clockFaceButtonTextColor,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                height: 0.94
                              )
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              margin: const EdgeInsets.only(top: 5),
                              child: GradientAnimatedButtonWithGreenIcon(
                                theme: theme,
                                iconPath: addButtonIcon,
                                onPressed: (){setState(() {
                                  Navigator.push(
                                    context, MaterialPageRoute(
                                      builder: (context) {
                                        return CalendarScreen(
                                          widget.title,
                                          widget.appController
                                        );
                                      }
                                    )
                                  );
                                });}
                              )
                            )
                          ]
                        ),
                      ),
                      /// Right top button.
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.only(right: 12, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Добавить",
                                style: TextStyle(
                                  color: theme.clockFaceButtonTextColor,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  height: 0.94
                                )
                              ),
                              Text(
                                "контакт",
                                style: TextStyle(
                                  color: theme.clockFaceButtonTextColor,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  height: 0.94
                                )
                              ),
                              Container(
                                height: 35,
                                width: 35,
                                margin: const EdgeInsets.only(top: 5),
                                child: GradientAnimatedButtonWithGreenIcon(
                                  theme: theme,
                                  iconPath: addButtonIcon,
                                  onPressed: (){setState(() {
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) {
                                          return ContactListScreen(
                                            widget.title,
                                            widget.appController
                                          );
                                        }
                                      )
                                    );
                                  });}//10. При нажатии "Добавить контакт" идём на экран 2.6 - Экран "Мой список контактов"
                                )
                              )
                            ]
                          )
                        )
                      ),
                      /// Current celebration block.
                      Container(
                        padding: EdgeInsets.only(left: 10, top: (widget.mainWidth - 30)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: scaleFactor, //scaleFactor,
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                width: 45,
                                height: 45,
                                child: CelebrateWidget(
                                  theme: theme,
                                  celebrate: yearCelebrates[currentCelebrate],
                                  isCurrent: false,
                                  haveStatus: false,
                                  isForYear: false,
                                  mainCallback: (currentCelebrate){},
                                  indexOfCurrent: currentCelebrate,
                                  statusCallback: (){}
                                )
                              )
                            ),
                            Text(
                              yearCelebrates[currentCelebrate].date,
                              style: TextStyle(
                                color: theme.clockFaceCurrentCelebrateIconTextColor,
                                fontSize: 11,
                                fontFamily: 'Roboto'
                              )
                            ),
                            Text(
                              yearCelebrates[currentCelebrate].name,
                              style: TextStyle(
                                color: theme.appBarTextColor,
                                fontSize: 12,
                                fontFamily: 'Roboto'
                              ),
                            ),
                          ]
                        )
                      ),
                      /// Celebrate scrolling button.
                      OverflowBox(
                        maxHeight: (widget.mainWidth * 2),
                        child: Transform.rotate(
                          // Arcsin(The top padding of the buttons divided
                          // by two of the distances of those buttons
                          // from the center of the circle).
                          angle: (-math.acos(
                              (widget.mainWidth - 20 - (22.5 * scaleFactor))
                              / (widget.mainWidth + 75))
                          ),
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(top: (widget.mainWidth + 75)),
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  SizedBox(
                                    width: 117,
                                    child: Image.asset(
                                      theme.buttonBasePath,
                                      fit: BoxFit.fitWidth
                                    )
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 2, left: 1),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GradientAnimatedButtonWithGreenIcon(
                                          theme: theme,
                                          iconPath: leftArrowButtonIcon,
                                          onPressed: currentCelebrateIncrement
                                        ),
                                        Container(
                                          width: 19
                                        ),
                                        GradientAnimatedButtonWithGreenIcon(
                                          theme: theme,
                                          iconPath: rightArrowButtonIcon,
                                          onPressed: currentCelebrateDecrement
                                        )
                                      ]
                                    )
                                  )
                                ]
                              )
                            )
                          )
                        )
                      ),
                    ],
                  ),
                ),
                // ]
              // )
            // ),
            Expanded(
              flex: 1,
              child: Container(
                width: widget.mainWidth,
              )
            ),
            /// Groups line.
            Container(
              width: widget.mainWidth,
              height: 90,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  /// Family group button.
                  MyGroupButton(
                    callback: (){},
                    buttonColor: familyGroupButtonColor,
                    iconPath: 'assets/images/family_group_icon.svg',
                    // count: usersList[userNumber].peopleCount[0].toString(),
                    buttonName: 'Семья',
                    // date: usersList[userNumber].peopleDates[0],
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
                    // count: usersList[userNumber].peopleCount[1].toString(),
                    buttonName: 'Друзья',
                    // date: usersList[userNumber].peopleDates[1],
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
                    // count: usersList[userNumber].peopleCount[2].toString(),
                    buttonName: 'Близкие',
                    // date: usersList[userNumber].peopleDates[2],
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
                    // count: usersList[userNumber].peopleCount[3].toString(),
                    buttonName: 'Коллеги',
                    // date: usersList[userNumber].peopleDates[3],
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
                    // count: usersList[userNumber].peopleCount[4].toString(),
                    buttonName: 'Партнёры',
                    // date: usersList[userNumber].peopleDates[4],
                  )
                ]
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: widget.mainWidth,
              )
            ),
            /// navBar. // ToDo
            Container(
              width: widget.mainWidth,
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
  });
}}

class MyGroupButton extends StatelessWidget {
  final VoidCallback callback;
  final Color buttonColor;
  final String iconPath;
  // final String count;
  final String buttonName;
  // final String date;

  const MyGroupButton({
    required this.callback,
    required this.buttonColor,
    required this.iconPath,
    // required this.count,
    required this.buttonName,
    // required this.date,
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
                    // child: Text(
                    //   count,
                    //   style: const TextStyle(
                    //     color: croupButtonsTextColor,
                    //     fontSize: 13,
                    //     fontFamily: 'Roboto'
                    //   ),
                    // )
                  )
                ]
              )
          )
        ),
        Text(
          buttonName,
          style: TextStyle(
            color: mainWhiteColor,
            fontSize: 10,
            fontFamily: 'Roboto'
          ),
        ),
        // Text(
        //   date,
        //   style: const TextStyle(
        //     color: mainWhiteColor,
        //     fontSize: 10,
        //     fontFamily: 'Roboto'
        //   ),
        // )
      ]
    );
  }

}
