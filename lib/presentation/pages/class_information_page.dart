import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ClassInformationPage extends StatelessWidget {
  const ClassInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(
        title:  (AppLocalizations.of(context)!.classInformation),
        menuItem: [],
        hideBack:true,
        actionBack: () {
          Navigator.pop(context);
        },
      ),
      body: ClassInformationBody(),
    );
  }
}

class ClassInformationBody extends StatefulWidget {
  const ClassInformationBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ClassInformationBody> createState() => _ClassInformationBodyState();
}

class _ClassInformationBodyState extends State<ClassInformationBody> {


  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<ItemMenu> listItemsClassInformation = [
      ItemMenu(1, (AppLocalizations.of(context)!.teacherInformation), "assets/icons/ic_teacher_infomation.svg",
          RouteConstants.teacherInformation),
      ItemMenu(2,  (AppLocalizations.of(context)!.classDetail), "assets/icons/ic_detail_class.svg",
          RouteConstants.classDetails),
      ItemMenu(3,  (AppLocalizations.of(context)!.foodMenu), "assets/icons/ic_menu_baby.svg",
          RouteConstants.menu),
      ItemMenu(4, (AppLocalizations.of(context)!.achievements), "assets/icons/ic_achievements.svg",
          RouteConstants.achievement),
    ];
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_body_a.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        primary: false,
        itemCount: listItemsClassInformation.length,
        itemBuilder: (context, index) {
          final item = listItemsClassInformation[index];
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
      ),
    );
  }
}
