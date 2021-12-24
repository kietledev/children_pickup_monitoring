import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/user_model.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/pupil.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/widgets/item_teacher_pupil_listview.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ClassDetailsPage extends StatelessWidget {
  const ClassDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<PupilsBloc>(),
      child:  Scaffold(
        appBar:  WidgetAppBar(
          title: (AppLocalizations.of(context)!.classDetail),
          menuItem: [],
          hideBack:true,
          actionBack: () {
            Navigator.pop(context);
          },
        ),
        body: ClassDetailsBody(),
      ),
    );
  }
}

class ClassDetailsBody extends StatefulWidget {
  const ClassDetailsBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ClassDetailsBody> createState() => _ClassDetailsBodyState();
}

class _ClassDetailsBodyState extends State<ClassDetailsBody> {
  int currentIndex = -1;
  int roleId = -1;
  int personId = -1;
  UserModel? userModel;

  List<int> pupilIds = [];
  int classId = -1;
  @override
  void initState() {
    getUserId();

    super.initState();


  }

  getUserId() async {
    userModel = await getUser();
    classId = await getClassID();
    setState(() {
      roleId = userModel!.roleId;
      personId = userModel!.personId;
      classId = classId;
    });
    BlocProvider.of<PupilsBloc>(context).add(FetchPupils(classId: classId, date: DateTime.now().toString()));
    if(roleId == 1){
      getPupils();
    }
  }
  getPupils() async{
    pupilIds = await getListPupilID();
    setState(() {
      pupilIds = pupilIds;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PupilsBloc, PupilsState>(builder: (context, state) {
      if (state is FetchPupilsSuccessState) {
        EasyLoading.dismiss();
        final List<Pupil> pupils = state.pupils!;

        return Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_body_a.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),
                Text(
                  (AppLocalizations.of(context)!.classSize) +": " + (pupils.length).toString() + "/"+(pupils.length).toString(),
                  style:
                      Utils.setStyle(color: ColorConstants.neutralColor1),
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0) ,
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: pupils.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = pupils[index];
                      return ItemTeacherPupilListView(
                        index: index,
                        genderId: item.personDetail!.currentGenderId!,
                        pupilIds:pupilIds,
                        role: roleId,
                        pupilId: item.pupilId,
                        avtDefaultMale: 'assets/images/img_child_avt_trai.png',
                        avtDefaultFemale: 'assets/images/img_child_avt_gai.png',
                        isSelected: currentIndex == index,
                        avatar: item.personDetail!.avatarPicture!,
                        fullName: item.getFullName(),
                        onSelect: () {
                          setState(() {
                            currentIndex = index;
                          });
                          if (roleId == 1) {
                            if ( pupilIds.contains(item.pupilId!) == true){
                              Navigator.pushNamed(
                                  context, RouteConstants.pupilDetails,
                                  arguments: item);
                            }
                              }else{
                                Navigator.pushNamed(
                                context, RouteConstants.pupilDetails,
                                arguments: item);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (state is FetchPupilsFailureState) {
        EasyLoading.dismiss();
        // UiHelper.showMyDialog(
        //   context: context,
        //   content: state.msg ?? "This is something wrong",
        // );
        return const SizedBox.shrink();
      } else {
        EasyLoading.show();
        return const SizedBox.shrink();
      }
    });
  }
}
