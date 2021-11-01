import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/blocs/relationship_type/relationship_type_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ParentAddPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ParentAddPage();
}
class _ParentAddPage extends State<ParentAddPage>{
  String year = "";
  String month = "";
  String day = "";
  bool _enabled = true;
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String avatar = "";
  int pupilId = 2;
  int relationshipTypeID = -1;
  String relationshipTypeName = "";
  String relationshipTypeNameEN = "";
  bool isChecked = false;
  String fromDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now());
  List<RelationshipTypeModel> listRelationship = [];
  TextEditingController fullName = new TextEditingController();
  TextEditingController birthday = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController homeAddress = new TextEditingController();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController middleName = new TextEditingController();
  TextEditingController phoneNumber1 = new TextEditingController();
  TextEditingController phoneNumber2 = new TextEditingController();
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
        hideBack: true,
        title: TitlesAppBar.addUserToParent,
        actionBack: ()=>Navigator.pop(context),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<RelationshipTypeBloc>(
            create: (context) => injector<RelationshipTypeBloc>()..add(FetchRelationshipType()),
          ),
          BlocProvider<ParentsBloc>(
            create: (context) => injector<ParentsBloc>(),
          ),
        ],
        child: BlocBuilder<RelationshipTypeBloc, RelationshipTypeState>(
            builder: (context, state) {
              if (state is FetchRelationshipTypeSuccessState) {
                EasyLoading.dismiss();
                listRelationship = state.relationshipType!;
                return ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/bg_body_a.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              children: [
                                Avatar(
                                    avatar: avatar,
                                    avatarNull: "assets/images/img_avatar_null.png",
                                    callback: () => showBottomSheet(),
                                    enabled: _enabled
                                ),
                                TextFieldCustom(
                                  controller: fullName,
                                  title: StringConstatns.fullNameParent2,
                                  enabled: _enabled,
                                  typeTextField: "name",
                                  firstNameController: firstName,
                                  middleNameController: middleName,
                                  lastNameController: lastName,
                                ),
                                DropdownRelationship(
                                  listRelationship: listRelationship,
                                  title: StringConstatns.relationship,
                                  returnRelationShip: (int value, int index) {
                                    relationshipTypeID = listRelationship[index].personToPersonPersonalRelationshipTypeId!;
                                    relationshipTypeName = listRelationship[index].personToPersonPersonalRelationshipTypeName!;
                                    relationshipTypeNameEN = listRelationship[index].personToPersonPersonalRelationshipTypeNameEn!;
                                  },
                                ),
                                TextFieldCustom(
                                    controller: birthday,
                                    title: "Năm sinh",
                                    enabled: _enabled,
                                    typeTextField: "birthday",
                                    day: "$day",
                                    month: "$month",
                                    year: "$year",
                                    returnDay: (value) {day = value;},
                                    returnMonth: (value) {month = value;},
                                    returnYear: (value) {year = value;}),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: TextFieldCustom(
                                            title: StringConstatns.phoneNumber1,
                                            controller: phoneNumber1,
                                            keyboarType: "phone",
                                            enabled: _enabled),
                                      ),
                                    ),
                                    SizedBox(width: 25.w,),
                                    Expanded(
                                      child: Container(
                                        child: TextFieldCustom(
                                            title: StringConstatns.phoneNumber2,
                                            controller: phoneNumber2,
                                            keyboarType: "phone",
                                            enabled: _enabled),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 72),
                                  child: const Divider(
                                    color: Color(0xFFA693D9),
                                  ),
                                ),
                                TextFieldCustom(
                                    controller: email,
                                    title: "Email",
                                    enabled: _enabled),
                                TextFieldCustom(
                                  controller: homeAddress,
                                  title: "Địa chỉ",
                                  enabled: _enabled,
                                  typeTextField: "address",
                                ),
                                SizedBox(height: 24.h,),
                                Row(
                                  children: [
                                    (isChecked)
                                        ? IconButton(onPressed: (){setState(() {isChecked = false;});}, icon: SvgPicture.asset("assets/icons/ic_checkbox_selected.svg",height: 20.h,width: 20.w,))
                                        : IconButton(onPressed: (){setState(() {isChecked = true;});}, icon: SvgPicture.asset("assets/icons/ic_checkbox_none.svg",height: 20.h,width: 20.w,)),
                                    Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                              style: TextStyle(fontSize: 14,fontFamily: FontsConstants.notoSans),
                                              children: <TextSpan>[
                                                TextSpan(text: 'Tôi đã đọc và đồng ý với ',style: TextStyle(color: ColorConstants.neutralColor1)),
                                                TextSpan(
                                                    text: 'Điều khoản của Trường mầm non Duy Tân',
                                                    style: TextStyle(color: ColorConstants.secondaryColor2),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        print('Điều khoản của Trường mầm non Duy Tân');
                                                      }),
                                              ]
                                          ),
                                        )
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 50,bottom: 30),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomButtonBorder(
                                          text: "Hủy",
                                          width: 133,
                                          press: () {}
                                      ),
                                      Spacer(),
                                      BlocListener<ParentsBloc, ParentsState>(
                                        listener:(context, state)=> listenerPostParentState(context, state),
                                        child:CustomButtonText(
                                          text: "Gửi yêu cầu",
                                          width: 153,
                                          press: () {
                                            if(isChecked == true){
                                              postUserToParent(context);
                                            }else{
                                              WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa đồng ý với điều khoản"));
                                            }
                                          },
                                        ) ,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      ),
                    )
                );
              }
              else if (state is FetchRelationshipTypeFailureState) {
                EasyLoading.dismiss();
                return const SizedBox.shrink();
              } else {
                EasyLoading.show();
                return const SizedBox.shrink();
              }
            }
        ),

      ),
    );
  }
  Future postUserToParent(BuildContext context) async{
    if(relationshipTypeID == -1){
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa chọn mối quan hệ"));
    }else if(avatar == "") {
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa chọn hình ảnh đại điện"));
    }
    else if(phoneNumber1.text.trim() == "") {
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa nhập số điện thoại"));
    }
    else if(firstName.text.trim() == "") {
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa nhập tên"));
    }
    else if(lastName.text.trim() == "") {
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa nhập họ"));
    }
    else if(day== "" || month == "" || year == "") {
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa nhập năm sinh"));
    }
    else{
      final Map<String, dynamic> body = <String, dynamic>{
        "CURRENT_LAST_NAME": lastName.text.trim(),
        "CURRENT_FIRST_NAME": firstName.text.trim(),
        "CURRENT_MIDDLE_NAME":middleName.text.trim(),
        "CURRENT_PHONE_NUMBER_1": phoneNumber1.text.trim(),
        "CURRENT_PHONE_NUMBER_2": phoneNumber2.text.trim(),
        "CURRENT_EMAIL": email.text.trim(),
        "HOME_ADDRESS_1": homeAddress.text.trim(),
        "BIRTH_DATE": year + '-' + month + '-' + day + "T00:00:00.000Z",
        "TO_PUPIL_ID": pupilId,
        "PERSON_TO_PERSON_PERSONAL_RELATIONSHIP_TYPE_ID": relationshipTypeID,
        "PERSON_TO_PERSON_PERSONAL_RELATIONSHIP_TYPE_NAME": relationshipTypeName,
        "PERSON_TO_PERSON_PERSONAL_RELATIONSHIP_TYPE_NAME_EN": relationshipTypeNameEN,
        "FROM_DATE": fromDate,
        "AVATAR_PICTURE": avatar,
        "THRU_DATE": "",
        "NOTE": "",
        "NOTE_EN": ""
      };
     BlocProvider.of<ParentsBloc>(context).add(PostParentEvent(roleId: 1,body: body));
    }
  }
  void listenerPostParentState(BuildContext context, ParentsState state) {
    if (state is PostParentSuccessState) {
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildSuccessSnackbar(context, "Thêm người thân thành công"));
      int count = 0;
      Navigator.of(context).popUntil((_) => count++ >= 2);
    } else if (state is FetchParentsFailureState) {
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Thêm người thân thất bại"));
    } else {}
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

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _image = File(pickedFile!.path);
      final bytes = _image!.readAsBytesSync();
      String img64encode = base64.encode(bytes);
      avatar = img64encode;
      //bytesImage = base64.decode('$img64encode');
    });
  }
}