import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/celebrate_choice_screen_view.dart';
import 'package:site_xz/detail_contact_screen_view.dart';

import 'package:site_xz/global/app_controller.dart';
import 'package:site_xz/global/buttons.dart';
import 'package:site_xz/global/paths.dart';
import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/global/planner_app_bar.dart';
import 'package:site_xz/global/provider.dart';
import 'package:site_xz/global/theme.dart';
// import 'package:site_xz/contact_line_widget.dart';
import 'package:site_xz/add_contact_screen_view.dart';
import 'package:site_xz/edit_contact_screen_view.dart';
import 'package:site_xz/main_screen/planner_main_screen_view.dart';

class CalendarScreen extends StatefulWidget {
  static const route = '/holiday';

  final String title;
  final String token;
  final double mainWidth;
  final AppController appController;
  final List celebrations;
  final AppTheme theme;

  final List<String> categories = [
    "Семейные и детские праздники", //2
    "Важные семейные события", //3
    "Событие блогера или стримера", //1
    "Групповые и коллективные праздники",
    "Профессиональный или труовой праздник", //5
    "Студенческие и молодежные праздники", //8
    "Государственные праздники", //7
    "Религиозные праздники", //6
    "Дни воинской славы и памятные даты", //4
  ];

  CalendarScreen(
    this.title,
    this.token,
    this.mainWidth,
    this.appController,
    this.celebrations,
    this.theme,
    {Key? key}
  ) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();

}

class _CalendarScreenState extends State<CalendarScreen> {

  final ScrollController _scrollControllerCelebratesBlock = ScrollController();
  final ScrollController _scrollControllerCategoriesBlock = ScrollController();

  _CalendarScreenState();

  Future<void> openCelebrationChoiceScreen(AppTheme theme, int id)async{

    List<ShortCelebrate> celebrationsList = await widget.appController.getCelebrationName(token: widget.token, id: id);

    setState(() {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) {
            return CelebrateChoiceScreen(
              "Праздиник или событие",
              id,
              widget.categories[id],
              widget.token,
                // widget.mainWidth,
              widget.appController,
              celebrationsList,
              theme
            );
          }
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppState>(
      initialData: widget.appController.currentAppState,
      stream: widget.appController.state,
      builder: (context, snapshot) {
        AppTheme theme = snapshot.data!.theme;
        Person person = snapshot.data!.userData;
        print ("прпарывр ${widget.celebrations}");
        return Scaffold(
          appBar: PlannerAppBar(
            callBack: (){Navigator.pop(context);},
            controller: widget.appController,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Календарь праздников",
                style: TextStyle(
                  color: theme.appBarTextColor,
                  fontSize: 17,
                  fontFamily: 'Roboto'
                ),
              ),
            )
          ),
          body: Container(
            color: theme.mainColor,
            child: Column(
              children: <Widget>[
                /// Separator line.
                const SizedBox(
                  height: 5
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
                                  iconPath: clockButtonIcon,
                                  onPressed: (){
                                    Navigator.push(
                                        context, MaterialPageRoute(
                                        builder: (context) {
                                          return MainPlannerScreen(widget.title, widget.mainWidth, widget.appController, widget.token);
                                          // return MokScreen(widget.title, widget.mainWidth, appController, token);
                                        }
                                    )
                                    );
                                  }
                                )
                              )
                            )
                          )
                        ]
                      )
                    ]
                  )
                ),
                /// Separator line.
                SizedBox(
                  height: 5
                ),
                /// Celebrates block.
                SizedBox(
                  height: 280,
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    controller: _scrollControllerCelebratesBlock,
                    child: ListView.builder(
                      controller: _scrollControllerCelebratesBlock,
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.celebrations.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CelebrateRowWidget(
                          theme: widget.theme,
                          celebrate: widget.celebrations[index],
                          index: index
                        );
                      }
                    )
                  )
                ),
                /// Separator line.
                const SizedBox(
                  height: 5
                ),
                /// Categories block.
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16),
                  child: const Text(
                    "Добавить праздник",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xFF161A1D),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600
                    )
                  )
                ),
                SizedBox(
                  height: 280,
                  child: Scrollbar(thumbVisibility: true,
                    trackVisibility: true,
                    controller: _scrollControllerCategoriesBlock,
                    child: ListView.builder(
                      controller: _scrollControllerCategoriesBlock,
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryRowWidget(
                          index: index,
                          name: widget.categories[index],
                          theme: theme,
                          callback: () {
                            openCelebrationChoiceScreen(theme, index);
                          },
                        );
                      }
                    )
                  )
                ),
                /// Separator line.
                const Expanded(
                  flex: 1,
                  child: SizedBox(width: 1,)
                ),
                /// navBar. // ToDo
              ]
            )
          )
        );
      }
    );
  }
}

