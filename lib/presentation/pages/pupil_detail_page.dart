import 'dart:convert';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/widgets/avatar_gender.dart';
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
      appBar: AppBar(
        elevation: 0.0,
        flexibleSpace: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/img_bg_detail_child_A.png'),
        fit: BoxFit.cover,
            ),
          ),
        ),
        centerTitle: true,
        title: LinearGradientMask(
              firstColor: Color(0xFF1D61F2),
              secondColor: Color(0xFF26ABFB),
              child: Text(
                pupil.getFullName(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontsConstants.notoSans,
                    fontSize: 20),
              ),
            ),
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
                      avatarMaleNull:'assets/images/img_child_avt_trai.png' ,
                    ),
                  ),
                SizedBox(height: 48.h),
                Text(
                  StringConstatns.fullName,
                  style: titleStyle,
                ),
                CustomTextFieldMenu(value: pupil.getFullName(), style: valueStyle),
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
                              value: Utils.formatDateTime(pupil.personDetail!.birthDate!) , style: valueStyle),
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
                          CustomTextFieldMenu(
                              value: pupil.className!, style: valueStyle),
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
                            StringConstatns.status,
                            style: titleStyle,
                          ),
                          CustomTextFieldMenu(
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
                          CustomTextFieldMenu(
                              value: 'pupil.reason!', style: valueStyle),
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
                            StringConstatns.height,
                            style: titleStyle,
                          ),
                          CustomTextFieldMenu(
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
                          CustomTextFieldMenu(
                              value: 'pupil.weight!', style: valueStyle),
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
                SizedBox(height: 12.h),
                Text(
                  StringConstatns.fullNameParent,
                  style: titleStyle,
                ),
                CustomTextFieldMenu(
                    value: pupil.getFullNameParent(), style: valueStyle),
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
                              value: pupil.currentPhoneNumber1Parent!, style: valueStyle),
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
                              value: pupil.currentPhoneNumber2Parent!, style: valueStyle),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  StringConstatns.homeAddress,
                  style: titleStyle,
                ),

                CustomTextField(
                    value: pupil.personDetail!.homeAddress1!, style: valueStyle, numOfLine: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
