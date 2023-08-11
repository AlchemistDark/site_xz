import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class CelebrateChoiceScreen extends StatefulWidget {
  static const route = '/holiday';

  bool isEditable = false;
  final String title;
  final int index;
  final String name;
  final String token;
  final AppController appController;
  final List<ShortCelebrate> celebrations;
  final AppTheme theme;

  CelebrateChoiceScreen(
    this.title,
    this.index,
    this.name,
    this.token,
    this.appController,
    this.celebrations,
    this.theme,
    {Key? key}
  ) : super(key: key);

  @override
  State<CelebrateChoiceScreen> createState() => _CelebrateChoiceScreenState();

}

class _CelebrateChoiceScreenState extends State<CelebrateChoiceScreen> {

  int? checkedCelebrateIndex;
  String? checkedCelebrateName;

  final ScrollController _scrollControllerCategoriesBlock = ScrollController();

  _CelebrateChoiceScreenState();

  // Future<void> openCelebrationChoiceScreen(AppTheme theme, int id)async{
  //
  //   // List<ShortCelebrate> celebrationsList = await widget.appController.getCelebrationName(token: widget.token, id: id);
  //
  //   // List celebrations = await widget.appController.getCelebrationsList(token);
  //   // setState(() {
  //   //   Navigator.push(
  //   //     context, MaterialPageRoute(
  //   //       builder: (context) {
  //   //         return CalendarScreen(
  //   //           widget.title,
  //   //             // widget.mainWidth,
  //   //             widget.appController,
  //   //             celebrations,
  //   //             theme
  //   //           // widget.token
  //   //         );
  //   //       }
  //   //   )
  //   //   );
  //   // });
  // }

  Future<void> celebrateChecking({required int index, required String token, required String name, required int category}) async {
    checkedCelebrateIndex = index;
    checkedCelebrateName = name;
    setState((){});
    await Future.delayed(const Duration(seconds: 1), () async {
      await widget.appController.createCelebrate(token: token, name: name, category: category); //createCelebrate({required String token, required String name, required int category})async{
    });
    setState(() {
      Navigator.pop(context);
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
                widget.title,
                style: TextStyle(
                  color: theme.appBarTextColor,
                  fontSize: 17,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600
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
                  height: 10
                ),
                /// Category name.
                Container(
                  height: 36,
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  color: theme.mainColor,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 8, top: 16),
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              color: theme.avatarText1Color,
                              fontSize: 16,
                              fontFamily: 'Roboto'
                            ),
                          )
                        )
                      )
                    ]
                  )
                ),
                /// Separator line.
                SizedBox(
                  height: 10
                ),
                /// List block.
                Expanded(
                  flex: 1,
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    controller: _scrollControllerCategoriesBlock,
                    child: ListView.builder(
                      controller: _scrollControllerCategoriesBlock,
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.isEditable?
                          (widget.celebrations.length + 1):
                          widget.celebrations.length,
                      itemBuilder: (BuildContext context, int index) {
                        if(widget.isEditable && index == 0) {
                          return const EditableCelebrateRowWidget();
                        }
                        return CelebrateRowWidget(
                          index: index,
                          isChecked: (checkedCelebrateIndex == index),
                          name: widget.isEditable?
                              widget.celebrations[index + 1].name:
                              widget.celebrations[index].name,
                          theme: theme,
                          callback: () {
                            celebrateChecking(
                              index: index,
                              token: widget.token,
                              name: widget.celebrations[index].name,
                              category: widget.index
                            );
                          },
                        );
                      }
                    )
                  )
                ),
                /// Separator line.
                const SizedBox(
                  height: 10
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 46,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.isEditable = !widget.isEditable;
                            });// sadfs
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(98, 198, 170, 1),
                                  Color.fromRGBO(68, 168, 140, 1)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              '+ Добавить\nсвой праздник',
                              style: TextStyle(
                                fontFamily: 'Roboto600', fontSize: 14, color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            )
                          )
                        )
                      )
                    ),
                    const SizedBox(
                      width: 8
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 46,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(98, 198, 170, 1),
                                  Color.fromRGBO(68, 168, 140, 1)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'Сохранить',
                              style: TextStyle(
                                fontFamily: 'Roboto600', fontSize: 14, color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            )
                          )
                        )
                      )
                    ),
                    const SizedBox(
                      width: 16
                    )
                  ]
                ),
                const SizedBox(
                  height: 30
                )
                /// navBar. // ToDo
              ]
            )
          )
        );
      }
    );
  }
}

