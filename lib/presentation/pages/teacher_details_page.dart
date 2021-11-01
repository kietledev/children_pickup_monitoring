import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/constants/text_constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/widgets/avatar_gender.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class TeacherDetailsPage extends StatelessWidget {
  const TeacherDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teacher = ModalRoute.of(context)!.settings.arguments as Teacher;
    return Scaffold(
      appBar:  WidgetAppBar(
        title: teacher.getFullName(),
        menuItem: [],
        actionBack: () {
          Navigator.pop(context);
        },
      ),

      body: TeacherDetailsBody(
        teacher: teacher,
      ),
    );
  }
}

class TeacherDetailsBody extends StatelessWidget {
  TeacherDetailsBody({
    Key? key,
    required this.teacher,
  }) : super(key: key);
  final Teacher teacher;

  final TextStyle titleStyle = Utils.setStyle(
      size: 14, color: ColorConstants.neutralColor2, weight: FontWeight.w600);
  final TextStyle valueStyle =
      Utils.setStyle(color: ColorConstants.neutralColor1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_body_a.png'),
            fit: BoxFit.cover,
          ),
        ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),

          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 32.h),
                Center(
                  child: AvatarGender(
                    genderId: teacher.personDetail!.currentGenderId!,
                    avatar: teacher.personDetail!.avatarPicture!,
                    avatarFemaleNull: 'assets/images/img_avt_gv_nu.png',
                    avatarMaleNull:'assets/images/img_avt_gv_nam.png' ,

                  ),
                ),

                // Image.network(teacher.avatarPicture!),
                SizedBox(height: 48.h),
                Text(
                  StringConstatns.fullName,
                  style: titleStyle,
                ),
                CustomTextFieldMenu(value: teacher.getFullName(), style: valueStyle),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstatns.yearOfBirth,
                            style: titleStyle,
                          ),
                          CustomTextFieldMenu(
                              value: Utils.formatDateTime( teacher.personDetail!.birthDate!), style: valueStyle),
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
                            StringConstatns.position,
                            style: titleStyle,
                          ),
                          CustomTextFieldMenu(
                              value: teacher.mainResponsibilityTeacher! == true ? StringConstatns.homeroomTeacher: StringConstatns.teacher, style: valueStyle),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 72.w),
                  child: const Divider(
                    color: Color(0xFFA693D9),
                  ),
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
                            StringConstatns.phoneNumber1,
                            style: titleStyle,
                          ),
                          CustomTextFieldMenu(
                              value: teacher.personDetail!.currentPhoneNumber1!,
                              style: valueStyle),
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
                            StringConstatns.phoneNumber2,
                            style: titleStyle,
                          ),
                          CustomTextFieldMenu(
                              value: teacher.personDetail!.currentPhoneNumber2!,
                              style: valueStyle),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  StringConstatns.email,
                  style: titleStyle,
                ),
                CustomTextFieldMenu(value: teacher.personDetail!.currentEmail!, style: valueStyle),
                SizedBox(height: 24.h),
                Text(
                  StringConstatns.introduce,
                  style: titleStyle,
                ),
                CustomTextField(
                    value: teacher.personDetail!.comments!, style: valueStyle, numOfLine: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
