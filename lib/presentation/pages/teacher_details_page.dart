import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/constants/text_constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/domain/entities/teacher.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class TeacherDetailsPage extends StatelessWidget {
  const TeacherDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teacher = ModalRoute.of(context)!.settings.arguments as Teacher;
    return Scaffold(
      appBar: const CustomAppBar(
        title: TitlesConstants.teacherDetails,
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

  final TextStyle titleStyle = Utils.initTextStyle(
      size: 14, color: ColorConstants.neutralColor2, weight: FontWeight.w600);
  final TextStyle valueStyle =
      Utils.initTextStyle(color: ColorConstants.neutralColor1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 32.h),
              Center(
                child: SizedBox(
                  width: 112.w,
                  height: 112.w,
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 32,
                    backgroundImage: AssetImage("assets/images/img_avatar.png"),
                  ),
                ),
              ),
              // Image.network(teacher.avatarPicture!),
              SizedBox(height: 48.h),
              Text(
                StringConstatns.fullName,
                style: titleStyle,
              ),
              CustomTextField(value: teacher.getFullName(), style: valueStyle),
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
                        CustomTextField(
                            value: teacher.personDetail!.birthDate!, style: valueStyle),
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
                        CustomTextField(
                            value: teacher.personDetail!.academicTitle!, style: valueStyle),
                      ],
                    ),
                  )
                ],
              ),
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
                        CustomTextField(
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
                        CustomTextField(
                            value: teacher.personDetail!.currentPhoneNumber2!,
                            style: valueStyle),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                StringConstatns.email,
                style: titleStyle,
              ),
              CustomTextField(value: teacher.personDetail!.currentEmail!, style: valueStyle),
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
    );
  }
}
