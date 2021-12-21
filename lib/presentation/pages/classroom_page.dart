import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/utils.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ClassroomPage extends StatelessWidget {
  const ClassroomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ClassroomBody(),
    );
  }
}

class ClassroomBody extends StatefulWidget {
  const ClassroomBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ClassroomBody> createState() => _ClassroomBodyState();
}

class _ClassroomBodyState extends State<ClassroomBody> {

  int currentIndex = -1;
  int roleId = -1;
  int personId = -1;
  UserModel? userModel;
  @override
  void initState() {
    super.initState();
    getUserId();
  }
  getUserId() async {
    userModel = await getUser();
    setState(() {
      roleId = userModel!.roleId;
      personId = userModel!.personId;

    });
  }
  @override
  Widget build(BuildContext context) {
    List<ItemMenu> listItemsClassroom = [];
    if(roleId == 1){
    listItemsClassroom = [
        ItemMenu(
            1,(AppLocalizations.of(context)!.classInformation),
            "assets/icons/ic_information_classroom.svg",
            RouteConstants.classInformation),
        ItemMenu(2, (AppLocalizations.of(context)!.viewCamera), "assets/icons/ic_camera.svg",
            RouteConstants.classInformation),
        ItemMenu(3, (AppLocalizations.of(context)!.sendRequest), "assets/icons/ic_create_qr.svg",
            RouteConstants.generatedQCode),

        ItemMenu(4, (AppLocalizations.of(context)!.childPickupHistory), "assets/icons/ic_history.svg",
            RouteConstants.pickUpHistory),
      ];
    }else if (roleId == 2){
    listItemsClassroom = [
        ItemMenu(
            1,(AppLocalizations.of(context)!.classInformation),
            "assets/icons/ic_information_classroom.svg",
            RouteConstants.classInformation),
        ItemMenu(2, (AppLocalizations.of(context)!.viewCamera), "assets/icons/ic_camera.svg",
            RouteConstants.classInformation),
        ItemMenu(3, (AppLocalizations.of(context)!.sendRequest), "assets/icons/ic_create_qr.svg",
            RouteConstants.classInformation),

        ItemMenu(4, (AppLocalizations.of(context)!.childPickupHistory), "assets/icons/ic_history.svg",
            RouteConstants.pickUpHistory),
      ];
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_body_a.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        primary: false,
        itemCount: listItemsClassroom.length,
        itemBuilder: (context, index) {
          final item = listItemsClassroom[index];
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