class CelebrateRowWidget extends StatelessWidget {
  final AppTheme theme;
  final Celebrate celebrate;
  final int index;

  late double fontSize;

  CelebrateRowWidget({
    required this.theme,
    required this.celebrate,
    required this.index,
    Key? key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (index % 2 == 0)?
        const Color(0xFFFAFFFF):
        const Color(0xFF64BCEE).withOpacity(0.0),
      child: Row(
        children: <Widget> [
          const SizedBox(
            width: 16,
            height: 70,
          ),
          Stack(
            children: <Widget> [
              SizedBox(
                width: 54,
                height: 54,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: <Widget>[
                      Row(
                        children: background([1, 2, 3, 4, 5], theme)
                      ),
                      Image.asset(
                        "$celebratesIconsPath/${celebrate.icon}.png",
                        fit: BoxFit.contain,
                        color: theme.mainWhiteColor,
                      )
                    ]
                  )
                )
              ),
              Center(
                child: Container(
                  width: 49,
                  height: 49,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.withOpacity(0.0),// buttonColor,
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),//.withOpacity(0.1),//buttonColor,
                        blurRadius: 2,
                        spreadRadius: 3,
                        offset: const Offset(0, 0)
                      ),
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                  )
                )
              )
            ]
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text(
                celebrate.name,
                style: const TextStyle(
                  color: Color(0xFF414E58),
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600
                )
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: <Widget> [
                  Container(
                    height: 34,
                    width: 121,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFFE6F1FE),
                        width: 1,
                      ),
                      color: const Color(0xFFFAFFFF)
                    ),
                    child: Row(
                      children: <Widget> [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          celebrate.date,
                          style: const TextStyle(
                            color: Color(0xFFA6ADB5),
                            fontSize: 14,
                            fontFamily: 'Roboto'
                          )
                        ),
                        const Expanded(
                          child: SizedBox(height: 1)
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: AnimatedButton(
                            theme: theme,
                            iconPath: menuButtonIcon,
                            onPressed: (){} //userNumberDown, // ToDo переписать, так как сейчас юзеры приходят не с сервера.
                          )
                        ),
                        const SizedBox(
                          width: 5,
                        )
                      ]
                    )
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 34,
                    width: 121,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFFE6F1FE),
                        width: 1,
                      ),
                      color: const Color(0xFFFAFFFF)
                    ),
                    child: Row(
                      children: <Widget> [
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 16,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: theme.familyGroupButtonColor,
                            //friendsGroupButtonColor
                            //relativesGroupButtonColor
                            //colleaguesGroupButtonColor
                            //partnersGroupButtonColor
                          ),
                          child: const Text(
                            "С", // ДБКП
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontFamily: 'Roboto'
                            )
                          )
                        ),
                        const Expanded(
                          child: SizedBox(height: 1)
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 16,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: theme.friendsGroupButtonColor
                            //relativesGroupButtonColor
                            //colleaguesGroupButtonColor
                            //partnersGroupButtonColor
                          ),
                          child: const Text(
                            "Д", // БКП
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontFamily: 'Roboto'
                            )
                          )
                        ),
                        const Expanded(
                          child: SizedBox(height: 1)
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 16,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: relativesGroupButtonColor
                            //colleaguesGroupButtonColor
                            //partnersGroupButtonColor
                          ),
                          child: const Text(
                            "Б", // БКП
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontFamily: 'Roboto'
                            )
                          )
                        ),
                        const Expanded(
                          child: SizedBox(height: 1)
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 16,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: colleaguesGroupButtonColor
                              //partnersGroupButtonColor
                          ),
                          child: const Text(
                            "К", // КП
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontFamily: 'Roboto'
                            )
                          )
                        ),
                        const Expanded(
                          child: SizedBox(height: 1)
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 16,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: partnersGroupButtonColor
                          ),
                          child: const Text(
                            "П",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontFamily: 'Roboto'
                            )
                          )
                        ),
                        const Expanded(
                          child: SizedBox(height: 1)
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: AnimatedButton(
                            theme: theme,
                            iconPath: menuButtonIcon,
                            onPressed: (){} //userNumberDown, // ToDo переписать, так как сейчас юзеры приходят не с сервера.
                          )
                        ),
                        const SizedBox(
                          width: 5,
                        )
                      ]
                    )
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    height: 34,
                    width: 34,
                      child: AnimatedButton(
                      theme: theme,
                      iconPath: deleteButtonIcon,
                      onPressed: (){} //userNumberDown, // ToDo переписать, так как сейчас юзеры приходят не с сервера.
                    )
                  )
                ]
              )
            ]
          ),
          const SizedBox(
            width: 16,
            height: 1,
          )
        ]
      )
    );
  }
}

