import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/achievement/achievement_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/pupils/pupils_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/custom_appbar.dart';
import 'package:children_pickup_monitoring/presentation/widgets/item_attencance.dart';
import 'package:children_pickup_monitoring/presentation/widgets/item_title_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ClassAttendancePage extends StatefulWidget {
  const ClassAttendancePage({Key? key}) : super(key: key);
  @override
  State<ClassAttendancePage> createState() => _ClassAttendancePage();
}
  class _ClassAttendancePage extends State<ClassAttendancePage>{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => injector<PupilsBloc>(),
      child: Scaffold(
        appBar:  WidgetAppBar(
          hideBack: true,
          title: (AppLocalizations.of(context)!.classAttendance),
          menuItem: [],

          actionBack: () {
            Navigator.pop(context);
          },
        ),
        body: ClassAttendanceBody(
          // achievement: achievement,
        ),
      ),
    );
  }
  }
  class ClassAttendanceBody extends StatefulWidget {
    const ClassAttendanceBody({
      Key? key,
    }) : super(key: key);

    @override
  State<ClassAttendanceBody> createState() => _ClassAttendanceBody();
  }
class _ClassAttendanceBody extends State<ClassAttendanceBody> {
  int currentIndex = -1;
  int _role = 2;
  List<int> pupilIds = [1,2];
  int classId = -1;
  @override
  void initState() {
    super.initState();
    initBloc();
  }
  initBloc() async{
    // classId = await get();
    print( DateTime.now().toString());
    BlocProvider.of<PupilsBloc>(context).add(FetchPupils(classId: 5, date: DateTime.now().toString()));
  }
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate:  DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
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
            Padding(
              padding: EdgeInsets.fromLTRB(24,0,24,12),
              child: Row(
                children: [
                  Text(
                    (AppLocalizations.of(context)!.date) +": ",
                    style:
                    Utils.setStyle(color: ColorConstants.neutralColor1),
                  ),

                  Text(Utils.formatDate("${selectedDate.toLocal()}".split(' ')[0]),style: AttendanceStyle.contentStyle3,),
                  SizedBox(height: 20.0,),
                  TextButton.icon(
                    onPressed: () => _selectDate(context),
                    icon:   SvgPicture.asset(
                      'assets/icons/ic_calendar.svg',
                      color: ColorConstants.brandColor,
                    ),
                    label: Text(''),
                  ),
                  const Spacer(),

                  Text(
                    (AppLocalizations.of(context)!.classSize) +": ",
                    style:
                    Utils.setStyle(color: ColorConstants.neutralColor1),
                  ),
                  Text(
                    (pupils.length).toString() + "/"+(pupils.length).toString(),
                      style: AttendanceStyle.contentStyle3,
                  ),
                //  Expanded(
                //    flex: 4,
                //         child:Text(" "+"available",
                //           style:
                //           Utils.setStyle(color: ColorConstants.neutralColor1)),
                // ),
                ]
              ),
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
                      return ItemAttencanceListView(
                        index: index,
                        genderId: item.personDetail!.currentGenderId!,
                        pupilIds:pupilIds,
                        role: _role,
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
                              Navigator.pushNamed(
                                  context, RouteConstants.editAttendance,
                                  arguments: item);
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
    // return Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children:[
    //       Transform.scale(
    //         scale: 1,
    //         child: Switch(
    //           onChanged: toggleSwitch,
    //           value: isSwitched,
    //           activeColor: ColorConstants.white,
    //           activeTrackColor: ColorConstants.Secondary2,
    //           inactiveThumbColor: ColorConstants.white,
    //           inactiveTrackColor: ColorConstants.Pattette2,
    //         )
    //     ),
    //       Text('$textValue', style: TextStyle(fontSize: 20),)
    //     ]);
  }
}
  
