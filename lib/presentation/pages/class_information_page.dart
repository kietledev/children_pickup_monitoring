import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/preferences.dart';
import 'package:children_pickup_monitoring/common/helpers/ui_helper.dart';
import 'package:children_pickup_monitoring/common/helpers/utils.dart';
import 'package:children_pickup_monitoring/data/models/user_model.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/class_room/class_room_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ClassInformationPage extends StatelessWidget {
  const ClassInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ClassRoomBloc>(
            create: (context) => injector<ClassRoomBloc>(),
          ),

        ],

        child:  Scaffold(
          appBar: WidgetAppBar(
            title:  (AppLocalizations.of(context)!.classInformation),
            menuItem: [],
            hideBack:true,
            actionBack: () {
              Navigator.pop(context);
            },
      ),
          body: ClassInformationBody(),
            )
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
  int roleId = -1;
  int personId = -1;
  int classId = -1;
  int currentIndex = -1;
  UserModel? userModel;
  final preferences = Preferences();
  @override
  void initState() {
    initBloc();
    super.initState();
  }
  initBloc() async{
    userModel = await getUser();
    setState(() {
      roleId = userModel!.roleId;
      personId = userModel!.personId;
    });
    if(roleId == 2){
      BlocProvider.of<ClassRoomBloc>(context).add(GetListClassByTeacherId(personId: personId));
    }

  }
  @override
  Widget build(BuildContext context) {


    if(roleId ==2){
      final List<ItemMenu> listItemsClassInformation = [
        ItemMenu(1, (AppLocalizations.of(context)!.teacherInformation), "assets/icons/ic_teacher_infomation.svg",
            RouteConstants.teacherInformation),
        ItemMenu(2,  (AppLocalizations.of(context)!.classDetail), "assets/icons/ic_detail_class.svg",
            RouteConstants.classDetails),
        ItemMenu(3,  (AppLocalizations.of(context)!.classAttendance), "assets/icons/ic_attendance.svg",
            RouteConstants.classAttendance),
        ItemMenu(4,  (AppLocalizations.of(context)!.foodMenu), "assets/icons/ic_menu_baby.svg",
            RouteConstants.menu),
        ItemMenu(5, (AppLocalizations.of(context)!.achievements), "assets/icons/ic_achievements.svg",
            RouteConstants.achievement),
      ];
      return BlocBuilder<ClassRoomBloc, ClassRoomState>(builder: (context, state) {
        if (state is FetchClassRoomByTeacherSuccessState) {
          EasyLoading.dismiss();
          if(roleId == 2){
            preferences.setClassPupil(state.classRoomsTeacher![0].classId!);
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

        } else if (state is FetchClassRoomFailureState) {
          EasyLoading.dismiss();
          return const SizedBox.shrink();
        } else {
          EasyLoading.show();
          return const SizedBox.shrink();
        }
      });
    }else{
      final List<ItemMenu> listItemsClassInformation = [
        ItemMenu(1, (AppLocalizations.of(context)!.teacherInformation), "assets/icons/ic_teacher_infomation.svg",
            RouteConstants.teacherInformation),
        ItemMenu(2,  (AppLocalizations.of(context)!.classDetail), "assets/icons/ic_detail_class.svg",
            RouteConstants.classDetails),
        ItemMenu(4,  (AppLocalizations.of(context)!.foodMenu), "assets/icons/ic_menu_baby.svg",
            RouteConstants.menu),
        ItemMenu(5, (AppLocalizations.of(context)!.achievements), "assets/icons/ic_achievements.svg",
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
}
