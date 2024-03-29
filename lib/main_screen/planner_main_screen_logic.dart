// import 'dart:math' as math;
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'package:flutter_svg/svg.dart';
//
// import 'package:site_xz/calendar_screen_view.dart';
// import 'package:site_xz/contact_list_view.dart';
// import 'package:site_xz/global/app_controller.dart';
// import 'package:site_xz/global/buttons.dart';
// import 'package:site_xz/global/nav_bar/nav_bar_controller.dart';
// import 'package:site_xz/global/nav_bar/nav_bar_widget.dart';
// import 'package:site_xz/global/paths.dart';
// import 'package:site_xz/global/person_class.dart';
// import 'package:site_xz/global/planner_app_bar.dart';
// import 'package:site_xz/global/theme.dart';
// import 'package:site_xz/main_screen/celebrate_widget.dart';
// import 'package:site_xz/main_screen/month_circular_face/month_circular_face_view.dart';
// import 'package:site_xz/main_screen/year_circular_face/year_circular_face_view.dart';
//
// /// The main window of the application.
//
// class MainPlannerLogic{
//   static const route = '/planner';
//
//   final String title;
//   final double mainWidth;
//   final AppController appController;
//
//   int userNumber = 0;  // ToDo логику работы с юзерами придётся переписать.
//   String avatarImagePath = "assets/images/avatar.png";  // ToDo аватар должен грузиться с сервера.
//   bool isMonth = false;
//   // int currentYearCelebrate = 0;
//   // int currentMonthCelebrate = 0;
//   int currentCelebrate = 0;
//   int numberOfCelebrations = 0;
//   int numberOfYearCelebrates = 0;
//   int numberOfMonthCelebrates = 0;
//   bool resetCurrentCelebration = true;
//   List<bool> selectedGroups = [true, false, false, false, false]; //ToDo
//   final int _currentDay = DateTime.now().day;
//   final int _currentMonth = DateTime.now().month;
//   final int _currentYear = DateTime.now().year; //ToDo
//
//   /// Constructor.
//   MainPlannerLogic(
//     this.title,
//     this.mainWidth,
//     this.appController,
//   );
//
//
//   String _period(){
//     return isMonth? 'месяца' : 'года';
//   }
//
//   /// Changes the calendar mode between monthly and yearly.
//   void _periodChange(){
//     resetCurrentCelebration = true;
//     isMonth = !isMonth;
//
//     // ToDo
//     selectedGroups[0] = true;
//     selectedGroups[1] = !selectedGroups[1];
//     selectedGroups[2] = !selectedGroups[2];
//     selectedGroups[3] = !selectedGroups[3];
//     selectedGroups[4] = !selectedGroups[4];
//
//     setState((){});
//   }
//
//   void userNumberDown(){// todo проверить не надо ли будет переписать.
//     // if (userNumber > 0) {
//     //   userNumber = userNumber - 1;
//     // } else {
//     //   userNumber = usersList.length - 1;
//     // }
//     // setState((){});
//   }
//
//   void userNumberUp(){// todo проверить не надо ли будет переписать.
//     // if (userNumber < usersList.length - 1) {
//     //   userNumber = userNumber + 1;
//     // } else {
//     //   userNumber = 0;
//     // }
//     // setState((){});
//   }
//
//   /// Sorts holidays by date starting with the current and the next 365 (in a leap year - 366) days.
//   // There is a very big O(n) here because sorting by dates is needed
//   // and I didn't come up with anything better :/
//   List<Celebrate> getSortedYearCelebrates(List<Celebrate> celebrates) {
//     List<Celebrate> result = [];
//     for (int l = 31; l > _currentDay; l--) {
//       for (Celebrate celebrate in celebrates) {
//         if (
//         (celebrate.month == _currentMonth) &&
//             (celebrate.day == l) &&
//             isSelectedCelebrate(celebrate)
//         ) {
//           result.add(celebrate);
//           break;
//         }
//       }
//     }
//     for (int l = _currentDay; l > 0; l--) {
//       for (Celebrate celebrate in celebrates) {
//         if (
//         (celebrate.month == _currentMonth) &&
//             (celebrate.day == l) &&
//             isSelectedCelebrate(celebrate)
//         ) {
//           result.add(celebrate);
//           break;
//         }
//       }
//     }
//     for (int i = (_currentMonth - 1); i > 0; i--) {
//       for (int l = 31; l > 0; l--) {
//         for (Celebrate celebrate in celebrates) {
//           if (
//           (celebrate.month == i) &&
//               (celebrate.day == l) &&
//               isSelectedCelebrate(celebrate)
//           ) {
//             result.add(celebrate);
//             break;
//           }
//         }
//       }
//     }
//     for (int i = 12; i > _currentMonth; i--) {
//       for (int l = 31; l > 0; l--) {
//         for (Celebrate celebrate in celebrates) {
//           if (
//           (celebrate.month == i) &&
//               (celebrate.day == l) &&
//               isSelectedCelebrate(celebrate)
//           ) {
//             result.add(celebrate);
//             break;
//           }
//         }
//       }
//     }
//     numberOfYearCelebrates = result.length;
//     return result;
//   }
//
//   bool isSelectedCelebrate(Celebrate celebrate){ // ToDo Добавить праздники для других категорий
//     if (selectedGroups[0] && celebrate.peopleCategory.contains(1)){
//       return true;
//     }
//     if (selectedGroups[1] && celebrate.peopleCategory.contains(2)){
//       return true;
//     }
//     if (selectedGroups[2] && celebrate.peopleCategory.contains(3)){
//       return true;
//     }
//     if (selectedGroups[3] && celebrate.peopleCategory.contains(4)){
//       return true;
//     }
//     if (selectedGroups[4] && celebrate.peopleCategory.contains(5)){
//       return true;
//     }
//     if (celebrate.peopleCategory.contains(6) && isMonth){
//       return true;
//     }
//     return false;
//   }
//
//   /// Returns from the list of all celebrations only those celebrations
//   /// that should be displayed on the current screen.
//   List<Celebrate> getSortedMonthCelebrates(List<Celebrate> celebrates){
//     List<Celebrate> result = [];
//     for(Celebrate celebrate in celebrates){
//       if(celebrate.month == _currentMonth && celebrate.day >= _currentDay) {
//         result.add(celebrate);
//       }
//       if(celebrate.month == (_currentMonth + 1) && celebrate.day < _currentDay) {
//         result.add(celebrate);
//       }
//     }
//     numberOfMonthCelebrates = result.length;
//     return result;
//   }
//
//   /// Changes the index of the current holiday to the selected one.
//   void currentCelebrateChange(int newIndex){
//     resetCurrentCelebration = false;
//     setState(() {
//       currentCelebrate = newIndex;
//     });
//   }
//
//   /// Increment value of the current celebration.
//   void currentCelebrateIncrement(){
//     resetCurrentCelebration = false;
//     setState((){
//       if (currentCelebrate == numberOfCelebrations){
//         currentCelebrate = 0;
//       } else {
//         currentCelebrate = currentCelebrate + 1;
//       }
//     });
//   }
//
//   /// Decrement of the value of the current celebration.
//   void currentCelebrateDecrement(){
//     resetCurrentCelebration = false;
//     setState((){
//       if (currentCelebrate == 0){
//         currentCelebrate = numberOfCelebrations;
//       } else {
//         currentCelebrate = currentCelebrate - 1;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double scaleFactor = widget.mainWidth / 375;
//     return DefaultBottomBarController(
//         child: StreamBuilder<AppState>(
//             initialData: widget.appController.currentAppState,
//             stream: widget.appController.state,
//             builder: (context, snapshot) {
//               AppTheme theme = snapshot.data!.theme;
//               Person person = snapshot.data!.userData;
//               List<Celebrate> yearCelebrates = getSortedYearCelebrates(person.celebrates);
//               List<Celebrate> monthCelebrates = getSortedMonthCelebrates(yearCelebrates);
//               List<Celebrate> celebrates = (isMonth)? monthCelebrates : yearCelebrates;
//               if (resetCurrentCelebration) {
//                 numberOfCelebrations = (isMonth)
//                     ? (numberOfMonthCelebrates - 1)
//                     : (numberOfYearCelebrates - 1);
//                 currentCelebrate = numberOfCelebrations;
//               }
//               return Scaffold(
//                 appBar: PlannerAppBar(
//                     callBack: (){},
//                     controller: widget.appController,
//                     child: Container(
//                         margin: const EdgeInsets.only(top: 4),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "События ближайшего ${_period()}", // ToDo Протестировать
//                                 style: TextStyle(
//                                     color: theme.appBarTextColor,
//                                     fontSize: 17,
//                                     fontFamily: 'Roboto'
//                                 ),
//                               ),
//                               Text(
//                                 'Группа “Natalya Bloom” (1/1)',//(${userNumber + 1}/${usersList.length})', // ToDo Имя группы должно меняться, а юзер пока один
//                                 style: TextStyle(
//                                     color: theme.appBarTextColor,
//                                     fontSize: 14,
//                                     fontFamily: 'Roboto'
//                                 ),
//                               )
//                             ]
//                         )
//                     )
//                 ),
//                 body: Container(
//                     color: theme.mainColor,
//                     child: Column(
//                         children: <Widget>[
//                           /// Separator line.
//                           Expanded(
//                               flex: 1,
//                               child: Container()
//                           ),
//                           /// Contact avatar line.
//                           Container(
//                               height: 72,
//                               margin: const EdgeInsets.only(left: 16, right: 16),
//                               color: theme.mainColor,
//                               child: Row(
//                                   children: [
//                                     /// Avatar.
//                                     SizedBox(
//                                         height: 54,
//                                         width: 54,
//                                         child: ClipRRect(
//                                             borderRadius: BorderRadius.circular(27),
//                                             child: Image.asset(
//                                               // ToDo Аватар должен браться с сервера
//                                               "assets/images/avatar.png",//avatarImagePath = usersList[userNumber].avatarImagePath,
//                                               fit:BoxFit.fitHeight,
//                                             )
//                                         )
//                                     ),
//                                     /// Name and address.
//                                     Expanded(
//                                         child: Container(
//                                             padding: const EdgeInsets.only(left: 8, top: 16),
//                                             child: Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     person.userName,
//                                                     style: TextStyle(
//                                                         color: theme.avatarText1Color,
//                                                         fontSize: 16,
//                                                         fontFamily: 'Roboto'
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     person.region,
//                                                     style: TextStyle(
//                                                         color: theme.avatarText2Color,
//                                                         fontSize: 14,
//                                                         fontFamily: 'Roboto'
//                                                     ),
//                                                   )
//                                                 ]
//                                             )
//                                         )
//                                     ),
//                                     /// List buttons.
//                                     Column(
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.end,
//                                             children: [
//                                               SizedBox(
//                                                   height: 34,
//                                                   width: 34,
//                                                   child: AnimatedButton(
//                                                       theme: theme,
//                                                       iconPath: leftArrowButtonIcon,
//                                                       onPressed: (){} //userNumberDown, // ToDo переписать, так как сейчас юзеры приходят не с сервера.
//                                                   )
//                                               ),
//                                               const SizedBox(
//                                                 width: 2,
//                                               ),
//                                               SizedBox(
//                                                   height: 34,
//                                                   width: 34,
//                                                   child: AnimatedButton(
//                                                       theme: theme,
//                                                       iconPath: rightArrowButtonIcon,
//                                                       onPressed: (){} //userNumberUp, // ToDo переписать, так как сейчас юзеры приходят не с сервера.
//                                                   )
//                                               ),
//                                             ],
//                                           ),
//                                           Center(
//                                               child: (
//                                                   SizedBox(
//                                                       height: 34,
//                                                       width: 34,
//                                                       child: AnimatedButton(
//                                                           theme: theme,
//                                                           iconPath: listButtonIcon,
//                                                           onPressed: (){setState(() {
//                                                             Navigator.push(
//                                                                 context, MaterialPageRoute(
//                                                                 builder: (context) {
//                                                                   return CalendarScreen(
//                                                                       widget.title,
//                                                                       widget.appController
//                                                                   );
//                                                                 }
//                                                             )
//                                                             );
//                                                           });}
//                                                       )
//                                                   )
//                                               )
//                                           )
//                                         ]
//                                     )
//                                   ]
//                               )
//                           ),
//                           /// Separator line.
//                           Expanded(
//                               flex: 1,
//                               child: Container()
//                           ),
//                           /// Rectangular block with buttons and round clock face.
//                           SizedBox(
//                             height: (widget.mainWidth + 45),
//                             child: Stack(
//                               children: <Widget>[
//                                 /// BackGround
//                                 Column(
//                                     children: [
//                                       Container(
//                                         height: 80,
//                                         color: theme.clockFaceMainColor,
//                                       ),
//                                       Expanded(
//                                           child: Container()
//                                       ),
//                                       Container(
//                                         height: (40 + (45 * scaleFactor)),
//                                         color: theme.clockFaceMainColor,
//                                         padding: const EdgeInsets.only(bottom: 0),
//                                       )
//                                     ]
//                                 ),
//                                 Center(
//                                     child: SizedBox(
//                                         width: (widget.mainWidth),
//                                         height: (widget.mainWidth),
//                                         child: OverflowBox(
//                                             maxWidth: (widget.mainWidth),
//                                             child: ClipRRect(
//                                                 borderRadius: BorderRadius
//                                                     .circular((widget.mainWidth) / 2),
//                                                 child: Container(
//                                                     color: theme.mainColor
//                                                 )
//                                             )
//                                         )
//                                     )
//                                 ),
//                                 /// Clock face.
//                                 if (!isMonth)
//                                   Center(
//                                       child: SizedBox(
//                                           height: widget.mainWidth,
//                                           child: Transform.scale(
//                                               scale: scaleFactor, //scaleFactor,
//                                               child: YearCircularClockFace(
//                                                 theme: theme,
//                                                 celebrates: yearCelebrates,
//                                                 currentCelebrate: currentCelebrate,
//                                                 arrowCallback: _periodChange,
//                                                 celebrateIconCallback: currentCelebrateChange,
//                                               )
//                                           )
//                                       )
//                                   ),
//                                 if (isMonth)
//                                   Center(
//                                       child: SizedBox(
//                                           height: widget.mainWidth,
//                                           child: Transform.scale(
//                                               scale: scaleFactor, //scaleFactor,
//                                               child: MonthCircularClockFace(
//                                                 theme: theme,
//                                                 celebrates: monthCelebrates,
//                                                 currentCelebrate: currentCelebrate,
//                                                 arrowCallback: _periodChange,
//                                                 celebrateIconCallback: currentCelebrateChange,
//                                               )
//                                           )
//                                       )
//                                   ),
//                                 /// Left top button.
//                                 Container(
//                                   margin: const EdgeInsets.only(left: 12, top: 10),
//                                   child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                             "Добавить",
//                                             style: TextStyle(
//                                                 color: theme.clockFaceButtonTextColor,
//                                                 fontSize: 12,
//                                                 fontFamily: 'Roboto',
//                                                 height: 0.94
//                                             )
//                                         ),
//                                         Text(
//                                             "повод",
//                                             style: TextStyle(
//                                                 color: theme.clockFaceButtonTextColor,
//                                                 fontSize: 12,
//                                                 fontFamily: 'Roboto',
//                                                 height: 0.94
//                                             )
//                                         ),
//                                         Container(
//                                             height: 35,
//                                             width: 35,
//                                             margin: const EdgeInsets.only(top: 5),
//                                             child: GradientAnimatedButtonWithGreenIcon(
//                                                 theme: theme,
//                                                 iconPath: addButtonIcon,
//                                                 onPressed: (){setState(() {
//                                                   Navigator.push(
//                                                       context, MaterialPageRoute(
//                                                       builder: (context) {
//                                                         return CalendarScreen(
//                                                             widget.title,
//                                                             widget.appController
//                                                         );
//                                                       }
//                                                   )
//                                                   );
//                                                 });}
//                                             )
//                                         )
//                                       ]
//                                   ),
//                                 ),
//                                 /// Right top button.
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Container(
//                                         padding: const EdgeInsets.only(right: 12, top: 10),
//                                         child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.end,
//                                             children: [
//                                               Text(
//                                                   "Добавить",
//                                                   style: TextStyle(
//                                                       color: theme.clockFaceButtonTextColor,
//                                                       fontSize: 12,
//                                                       fontFamily: 'Roboto',
//                                                       height: 0.94
//                                                   )
//                                               ),
//                                               Text(
//                                                   "контакт",
//                                                   style: TextStyle(
//                                                       color: theme.clockFaceButtonTextColor,
//                                                       fontSize: 12,
//                                                       fontFamily: 'Roboto',
//                                                       height: 0.94
//                                                   )
//                                               ),
//                                               Container(
//                                                   height: 35,
//                                                   width: 35,
//                                                   margin: const EdgeInsets.only(top: 5),
//                                                   child: GradientAnimatedButtonWithGreenIcon(
//                                                       theme: theme,
//                                                       iconPath: addButtonIcon,
//                                                       onPressed: (){setState(() {
//                                                         Navigator.push(
//                                                             context, MaterialPageRoute(
//                                                             builder: (context) {
//                                                               return ContactListScreen(
//                                                                   widget.title,
//                                                                   widget.appController
//                                                               );
//                                                             }
//                                                         )
//                                                         );
//                                                       });}//10. При нажатии "Добавить контакт" идём на экран 2.6 - Экран "Мой список контактов"
//                                                   )
//                                               )
//                                             ]
//                                         )
//                                     )
//                                 ),
//                                 /// Current celebration block.
//                                 Container(
//                                     padding: EdgeInsets.only(left: 10, top: (widget.mainWidth - 30)),
//                                     child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Transform.scale(
//                                               scale: scaleFactor, //scaleFactor,
//                                               alignment: Alignment.bottomLeft,
//                                               child: SizedBox(
//                                                   width: 50,
//                                                   height: 58,
//                                                   child: CelebrateWidget(
//                                                       theme: theme,
//                                                       celebrate: celebrates[currentCelebrate],
//                                                       isCurrent: true,
//                                                       haveStatus: false,
//                                                       isForYear: true,
//                                                       mainCallback: (currentCelebrate){},
//                                                       indexOfCurrent: currentCelebrate,
//                                                       statusCallback: (){}
//                                                   )
//                                               )
//                                           ),
//                                           // Text(
//                                           //   celebrates[currentCelebrate].date,
//                                           //   style: TextStyle(
//                                           //     color: theme.clockFaceCurrentCelebrateIconTextColor,
//                                           //     fontSize: 11,
//                                           //     fontFamily: 'Roboto'
//                                           //   )
//                                           // ),
//                                           Text(
//                                             celebrates[currentCelebrate].name,
//                                             style: TextStyle(
//                                                 color: theme.appBarTextColor,
//                                                 fontSize: 12,
//                                                 fontFamily: 'Roboto'
//                                             ),
//                                           ),
//                                         ]
//                                     )
//                                 ),
//                                 /// Celebrate scrolling button.
//                                 OverflowBox(
//                                     maxHeight: (widget.mainWidth * 2),
//                                     child: Transform.rotate(
//                                       // ArcCos(The top padding of the buttons divided
//                                       // by two of the distances of those buttons
//                                       // from the center of the circle).
//                                         angle: (-math.acos(
//                                             (widget.mainWidth - 20 - (22.5 * scaleFactor))
//                                                 / (widget.mainWidth + 75))
//                                         ),
//                                         child: Center(
//                                             child: Container(
//                                                 margin: EdgeInsets.only(top: (widget.mainWidth + 75)),
//                                                 child: Stack(
//                                                     alignment: AlignmentDirectional.center,
//                                                     children: [
//                                                       SizedBox(
//                                                           width: 117,
//                                                           child: Image.asset(
//                                                               theme.buttonBasePath,
//                                                               fit: BoxFit.fitWidth
//                                                           )
//                                                       ),
//                                                       Container(
//                                                           padding: const EdgeInsets.only(bottom: 2, left: 1),
//                                                           child: Row(
//                                                               mainAxisAlignment: MainAxisAlignment.center,
//                                                               children: [
//                                                                 GradientAnimatedButtonWithGreenIcon(
//                                                                     theme: theme,
//                                                                     iconPath: leftArrowButtonIcon,
//                                                                     onPressed: currentCelebrateDecrement
//                                                                 ),
//                                                                 Container(
//                                                                     width: 19
//                                                                 ),
//                                                                 GradientAnimatedButtonWithGreenIcon(
//                                                                     theme: theme,
//                                                                     iconPath: rightArrowButtonIcon,
//                                                                     onPressed: currentCelebrateIncrement
//                                                                 )
//                                                               ]
//                                                           )
//                                                       )
//                                                     ]
//                                                 )
//                                             )
//                                         )
//                                     )
//                                 ),
//                               ],
//                             ),
//                           ),
//                           /// Separator line.
//                           Expanded(
//                               flex: 1,
//                               child: Container(
//                                 width: widget.mainWidth,
//                               )
//                           ),
//                           /// Groups line.
//                           Container(
//                               width: widget.mainWidth,
//                               height: 90,
//                               margin: const EdgeInsets.only(left: 16, right: 16),
//                               child: Row(
//                                   children: [
//                                     /// Family group button.
//                                     MyGroupButton(
//                                       isPressed: selectedGroups[0],
//                                       theme: theme,
//                                       callback: (){setState(() {
//                                         selectedGroups[0] = !selectedGroups[0];
//                                       });},
//                                       buttonColor: theme.familyGroupButtonColor,
//                                       iconPath: 'assets/images/family_group_icon.svg', // ToDo
//                                       count: person.peopleCount[0].toString(),
//                                       buttonName: 'Семья',
//                                       date: person.peopleDates[0],
//                                     ),
//                                     /// Separator.
//                                     Expanded(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 90,
//                                       ),
//                                     ),
//                                     /// Friends group button.
//                                     MyGroupButton(
//                                       isPressed: selectedGroups[1],
//                                       theme: theme,
//                                       callback: (){setState(() {
//                                         selectedGroups[1] = !selectedGroups[1];
//                                       });},
//                                       buttonColor: theme.friendsGroupButtonColor,
//                                       iconPath: 'assets/images/friends_group_icon.svg', // ToDo
//                                       count: person.peopleCount[1].toString(),
//                                       buttonName: 'Друзья',
//                                       date: person.peopleDates[1],
//                                     ),
//                                     /// Separator.
//                                     Expanded(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 90,
//                                       ),
//                                     ),
//                                     /// Relatives group button.
//                                     MyGroupButton(
//                                       isPressed: selectedGroups[2],
//                                       theme: theme,
//                                       callback: (){setState(() {
//                                         selectedGroups[2] = !selectedGroups[2];
//                                       });},
//                                       buttonColor: theme.relativesGroupButtonColor,
//                                       iconPath: 'assets/images/relatives_group_icon.svg', // ToDo
//                                       count: person.peopleCount[2].toString(),
//                                       buttonName: 'Близкие',
//                                       date: person.peopleDates[2],
//                                     ),
//                                     /// Separator.
//                                     Expanded(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 90,
//                                       ),
//                                     ),
//                                     /// Colleagues group button.
//                                     MyGroupButton(
//                                       isPressed: selectedGroups[3],
//                                       theme: theme,
//                                       callback: (){setState(() {
//                                         selectedGroups[3] = !selectedGroups[3];
//                                       });},
//                                       buttonColor: theme.colleaguesGroupButtonColor,
//                                       iconPath: 'assets/images/colleagues_group_icon.svg', // ToDo
//                                       count: person.peopleCount[3].toString(),
//                                       buttonName: 'Коллеги',
//                                       date: person.peopleDates[3],
//                                     ),
//                                     /// Separator.
//                                     Expanded(
//                                       flex: 1,
//                                       child: Container(
//                                         height: 90,
//                                       ),
//                                     ),
//                                     /// Partners group button.
//                                     MyGroupButton(
//                                       isPressed: selectedGroups[4],
//                                       theme: theme,
//                                       callback: (){setState(() {
//                                         selectedGroups[4] = !selectedGroups[4];
//                                       });},
//                                       buttonColor: theme.partnersGroupButtonColor,
//                                       iconPath: 'assets/images/partners_group_icon.svg', // ToDo
//                                       count: person.peopleCount[4].toString(),
//                                       buttonName: 'Партнёры',
//                                       date:person.peopleDates[4],
//                                     )
//                                   ]
//                               )
//                           ),
//                           /// Separator line.
//                           Expanded(
//                               flex: 1,
//                               child: Container(
//                                 width: widget.mainWidth,
//                               )
//                           ),
//                           /// navBar. // ToDo
//                           //     Container(
//                           //       width: widget.mainWidth,
//                           //       padding: const EdgeInsets.all(0.0),
//                           //       margin: const EdgeInsets.all(0.0),
//                           //       color: theme.appBarColor,
//                           //       child: Row(
//                           //         children: [
//                           //           /// Separator.
//                           //           Expanded(
//                           //             flex: 1,
//                           //             child: Container(),
//                           //           ),
//                           //           /// First nav button.
//                           //           MyNavBarButton(
//                           //             theme: theme,
//                           //             callback: (){},
//                           //             iconPath: 'assets/images/1.1.svg', // ToDo
//                           //             iconColor: theme.mainGreenColor,
//                           //           ),
//                           //           /// Separator.
//                           //           Expanded(
//                           //             flex: 1,
//                           //             child: Container(),
//                           //           ),
//                           //           /// Second nav button.
//                           //           MyNavBarButton(
//                           //             theme: theme,
//                           //             callback: (){},
//                           //             iconPath: 'assets/images/1.2.svg', // ToDo
//                           //             iconColor: theme.celebrateTextColor // ToDo
//                           //           ),
//                           //           /// Separator.
//                           //           Expanded(
//                           //             flex: 1,
//                           //             child: Container(),
//                           //           ),
//                           //           /// Central nav button. // ToDo
//                           //           CentralNavBarButton(
//                           //             theme: theme,
//                           //             callback: (){},
//                           //             iconPath: 'assets/images/1.3.svg', // ToDo
//                           //             iconColor: theme.celebrateTextColor // ToDo
//                           //           ),
//                           //           /// Separator.
//                           //           Expanded(
//                           //             flex: 1,
//                           //             child: Container(),
//                           //           ),
//                           //           /// Fourth nav button.
//                           //           MyNavBarButton(
//                           //             theme: theme,
//                           //             callback: (){},
//                           //             iconPath: 'assets/images/1.4.svg', // ToDo
//                           //             iconColor: theme.celebrateTextColor // ToDo
//                           //           ),
//                           //           /// Separator.
//                           //           Expanded(
//                           //             flex: 1,
//                           //             child: Container(),
//                           //           ),
//                           //           /// Fifth nav button.
//                           //           MyNavBarButton(
//                           //             theme: theme,
//                           //             callback: (){},
//                           //             iconPath: 'assets/images/1.5.svg', // ToDo
//                           //             iconColor: theme.celebrateTextColor // ToDo
//                           //           ),
//                           //           /// Separator.
//                           //           Expanded(
//                           //             flex: 1,
//                           //             child: Container(),
//                           //           )
//                           //         ]
//                           //     )
//                           // ),
//                         ]
//                     )
//                 ),
//
//                 /// NavBar
//                 // Lets use docked FAB for handling state of sheet
//                 floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//                 floatingActionButton: GestureDetector(
//                   //
//                   // Set onVerticalDrag event to drag handlers of controller for swipe effect
//                   onVerticalDragUpdate: DefaultBottomBarController.of(context).onDrag,
//                   onVerticalDragEnd: DefaultBottomBarController.of(context).onDragEnd,
//                   child: FloatingActionButton.extended(
//                     label: AnimatedBuilder(
//                       animation: DefaultBottomBarController.of(context).state,
//                       builder: (context, child) => Row(
//                         children: [
//                           Text(
//                             DefaultBottomBarController.of(context).isOpen
//                                 ? "Pull"
//                                 : "Pull",
//                           ),
//                           const SizedBox(width: 4.0),
//                           AnimatedBuilder(
//                             animation: DefaultBottomBarController.of(context).state,
//                             builder: (context, child) => Transform(
//                               alignment: Alignment.center,
//                               transform: Matrix4.diagonal3Values(
//                                 1,
//                                 DefaultBottomBarController.of(context).state.value * 2 -
//                                     1,
//                                 1,
//                               ),
//                               child: child,
//                             ),
//                             child: RotatedBox(
//                               quarterTurns: 1,
//                               child: Icon(
//                                 Icons.chevron_right,
//                                 size: 20,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     elevation: 2,
//                     backgroundColor: Colors.deepOrange,
//                     foregroundColor: Colors.white,
//                     //
//                     //Set onPressed event to swap state of bottom bar
//                     onPressed: () => DefaultBottomBarController.of(context).swap(),
//                   ),
//                 ),
//                 //
//                 // Actual expandable bottom bar
//                 bottomNavigationBar: BottomExpandableAppBar(
//                   horizontalMargin: 16,
//                   shape: AutomaticNotchedShape(
//                       RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
//                   expandedBackColor: Theme.of(context).backgroundColor,
//                   expandedBody: Center(
//                     child: Text("Hello world!"),
//                   ),
//                   bottomAppBarBody: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: <Widget>[
//                         Expanded(
//                           child: Text(
//                             "Foo",
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         Spacer(
//                           flex: 2,
//                         ),
//                         Expanded(
//                           child: Text(
//                             "Bar",
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//               );
//             }));
//   }}
//
//
