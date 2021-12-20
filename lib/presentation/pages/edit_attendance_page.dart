import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/core/widgets/textfield.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/achievement/achievement_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/pupils/pupils_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/avatar_gender.dart';
import 'package:children_pickup_monitoring/presentation/widgets/custom_appbar.dart';
import 'package:children_pickup_monitoring/presentation/widgets/custom_textfield_menu.dart';
import 'package:children_pickup_monitoring/presentation/widgets/item_attencance.dart';
import 'package:children_pickup_monitoring/presentation/widgets/item_title_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EditAttendancePage extends StatefulWidget {
  const EditAttendancePage({Key? key}) : super(key: key);
  @override
  State<EditAttendancePage> createState() => _EditAttendancePage();
}
class _EditAttendancePage extends State<EditAttendancePage>{
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
        body: EditAttendanceBody(
          // achievement: achievement,
        ),
      ),
    );
  }
}
class EditAttendanceBody extends StatefulWidget {
  const EditAttendanceBody({
    Key? key,
  }) : super(key: key);

  @override
  State<EditAttendanceBody> createState() => _EditAttendanceBody();
}
class _EditAttendanceBody extends State<EditAttendanceBody> {
  TextEditingController _note = new TextEditingController();
  bool _enable = false;
  @override
  Widget build(BuildContext context) {
    String dropdownValue = AppLocalizations.of(context)!.available;
    final pupil = ModalRoute
        .of(context)!
        .settings
        .arguments as Pupil;
  return SingleChildScrollView(
      child: Container(
      decoration: const BoxDecoration(
      image: DecorationImage(
      image: AssetImage('assets/images/img_bg_detail_child_B.png'),
    fit: BoxFit.cover,
    ),
    ),
    child: Padding(
    padding: const EdgeInsets.all(24),
    child: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Center(
      child: AvatarGender(
      genderId: pupil.personDetail!.currentGenderId!,
        avatar: pupil.personDetail!.avatarPicture!,
        avatarFemaleNull: 'assets/images/img_child_avt_gai.png',
        avatarMaleNull: 'assets/images/img_child_avt_trai.png',
      ),
    ),
          SizedBox(height: 48.h),
          Text(
            (AppLocalizations.of(context)!.fullName),
            style: ProfileStyle.contentStyle2,
          ),
          CustomTextFieldMenu(
              value: pupil.getFullName(), style: QRCodeStyle.contentStyle2),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (AppLocalizations.of(context)!.birthday),
                      style:  ProfileStyle.contentStyle2,
                    ),
                    CustomTextFieldMenu(
                        value: Utils.formatDateTime(
                            pupil.personDetail!.birthDate!),
                        style: QRCodeStyle.contentStyle2),
                  ],
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (AppLocalizations.of(context)!.className),
                      style:  ProfileStyle.contentStyle2,
                    ),
                    CustomTextFieldMenu(
                        value: pupil.className!, style: QRCodeStyle.contentStyle2),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (AppLocalizations.of(context)!.status),
                      style:  ProfileStyle.contentStyle2,
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      // decoration: InputDecoration(
                      //     contentPadding:
                      //     const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      //     disabledBorder: OutlineInputBorder(
                      //       borderSide: const BorderSide(color: Colors.white, width: 0),
                      //       borderRadius: BorderRadius.circular(6.0),
                      //     ),
                      //     filled: true,
                      //     fillColor: Colors.white),
                      height: 40.h,
                      width: 151.h,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                         borderRadius: new BorderRadius.circular(6.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),

                      child:    DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: SvgPicture.asset(
                          'assets/icons/ic_dropdown.svg',
                          color: ColorConstants.brandColor,
                        ),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(

                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[AppLocalizations.of(context)!.available, AppLocalizations.of(context)!.absent]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                flex: 1,
                child: Text(""),
              )
            ]
              ),
          Row(
              children: [
                new Flexible(
                    child: TextFieldCustom(
                      controller: _note,
                      title: (AppLocalizations.of(context)!.note),
                      enabled: _enable,
                      typeTextField: "height",
                    )),
              ]
          ),

              Row(
                  children: [
                    new Flexible(
                        child: TextFieldCustom(
                          controller: _note,
                          title: (AppLocalizations.of(context)!.childHeight),
                          enabled: _enable,
                          typeTextField: "height",
                        )),
                    SizedBox(width: 24.w),
                    new Flexible(
                        child: TextFieldCustom(
                          controller: _note,
                          title: (AppLocalizations.of(context)!.childWeight),
                          enabled: _enable,
                          typeTextField: "weight",
                        )),

                  ]
              ),
            ],
          ),
      //     SizedBox(height: 24.h),
      // ]),
    )
    )));

  }

}