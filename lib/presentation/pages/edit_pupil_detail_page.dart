import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/core/widgets/textfield.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/common/helpers/my_behavior.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
class EditPupilDetailPage extends StatefulWidget{
  @override
  State<EditPupilDetailPage> createState() => _EditPupilDetailPage();

}
class _EditPupilDetailPage extends State<EditPupilDetailPage>{
  bool _enabled = true;
  String avatar = "";
  final ImagePicker _picker = ImagePicker();
  File? _image;
  Uint8List? bytesImage;
  TextEditingController _height = new TextEditingController();
  TextEditingController _weight = new TextEditingController();
  TextEditingController _fullName = new TextEditingController();
  TextEditingController _yearOfBirth = new TextEditingController();
  TextEditingController _firstName = new TextEditingController();
  TextEditingController _lastName = new TextEditingController();
  TextEditingController _middleName = new TextEditingController();
  String year = "";
  String month = "";
  String day = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WidgetAppBar(
        title: (AppLocalizations.of(context)!.profile),
    menuItem: [],
    hideBack: true,
    actionBack: () {
    Navigator.pop(context);
    },
    ),


    body: Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/img_bg_detail_child_B.png'),
            fit: BoxFit.fill
        ),
      ),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Avatar(
                  enabled: _enabled,
                  avatar: avatar,
                  avatarNull: "assets/images/img_avatar_null.png",
                  callback: () => showBottomSheet(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      TextFieldCustom(
                        controller: _fullName,
                        title: (AppLocalizations.of(context)!.fullName),
                        enabled: _enabled,
                        typeTextField: "name",
                        firstNameController: _firstName,
                        middleNameController: _middleName,
                        lastNameController: _lastName,
                      ),
                      TextFieldCustom(
                          controller: _yearOfBirth,
                          title: (AppLocalizations.of(context)!.birthday),
                          enabled: _enabled,
                          typeTextField: "birthday",
                          day: "$day",
                          month: "$month",
                          year: "$year",
                          returnDay: (value) {
                            day = value;
                          },
                          returnMonth: (value) {
                            month = value;
                          },
                          returnYear: (value) {
                            year = value;
                          }),
                      Row(
                          children: [
                        new Flexible(
                        child: TextFieldCustom(
                                controller: _height,
                                title: (AppLocalizations.of(context)!.childHeight),
                                enabled: _enabled,
                                typeTextField: "height",
                              )),
                            SizedBox(width: 24.w),
                            new Flexible(
                                child: TextFieldCustom(
                                  controller: _weight,
                                  title: (AppLocalizations.of(context)!.childWeight),
                                  enabled: _enabled,
                                  typeTextField: "weight",
                                )),

                              ]
                        ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 37),
                        child: Row(
                          children: [
                            CustomButtonBorder(
                              text: (AppLocalizations.of(context)!.cancel),
                              width: 135,
                              press: () {
                                setState(() {
                                  Navigator.pop(context);
                                  // getUserInit();
                                });
                              },
                            ),
                            Spacer(),
                            CustomButtonText(
                              text: (AppLocalizations.of(context)!.confirm),
                              width: 135,
                              press: () {
                                updatePupil();
                                // getUser().then((value) => updateProfile(value!.personId,value.userId));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),



    )
    );
  }
  Future showBottomSheet() {
    final decoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)));
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.transparent,
              child: Column(
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
                                          width: 1, color: Colors.black12))),
                              child: Center(
                                child: Text(
                                  "Chọn ảnh",
                                  style:
                                  EditProfileStyle.contentBottomshowStyle,
                                ),
                              ),
                            ),
                            onTap: () => takePhoto(ImageSource.gallery)),
                        InkWell(
                            child: Container(
                              height: 61,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Colors.black12))),
                              child: Center(
                                child: Text(
                                  "Chụp",
                                  style:
                                  EditProfileStyle.contentBottomshowStyle,
                                ),
                              ),
                            ),
                            onTap: () => takePhoto(ImageSource.camera)),
                      ],
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        width: double.infinity,
                        height: 61,
                        decoration: decoration,
                        child: Center(
                          child: Text(
                            "Đóng",
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorConstants.secondaryColor2,
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
              ));
        });
  }
  void updatePupil(){
    print(avatar);
    print(_lastName.text.trim());
    print(_firstName.text.trim());
    print(_middleName.text.trim());
    print(_height.text.trim());
    print(_weight.text.trim());
    print(  year + '-' + month + '-' + day + "T00:00:00.000Z");
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