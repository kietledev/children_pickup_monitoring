import 'dart:convert';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ParentDetailsPage extends StatefulWidget {
  @override
  State<ParentDetailsPage> createState() => _ParentDetails();
}

class _ParentDetails extends State<ParentDetailsPage> {
  ParentModel? parent;
  bool _enabled = false;
  bool? approved;
  String avatar = "";
  Uint8List? bytesImage;
  TextEditingController _fullName = new TextEditingController();
  TextEditingController _yearOfBirth = new TextEditingController();
  TextEditingController _phone1 = new TextEditingController();
  TextEditingController _phone2 = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  TextEditingController _relationship = new TextEditingController();

  @override
  void initState() {
    getUserInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
        title: TitlesAppBar.parentDetail,
        actionBack:() => Navigator.pop(context),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_body_a.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Avatar(
                  enabled: _enabled,
                  avatar: avatar,
                  avatarNull: "assets/images/img_avatar_null.png",
                  // callback: () => showBottomSheet(),
                ),
               Padding(
                   padding: EdgeInsets.only(top: 8.h),
                   child: (approved == true)
                       ? Text("Đã xác nhận",style:Utils.setStyle(color: ColorConstants.secondaryColor4,size: 12),)
                       : Text("Chưa xác nhận",style:Utils.setStyle(color: ColorConstants.neutralColor2,size: 12))
               ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(
                    children: [
                      TextFieldCustom(
                        controller: _fullName,
                        title: StringConstatns.fullName,
                        enabled: _enabled,
                      ),
                      TextFieldCustom(
                          title: StringConstatns.relationship,
                          controller: _relationship,
                          enabled: _enabled),
                      TextFieldCustom(
                          title: StringConstatns.yearOfBirth,
                          controller: _yearOfBirth,
                          enabled: _enabled),
                      SizedBox(height: 24.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 72),
                        child: const Divider(
                          color: Color(0xFFA693D9),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: TextFieldCustom(
                                  title: StringConstatns.phoneNumber1,
                                  controller: _phone1,
                                  enabled: _enabled),
                            ),
                          ),
                          SizedBox(width: 25.w,),
                          Expanded(
                            child: Container(
                              child: TextFieldCustom(
                                  title: StringConstatns.phoneNumber2,
                                  controller: _phone2,
                                  enabled: _enabled),
                            ),
                          ),
                        ],
                      ),
                      TextFieldCustom(
                          title: StringConstatns.email,
                          controller: _email,
                          enabled: _enabled),
                      TextFieldCustom(
                        controller: _address,
                        title: StringConstatns.homeAddress,
                        enabled: _enabled,
                        typeTextField: "address",
                      ),
                      _enabled
                          ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 37),
                        child: Row(
                          children: [
                            CustomButtonBorder(
                              text: "Hủy",
                              width: 135,
                              press: () {
                                setState(() {
                                  _enabled = false;
                                  // initUser();
                                });
                              },
                            ),
                            Spacer(),
                            CustomButtonText(
                              text: "Xác nhận",
                              width: 135.h,
                              press: () {

                              },
                            )
                          ],
                        ),
                      )
                          : Container(
                        height: 48,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void getUserInit() {
    Future.delayed(Duration.zero, () {
      parent = ModalRoute.of(context)!.settings.arguments as ParentModel?;
      if (parent != null) {
         _fullName.text = parent!.getFullName();
         _relationship.text = parent!.personToPersonPersonalRelationshipTypeName!;
         _phone1.text = parent!.personDetail!.currentPhoneNumber1!;
         _yearOfBirth.text = Utils.formatDateTime('${parent?.personDetail?.birthDate}');
         _email.text = parent!.personDetail!.currentEmail!;
         _address.text = parent!.personDetail!.homeAddress1!;
         approved = parent!.approved!;
         bytesImage = base64.decode('${parent!.personDetail!.avatarPicture!}');
        // day = Utils.formatDay(user!.birthDate!);
        // month = Utils.formatMonth(user!.birthDate!);
        // year = Utils.formatYear(user!.birthDate!);
        // _yearOfBirth.text = Utils.formatDateTime('${user?.birthDate ?? ""}');
        avatar = parent!.personDetail!.avatarPicture!;
        setState(() {
          bytesImage = base64.decode('${parent!.personDetail!.avatarPicture!}');
        });
      }
    });
  }
}