List<Widget> background(List<int> colors, AppTheme theme) {
  List<Widget> result = [];
  Color color;
  for (int i in colors) {
    switch(i) {
      case 1:
        color = theme.familyGroupButtonColor;
        break;
      case 2:
        color = theme.friendsGroupButtonColor;
        break;
      case 3:
        color = theme.relativesGroupButtonColor;
        break;
      case 4:
        color = theme.colleaguesGroupButtonColor;
        break;
      case 5:
        color = theme.partnersGroupButtonColor;
        break;
      default:
        color = theme.celebrateIconDefaultColor;
    }
    result.add(
        Expanded(
            flex: 1,
            child: Container(
                color: color
            )
        )
    );
  }
  return result;
}

class CategoryRowWidget extends StatelessWidget {
  final int index;
  final String name;
  final AppTheme theme;
  final Function callback;

  const CategoryRowWidget ({
    required this.index,
    required this.name,
    required this.theme,
    required this.callback,
    Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (index % 2 == 0)?
        const Color(0xFFFAFFFF):
        const Color(0xFF64BCEE).withOpacity(0.0),
      child: Row(
        children: <Widget> [
          const SizedBox(
            width: 16,
            height: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF414E58),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                )
              ),
              Row(
                children: <Widget> [
                Container(
                  height: 34,
                  width: 295,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xFFE6F1FE),
                      width: 1,
                    ),
                    color: const Color(0xFFFAFFFF)
                  ),
                  child: Row(
                    children: const <Widget> [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        " ",
                        style: TextStyle(
                          color: Color(0xFFA6ADB5),
                          fontSize: 14,
                          fontFamily: 'Roboto'
                        )
                      ),
                      Expanded(
                        child: SizedBox(height: 1)
                      ),
                      // SizedBox(
                      //   height: 20,
                      //   width: 20,
                      //   child: AnimatedButton(
                      //     theme: theme,
                      //     iconPath: menuButtonIcon,
                      //     onPressed: callback
                      //   )
                      // ),
                      SizedBox(
                        width: 5,
                      )
                    ]
                  )
                ),
                const SizedBox(
                  width: 5,
                ),
                  SizedBox(
                    height: 34,
                    width: 34,
                    child:
                    AddButton(
                      onPressed: callback,
                    )
                  )
                ]
              )
            ]
          ),
          const SizedBox(
            width: 16,
            height: 1,
          )
        ]
      )
    );
  }
}

class AddButton extends StatefulWidget {
  final Icon icon = const Icon(
    Icons.add,
    color: Colors.white,
  );
  final Function onPressed;

  const AddButton({
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color green = const Color(0xFF52B69A);

    return Listener(
        child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: green,
                boxShadow: [
                  BoxShadow(
                    color: isPressed? green : green,
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