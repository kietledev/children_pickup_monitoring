import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/widgets/custom_appbar.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PupilDetailsPage extends StatelessWidget {
  const PupilDetailsPage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final pupil = ModalRoute.of(context)!.settings.arguments as Pupil;
    return Scaffold(
      appBar: const CustomAppBar(
        title: TitlesConstants.pupilDetails,
      ),
      body: PupilDetailsBody(
        pupil: pupil,
      ),
    );
  }
}

class PupilDetailsBody extends StatelessWidget {
  PupilDetailsBody({
    Key? key,
    required this.pupil,
  }) : super(key: key);
  final Pupil pupil;

  final TextStyle titleStyle = Utils.setStyle(
      size: 14, color: ColorConstants.neutralColor2, weight: FontWeight.w600);
  final TextStyle valueStyle =
      Utils.setStyle(color: ColorConstants.neutralColor1);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: 48.h),
              Text(
                StringConstatns.fullName,
                style: titleStyle,
              ),
              CustomTextField(value: pupil.getFullName(), style: valueStyle),
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
                            value: pupil.birthDate!, style: valueStyle),
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
                          StringConstatns.className,
                          style: titleStyle,
                        ),
                        CustomTextField(
                            value: pupil.className!, style: valueStyle),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstatns.status,
                          style: titleStyle,
                        ),
                        CustomTextField(
                            value: 'pupil.status!', style: valueStyle),
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
                          StringConstatns.reason,
                          style: titleStyle,
                        ),
                        CustomTextField(
                            value: 'pupil.reason!', style: valueStyle),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstatns.height,
                          style: titleStyle,
                        ),
                        CustomTextField(
                            value: 'pupil.height!', style: valueStyle),
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
                          StringConstatns.weight,
                          style: titleStyle,
                        ),
                        CustomTextField(
                            value: 'pupil.weight!', style: valueStyle),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                StringConstatns.fullNameParent,
                style: titleStyle,
              ),
              CustomTextField(
                  value: 'pupil.getFullNameParent()', style: valueStyle),
              Text(
                StringConstatns.homeAddress,
                style: titleStyle,
              ),
              CustomTextField(
                  value: pupil.homeAddress1!, style: valueStyle, numOfLine: 4),
            ],
          ),
        ),
      ),
    );
  }
}
