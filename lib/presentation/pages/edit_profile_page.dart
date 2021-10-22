import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/core/widgets/textfield.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/common/helpers/my_behavior.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {

  @override
  _EditProfilePage createState() => _EditProfilePage();

}

class _EditProfilePage extends State<EditProfilePage> {
  bool _enabled = false;
  Uint8List? bytesImage;
  String year = "";
  String month = "";
  String day = "";
  PersonModel? user;
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String avatar = "";
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
  Future.delayed(Duration.zero,(){
    setState(() {
      user = ModalRoute.of(context)!.settings.arguments as PersonModel?;
      if(user != null) {
        _firstName.text = user!.currentFirstName!;
        _middleName.text = user!.currentMiddleName!;
        _lastName.text = user!.currentLastName!;
        _firstName.text = user!.currentFirstName!;
        _fullname.text = user!.getFullName();
        _phone1.text = user!.currentPhoneNumber1!;
        _yearofbirth.text=user!.birthDate!;
        _email.text=user!.currentEmail!;
        _address.text=user!.homeAddress1!;
        day= Utils.formatDay(user!.birthDate!);
        month= Utils.formatMonth(user!.birthDate!);
        year = Utils.formatYear(user!.birthDate!);
        bytesImage = base64.decode('${user!.avatarPicture!}');
      }
    });
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                style: AppBarStyle.textButtonRightStyle
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
              Avatar(
                enabled: _enabled,
                bytesImage: bytesImage,
                callback:() => showBottomSheet(),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFieldCustom(controller:_fullname,title: "Họ và Tên",enabled: _enabled,typeTextField: "name",firstNameController: _firstName,middleNameController: _middleName,lastNameController: _lastName,),
                    TextFieldCustom(controller:_yearofbirth,title: "Năm sinh",enabled: _enabled,typeTextField: "birthday",day: "$day",
                      month: "$month",year: "$year", returnDay:(value){day =value;},returnMonth: (value){month=value;},returnYear:(value){year =value;}),
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
                               setState(() {
                                 print(day);
                                 print(month);
                                 print(year);
                               });
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
  Future showBottomSheet() {
  final decoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10)));
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.transparent,
              child:Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    height: 122,
                    decoration: decoration,
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                            height: 61,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color:
                                        Colors.black12))),
                            child: Center(
                              child: Text(
                                "Chọn ảnh",
                                style: EditProfileStyle.contentBottomshowStyle,
                              ),
                            ),
                          ),
                          onTap: ()=> takePhoto(ImageSource.gallery)
                        ),
                        InkWell(
                          child: Container(
                            height: 61,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Colors.black12))),
                            child: Center(
                              child: Text(
                                "Chụp",
                                style: EditProfileStyle.contentBottomshowStyle,),
                            ),
                          ),
                          onTap: ()=>takePhoto(ImageSource.camera)
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding:
                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        width: double.infinity,
                        height: 61,
                        decoration: decoration,
                        child: Center(
                          child: Text(
                            "Đóng",
                            style: TextStyle(
                                fontSize: 18,
                                color:ColorConstants.secondaryColor2 ,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )
          );
        });
  }
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _image = File(pickedFile!.path);
      final bytes = _image!.readAsBytesSync();
      String img64encode = base64.encode(bytes);
      avatar = img64encode;
      bytesImage = base64.decode('$img64encode');
    });
  }

}