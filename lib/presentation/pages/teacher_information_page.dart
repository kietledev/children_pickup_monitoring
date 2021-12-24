import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/utils.dart';
import 'package:children_pickup_monitoring/data/models/user_model.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/blocs/class_room/class_room_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class TeacherInformationPage extends StatelessWidget {
  const TeacherInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TeachersBloc>(
            create: (context) => injector<TeachersBloc>(),
          ),
        ],

      child:  Scaffold(
        appBar:  WidgetAppBar(
          title: (AppLocalizations.of(context)!.teacherInformation),
          menuItem: [],
          hideBack:true,
          actionBack: () {
            Navigator.pop(context);
          },
        ),

        body: TeacherInformationBody(),
      ),
    );
  }
}

class TeacherInformationBody extends StatefulWidget {
  const TeacherInformationBody({
    Key? key,
  }) : super(key: key);

  @override
  State<TeacherInformationBody> createState() => _TeacherInformationBodyState();
}

class _TeacherInformationBodyState extends State<TeacherInformationBody> {
  int currentIndex = -1;
  List<int> pupilIds = [];
  int _role =1;
  int roleId = -1;
  int personId = -1;
  int classId = -1;
  // int classId = -1;
  UserModel? userModel;
  @override
  void initState() {
    super.initState();
    initBloc();
  }
  initBloc() async{
    userModel = await getUser();
    classId = await getClassID();
    print(classId);
    setState(() {
      roleId = userModel!.roleId;
      personId = userModel!.personId;
      classId = classId;
    });
    print( DateTime.now().toString());
    BlocProvider.of<TeachersBloc>(context).add(FetchTeaches(classId: classId));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersBloc, TeachersState>(builder: (context, state) {
      if (state is FetchTeachersSuccessState) {
        EasyLoading.dismiss();
        final List<Teacher> teachers = state.teachers!;
        return Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_body_a.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0) ,
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: teachers.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = teachers[index];
                    return ItemTeacherPupilListView(
                      index: index,
                      pupilIds: pupilIds,
                      role: _role,
                      isSelected: currentIndex == index,
                      position: item.mainResponsibilityTeacher,
                      avtDefaultFemale:"assets/images/img_gv_nu.png" ,
                      avtDefaultMale: "assets/images/img_gv_nam.png",
                      genderId:item.personDetail!.currentGenderId!,
                      avatar: item.personDetail!.avatarPicture!,
                      fullName: item.getFullName(),
                      onSelect: () {
                        setState(() {
                          currentIndex = index;
                        });
                        Navigator.pushNamed(context, RouteConstants.teacherDetails,
                            arguments: item);
                      },
                    );
                  },
                ),
              ),
            ),
          );

      } else if (state is FetchTeachersFailureState) {
        EasyLoading.dismiss();
        return const SizedBox.shrink();
      } else {
        EasyLoading.show();
        return const SizedBox.shrink();
      }
    });
  }
}
