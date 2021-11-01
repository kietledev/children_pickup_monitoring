import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SettingAppPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SettingAppPage();
}
class _SettingAppPage extends State<SettingAppPage> {
  bool isSwitched = true;
  dynamic _toggleValue = 0;
  int currentIndex = -1;
  final List<ItemMenu> listItemsSettingApp = [
    ItemMenu(1, "Về ứng dụng", "assets/icons/ic_information_classroom.svg", RouteConstants.informationApp),
    ItemMenu(2, "Trợ giúp", "assets/icons/ic_camera.svg", RouteConstants.helpApp),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WidgetAppBar(
        actionBack: () => Navigator.pop(context),
        title: TitlesAppBar.settingApp,
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
                        "Thông báo sắp đến giờ đón trẻ",
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
                      "Ngôn ngữ",
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
                    onToggleCallback: (value) {
                      setState(() {
                        _toggleValue = value;
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