class CelebrateRowWidget extends StatefulWidget {

  final int index;
  final bool isChecked;
  final String name;
  // final int day;
  // final int month;
  final AppTheme theme;
  final Function callback;

  const CelebrateRowWidget({
    required this.index,
    required this.isChecked,
    required this.name,
    // required this.day,
    // required this.month,
    required this.theme,
    required this.callback,
    Key? key}
  ) : super(key: key);

  @override
  State<CelebrateRowWidget> createState() => _CelebrateRowWidgetState();
}

class _CelebrateRowWidgetState extends State<CelebrateRowWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (widget.index % 2 == 0)?
      const Color(0xFFFAFFFF):
      const Color(0xFF64BCEE).withOpacity(0.0),
      child: InkWell(
        onTap: () {
          widget.callback();
        },
        child: Row(
          children: <Widget> [
            const SizedBox(
              width: 16,
              height: 36,
            ),
            if(widget.isChecked)
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF52B69A),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xFF52B69A),
                    )
                  )
                ),
              ),
            if(!widget.isChecked)
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFA6ADB5),
                )
              ),
            const SizedBox(
              width: 8,
              height: 36,
            ),
            Expanded(
              child: Text(
                widget.name,
                style: TextStyle(
                  color: widget.isChecked? const Color(0xFF52B69A) : const Color(0xFF627684),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                )
              )
            ),
            // Text(
          //   "${widget.day.toString().padLeft(2, '0')}.${widget.month.toString().padLeft(2, '0')}",
          //   style: const TextStyle(
          //     color: Color(0xFFA6ADB5),
          //     fontSize: 14,
          //     fontFamily: 'Roboto',
          //   )
          // ),
            const SizedBox(
              width: 16,
              height: 1,
            )
          ]
        )
      )
    );
  }
}

class EditableCelebrateRowWidget extends StatefulWidget {

  const EditableCelebrateRowWidget ({Key? key}) : super(key: key);

  @override
  State<EditableCelebrateRowWidget> createState() => _EditableCelebrateRowWidgetState();
}

class _EditableCelebrateRowWidgetState extends State<EditableCelebrateRowWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF64BCEE).withOpacity(0.0),
      child: Row(
        children: <Widget> [
          const SizedBox(
            width: 16,
            height: 36,
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFF52B69A),
                width: 2,
              ),
            ),
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xFF52B69A),
                )
              )
            ),
          ),
          const SizedBox(
            width: 8,
            height: 36,
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              onChanged: (text){
                // phone = "+7 $text";
              },
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(
                color: const Color.fromRGBO(65, 78, 88, 1),
                fontSize: 0.017*MediaQuery.of(context).size.height,
                fontFamily: 'Roboto400'
              ),
              cursorColor: const Color.fromRGBO(65, 78, 88, 1),
              decoration: InputDecoration(
                hintText: 'Ввод праздника',
                hintStyle: TextStyle(
                  color: const Color.fromRGBO(166, 173, 181,1),
                  fontSize: 0.019*MediaQuery.of(context).size.height,
                  fontFamily: 'Roboto400'
                ),
                border: InputBorder.none
              )
            )
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

// class CircleCheckBox extends StatelessWidget {
//   bool is
//   CircleCheckBox({Key? key}) : super(key: key)
//
//   @override
//   Widget build(BuildContext context) {
//     if (value == groupValue) {
//       return Container()
//     }
//   }
// }
//
// class CustomRadio<T> extends StatelessWidget {
//
//   final ValueChanged<T?> onChanged;
//   final T value;
//   final T groupValue;
//
//   const CustomRadio({
//     required this.onChanged,
//     required this.value,
//     required this.groupValue,
//     Key? key
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if (value == groupValue){
//       return Container(
//         width: 24,
//         height: 24,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(
//               color: AppTheme.mainGreenColor,
//               width: 2,
//             ),
//             color: AppTheme.backgroundColor
//         ),
//         child: Center(
//             child: Container(
//                 width: 16,
//                 height: 16,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: AppTheme.mainGreenColor,
//                 )
//             )
//         ),
//       );
//     }
//     return Listener(
//       child: Container(
//           height: 24,
//           width: 24,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(
//                 color: AppTheme.inactiveButtonBorderColor,
//                 width: 2,
//               ),
//               color: AppTheme.inactiveButtonFillColor
//           ),
//           child: Container(
//             margin: const EdgeInsets.all(2),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           )
//       ),
//       onPointerDown: (_) {onChanged(value);},
//     );
//   }
// }