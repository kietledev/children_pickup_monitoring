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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class PupilDetailsPage extends StatefulWidget {
  const PupilDetailsPage({Key? key}) : super(key: key);

  @override
  State<PupilDetailsPage> createState() => _PupilDetailsState();
  // @override
  // Widget build(BuildContext context) {
  //   final pupil = ModalRoute.of(context)!.settings.arguments as Pupil;
  //   return Scaffold(
  //     appBar: AppBar(
  //       elevation: 0.0,
  //       flexibleSpace: Container(
  //       decoration: BoxDecoration(
  //       image: DecorationImage(
  //       image: AssetImage('assets/images/img_bg_detail_child_A.png'),
  //       fit: BoxFit.cover,
  //           ),
  //         ),
  //       ),
  //       centerTitle: true,
  //       title: LinearGradientMask(
  //             firstColor: Color(0xFF1D61F2),
  //             secondColor: Color(0xFF26ABFB),
  //             child: Text(
  //               pupil.getFullName(),
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.w600,
  //                   fontFamily: FontsConstants.notoSans,
  //                   fontSize: 20),
  //             ),
  //           ),
  //         ),
  //     body: PupilDetailsBody(
  //       pupil: pupil,
  //     ),
  //   );
  // }


}

class _PupilDetailsState extends State<PupilDetailsPage> {
  bool _enabled = false;




  @override
  Widget build(BuildContext context) {
    final pupil = ModalRoute
        .of(context)!
        .settings
        .arguments as Pupil;
    bool _enabled = false;
    return Scaffold(
        appBar: WidgetAppBar(
        title: (AppLocalizations.of(context)!.profile),
    menuItem: [itemButtonRightAppBar()],
    hideBack: true,
    actionBack: () {
    Navigator.pop(context);
    },
    ),


     body: SingleChildScrollView(
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
                            CustomTextFieldMenu(
                                value: pupil
                                    .pupilToPupilStatusRelationshipTypeName!,
                                style: QRCodeStyle.contentStyle2),
                          ],
                        ),
                      ),
                      SizedBox(width: 24.w),
                      Expanded(
                        flex: 1,
                        child: pupil.pupilToPupilStatusRelationshipTypeName! ==
                            "Hiện diện" ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          ],
                        ) : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (AppLocalizations.of(context)!.reason),
                              style:  ProfileStyle.contentStyle2,
                            ),
                            CustomTextFieldMenu(
                                value: pupil.reason!, style: QRCodeStyle.contentStyle2),
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
                              (AppLocalizations.of(context)!.childHeight),

                              style:  ProfileStyle.contentStyle2,
                            ),
                            CustomTextFieldMenu(
                                value: pupil.pupilHeight!.toString() + " cm",
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
                              (AppLocalizations.of(context)!.childWeight),
                              style:  ProfileStyle.contentStyle2,
                            ),
                            CustomTextFieldMenu(
                                value: pupil.pupilWeight!.toString(),
                                style: QRCodeStyle.contentStyle2),
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
                    (AppLocalizations.of(context)!.fullNameParent),
                    style:  ProfileStyle.contentStyle2,
                  ),
                  CustomTextFieldMenu(
                      value: pupil.getFullNameParent(), style: QRCodeStyle.contentStyle2),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (AppLocalizations.of(context)!.phone1),
                              style:  ProfileStyle.contentStyle2,
                            ),
                            CustomTextFieldMenu(
                                value: pupil.currentPhoneNumber1Parent!,
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
                              (AppLocalizations.of(context)!.phone2),
                              style:  ProfileStyle.contentStyle2,
                            ),
                            CustomTextFieldMenu(
                                value: pupil.currentPhoneNumber2Parent!,
                                style: QRCodeStyle.contentStyle2),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    (AppLocalizations.of(context)!.address),
                    style:  ProfileStyle.contentStyle2,
                  ),

                  CustomTextField(
                      value: pupil.personDetail!.homeAddress1!,
                      style: QRCodeStyle.contentStyle2,
                      numOfLine: 4),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget itemButtonRightAppBar() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: _enabled
            ? null
            : TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteConstants.editPupilDetail);

          },
          child: Text((AppLocalizations.of(context)!.edit),
              style: AppBarStyle.textButtonRightStyle),
        ));
  }
}
