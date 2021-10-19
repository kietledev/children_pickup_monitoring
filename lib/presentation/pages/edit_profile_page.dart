import 'dart:core';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/core/widgets/textfield.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/common/helpers/my_behavior.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfilePage extends StatefulWidget {
  // final Person? user;
  //  EditProfilePage({this.user});
  @override
  _EditProfilePage createState() => _EditProfilePage();

}

class _EditProfilePage extends State<EditProfilePage> {
  bool _enabled = false;
  Uint8List? bytesImage;
  String year = "";
  String month = "";
  String day = "";
  TextEditingController _fullname = new TextEditingController();
  TextEditingController _yearofbirth = new TextEditingController();
  TextEditingController _phone1 = new TextEditingController();
  TextEditingController _phone2 = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  TextEditingController _firstName = new TextEditingController();
  TextEditingController _lastName = new TextEditingController();
  TextEditingController _middleName = new TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     final user = ModalRoute.of(context)!.settings.arguments as Person;
      // _phone1.text= user.currentFirstName!;
      // day= Utils.formatDay(user.birthDate!);
      // month= Utils.formatMonth(user.birthDate!);
      // year = Utils.formatYear(user.birthDate!);

    return Scaffold(
      appBar: WidgetAppBar(
        title: TitlesAppBar.profileTitle,
        menuItem: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _enabled = true;
                });
              },
              child: Text(
                StringConstatns.editText,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontsConstants.notoSans,
                    color: ColorConstants.secondaryColor2,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
        press: (){
          Navigator.pop(context);
        },
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
              avatar(_enabled),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFieldCustom(controller:_yearofbirth,title: "Địa chỉ",enabled: _enabled,typeTextField: "birthday",day: "$day",month: "$month",),
                    TextFieldCustom(title: "Di động 1:", controller: _phone1,enabled: _enabled),
                    TextFieldCustom(title: "Di động 2:", controller: _phone2,enabled: _enabled),
                    TextFieldCustom(controller:_email,title: "email",enabled: _enabled),
                    TextFieldCustom(controller:_address,title: "Địa chỉ",enabled: _enabled,typeTextField: "address",),
                    _enabled ? Container(
                      margin: EdgeInsets.symmetric(vertical: 37),
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
                            width: 135,
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
  avatar(bool _enabled){
    return _enabled
        ? Center(
      child: InkWell(
        child: Stack(
          children: [
            Container(
              height: 112,
              width: 112,
              margin: EdgeInsets.fromLTRB(0, 34, 0, 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/img_border_avatar.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: CircleAvatar(
                    backgroundImage: bytesImage != null
                        ? MemoryImage(bytesImage!)
                        : AssetImage('assets/images/img_avatar_null.png') as ImageProvider),
              ),
            ),
            Positioned(
                right: -0,
                top: 35,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(50)),
                      color: ColorConstants.neutralColor6),
                  child: Container(
                    width: 24,
                    height: 24,
                    margin: EdgeInsets.symmetric(
                        horizontal: 8, vertical: 8),
                    child: SvgPicture.asset(
                      'assets/icons/ic_edit.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ))
          ],
        ),
        onTap: () {
          //showBottomSheet();
        },
      ),
    )
        : Center(
      child: Stack(
        children: [
          Container(
              height: 112,
              width: 112,
              margin: EdgeInsets.fromLTRB(0, 34, 0, 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/img_border_avatar.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 5, vertical: 5),
                child: CircleAvatar(
                    backgroundImage: bytesImage != null
                        ? MemoryImage(bytesImage!)
                        : AssetImage('assets/images/img_avatar_null.png') as ImageProvider
                ),
              )),
        ],
      ),
    );
  }
}
