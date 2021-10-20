import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final List<ItemMenu> listItemsClassroom = [
    ItemMenu(
        1,
        "Thông tin lớp học",
        "assets/icons/ic_information_classroom.svg",
        RouteConstants.classInformation),
    ItemMenu(2, "Xem Camera", "assets/icons/ic_camera.svg",
        RouteConstants.classInformation),
    ItemMenu(3, "Gửi yêu cầu đón trẻ", "assets/icons/ic_create_qr.svg",
        RouteConstants.classInformation),
    ItemMenu(4, "Lịch sử đón trẻ", "assets/icons/ic_history.svg",
        RouteConstants.classInformation),
  ];

  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    print(ttl);
    print(getTokenApi(id: 1.toString()));
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
