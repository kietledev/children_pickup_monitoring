import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ClassInformationPage extends StatelessWidget {
  const ClassInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: TitlesConstants.classInformationTitle),
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
  final List<ItemMenu> listItemsClassInformation = [

    ItemMenu(1, "Thông tin giáo viên", "assets/icons/ic_teacher_infomation.svg",
        RouteConstants.teacherInformation),
    ItemMenu(2, "Chi tiết lớp học", "assets/icons/ic_detail_class.svg",
        RouteConstants.classDetails),
    ItemMenu(3, "Thực đơn của bé", "assets/icons/ic_menu_baby.svg",
        RouteConstants.classInformation),
    ItemMenu(4, "Thành tích", "assets/icons/ic_achievements.svg",
        RouteConstants.achievement),
  ];

  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
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
