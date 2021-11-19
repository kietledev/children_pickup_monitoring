import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/preferences.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/presentation/blocs/language/language_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingAppPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SettingAppPage();
}
class _SettingAppPage extends State<SettingAppPage> {
  bool isSwitched = true;
  int currentIndex = -1;
  bool isSelected = true;
  final preferences = Preferences();

  @override
  void initState() {
    super.initState();
     preferences.getLanguage().then((value) =>onSelected(value));
  }
  onSelected(int value){
    if(value == 0){
      setState(() {
        isSelected = true;
      });
    }else{
      setState(() {
        isSelected = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    List<ItemMenu> listItemsSettingApp = [
      ItemMenu(1, (AppLocalizations.of(context)!.aboutDOUP), "assets/icons/ic_information_classroom.svg", RouteConstants.informationApp),
      ItemMenu(2, (AppLocalizations.of(context)!.help), "assets/icons/ic_camera.svg", RouteConstants.helpApp),
    ];
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WidgetAppBar(
        hideBack: true,
        actionBack: () => Navigator.pop(context),
        title: (AppLocalizations.of(context)!.setting),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_body_a.png'),
            fit: BoxFit.fill,
          ),
        ),
        child:  Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        (AppLocalizations.of(context)!.notification),
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorConstants.neutralColor1,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontsConstants.notoSans),
                      ),
                      Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(value);
                                });
                              },
                              inactiveTrackColor: ColorConstants.brandColor,
                              activeTrackColor: ColorConstants.secondaryColor2,
                              activeColor: Colors.white,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      (AppLocalizations.of(context)!.language),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.neutralColor1,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontsConstants.notoSans),
                    ),
                  ),
                  AnimatedToggle(
                    values: ['Việt Nam', 'English'],
                    initialPosition: isSelected,
                    onToggleCallback: (value) {
                      setState(() {
                        if(value==0){
                          isSelected = true;
                        }else{
                          isSelected = false;
                        }
                        preferences.setlanguage(value);
                        BlocProvider.of<LanguageBloc>(context).add(
                            ToggleLanguageEvent(
                              Languages.languages[value], // index value can be 0 or 1 in our case
                            )
                        );//translateLanguage(value);
                      });
                    },
                    buttonColor: Colors.white,
                    backgroundColor: ColorConstants.neutralColor4,
                    textColor: ColorConstants.brandColor,
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 58),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                            BorderSide(width: 0.25, color: Color(0xFF797D88)))),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                  primary: false,
                  itemCount: listItemsSettingApp.length,
                  itemBuilder: (context, index) {
                    final item = listItemsSettingApp[index];
                    return ItemMenuListView(
                      index: index,
                      isSelected: currentIndex == index,
                      item: item,
                      onSelect: () {
                        setState(() {
                          currentIndex = index;
                        });
                        Navigator.pushNamed(context, item.route);
                      },
                    );
                  },
                )
            )
          ],
        )
      ),
    );
  }
}