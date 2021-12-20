import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:typed_data';
import 'package:children_pickup_monitoring/common/constants/color_constants.dart';
import 'package:children_pickup_monitoring/common/helpers/preferences.dart';
import 'package:children_pickup_monitoring/data/models/class_room_model.dart';
import 'package:children_pickup_monitoring/data/models/staff_class_detail_model.dart';
import 'package:children_pickup_monitoring/domain/entities/staff_class_detail.dart';
import 'package:children_pickup_monitoring/presentation/blocs/class_room/class_room_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/item_class_room_by_teacherId.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePage createState() => _EditProfilePage();
}

class _EditProfilePage extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(
        providers: [
        BlocProvider(create:
            (context) => injector<ProfileBloc>(), child: EditProfileBody()
        ),
          // BlocProvider<ClassRoomBloc>(
          //   create: (context) => injector<ClassRoomBloc>()..add(GetListClassByTeacherId(personId: 104)),
          // ),
          BlocProvider<ClassRoomBloc>(
            create: (context) => injector<ClassRoomBloc>()..add(GetListClassRoom(page: 1,pageSize: 10)),
          ),
        ],
        child: EditProfileBody()
    );
    }
}

class EditProfileBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditProfileBody();
  }
}

class _EditProfileBody extends State<EditProfileBody> {
  bool _enabled = false;
  Uint8List? bytesImage;
  String year = "";
  String month = "";
  String day = "";
  PersonModel? user;
  UserModel? userModel;
  int roleId = -1;
  bool canScroll = true;
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String avatar = "";
  List<int> listClassID = [];
  List<int> listClassRoomSelected = [];
  List<ClassRoomModel> listClassRoom = [];
  List<StaffClassDetail> listStaffClassDetail =[];
  List<int> listClassId=[];
  TextEditingController _fullName = new TextEditingController();
  TextEditingController _yearOfBirth = new TextEditingController();
  TextEditingController _phone1 = new TextEditingController();
  TextEditingController _phone2 = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  TextEditingController _firstName = new TextEditingController();
  TextEditingController _lastName = new TextEditingController();
  TextEditingController _middleName = new TextEditingController();
  TextEditingController _position = new TextEditingController();
  TextEditingController _staffId = new TextEditingController();
  final pref = Preferences();
  @override
  void initState() {
    getUserInit();
   pref.setIsScroll(true);
    getUserId();
    super.initState();
  }
  getUserId() async {
    userModel = await getUser();
    roleId = userModel!.roleId;
  }

  @override
  Widget build(BuildContext context) {
    pref.getIsScroll().then((value){
      setState(() {
       canScroll = value!;
      });
    });
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
        title: (AppLocalizations.of(context)!.profile),
        menuItem: [itemButtonRightAppBar()],
        hideBack: true,
        actionBack: () {
          Navigator.pop(context);
        },
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ClassRoomBloc,ClassRoomState>(
            listener: (context,state){
              if (state is FetchClassRoomLoadingState) {
                EasyLoading.show();
              } else {
                EasyLoading.dismiss();
                if (state is ClassRoomsSuccessState) {
                  setState(() {
                    //print(state.classRooms!.length);
                    listClassRoom = state.classRooms!;
                  });
                }
                // if (state is FetchClassRoomByTeacherSuccessState) {
                //   setState(() {
                //     print(state.classRoomsTeacher!.length);
                //     // listClassRoom = state.classRooms!;
                //   });
                // }
                  else if (state is FetchClassRoomFailureState) {
                  print("Loix");
                  UiHelper.showMyDialog(
                    context: context,
                    content: state.msg ?? "This is something wrong",
                  );
                } else {}
              }
            },
          ),
          BlocListener<ProfileBloc,ProfileState>(listener: (context,state) =>listenerEditProfileState(context, state))
        ],
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_body_a.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              physics: canScroll ? BouncingScrollPhysics()
                                 : NeverScrollableScrollPhysics(),
              child: Column(
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
                        SizedBox(height: 24,),
                        (roleId == 1)
                            ? SizedBox.shrink()
                            :  TextFieldCustom(controller: _staffId, title: "Mã cán bộ:", enabled: false),
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
                        (roleId == 1)
                            ? SizedBox.shrink()
                            : TextFieldCustom(controller: _position, title: "Chức vụ:", enabled: false),
                        (roleId == 1)
                            ? SizedBox.shrink()
                            : ItemClassRoomByTeacherId(
                          listClassRoom: listClassRoom,
                          title: 'Lớp đang dạy',
                          enabled: _enabled,
                          listStaffClassDetail: listStaffClassDetail,
                          onSelect: (List<int> value) {
                           setState(() {
                             listClassRoomSelected = value;
                           });
                          },
                        ),
                        SizedBox(height: 24,),
                        Container(
                           height: 1,
                           margin: EdgeInsets.symmetric(horizontal: 72),
                          color: ColorConstants.lineColor,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFieldCustom(
                                  title: (AppLocalizations.of(context)!.phone1),
                                  controller: _phone1,
                                  enabled: _enabled),
                            ),
                            SizedBox(width: 25,),
                            Expanded(
                              flex: 1,
                              child: TextFieldCustom(
                                  title: (AppLocalizations.of(context)!.phone2),
                                  controller: _phone2,
                                  enabled: _enabled),
                            )
                          ],
                        ),
                        TextFieldCustom(
                            title: (AppLocalizations.of(context)!.email),
                            controller: _email,
                            enabled: _enabled),
                        TextFieldCustom(
                          controller: _address,
                          title: (AppLocalizations.of(context)!.address),
                          enabled: _enabled,
                          typeTextField: "address",
                        ),
                        _enabled
                            ? Padding(
                          padding: EdgeInsets.symmetric(vertical: 37),
                          child: Row(
                            children: [
                              CustomButtonBorder(
                                text: (AppLocalizations.of(context)!.cancle),
                                width: 135,
                                press: () {
                                  setState(() {
                                    _enabled = false;
                                    getUserInit();
                                  });
                                },
                              ),
                              Spacer(),
                              CustomButtonText(
                                text: (AppLocalizations.of(context)!.confirm),
                                width: 135,
                                press: () {
                                  getUser().then((value) => updateProfile(value!.personId,value.userId,roleId));
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
      )
    );
  }

  void updateProfile(int personID,int userId,int roleId) {
    if(roleId == 2){
     if(listClassRoomSelected.isEmpty){
       for(int i = 0; i <listStaffClassDetail.length;i++){
         listClassId.add(listStaffClassDetail[i].classId!.toInt());
       }
     }else{
       listClassId = listClassRoomSelected;
     }
    }else{
      listClassId = [0];
    }
    final Map<String, dynamic> body = <String, dynamic>{
      "USER_ID": userId,
      "CURRENT_LAST_NAME": _lastName.text.trim(),
      "CURRENT_FIRST_NAME": _firstName.text.trim(),
      "CURRENT_MIDDLE_NAME": _middleName.text.trim(),
      "HOME_ADDRESS_1": _address.text.trim(),
      "CURRENT_EMAIL": _email.text.trim(),
      "CURRENT_PHONE_NUMBER_1": _phone1.text.trim(),
      "CURRENT_PHONE_NUMBER_2": _phone2.text.trim(),
      "BIRTH_DATE": year + '-' + month + '-' + day + "T00:00:00.000Z",
      "AVATAR_PICTURE": avatar,
      "listClassID": listClassId,
    };
    if (_email.text != "") {
      if (Validators.validateEmail(_email.text) == true) {
        BlocProvider.of<ProfileBloc>(context)
            .add(PostProfileEvent(personId: personID, body: body, roleId: 1));
      } else {
        WidgetsBinding.instance!.addPostFrameCallback((_) =>
            CustomWidgetsSnackBar.buildErrorSnackbar(
                context, "Bạn nhập không đúng email"));
      }
    } else {
      BlocProvider.of<ProfileBloc>(context)
          .add(PostProfileEvent(personId: personID, body: body,roleId: 1));
    }
  }

  void getUserInit() {
    Future.delayed(Duration.zero, () {
      user = ModalRoute.of(context)!.settings.arguments as PersonModel?;
      if (user != null) {
        _firstName.text = user!.currentFirstName!;
        _middleName.text = user!.currentMiddleName!;
        _lastName.text = user!.currentLastName!;
        _firstName.text = user!.currentFirstName!;
        _fullName.text = user!.getFullName();
        _phone1.text = user!.currentPhoneNumber1!;
        _yearOfBirth.text = user!.birthDate!;
        _email.text = user!.currentEmail!;
        _address.text = user!.homeAddress1!;
        day = Utils.formatDay(user!.birthDate!);
        month = Utils.formatMonth(user!.birthDate!);
        year = Utils.formatYear(user!.birthDate!);
        _position.text = "Giáo viên";
        _staffId.text = user!.staffId!.toString();
        _yearOfBirth.text = Utils.formatDateTime('${user?.birthDate ?? ""}');
        avatar = user!.avatarPicture!;
        setState(() {
          bytesImage = base64.decode('${user!.avatarPicture!}');
          listStaffClassDetail = user!.staffClassDetail!;
        });
      }
    });
  }

  void listenerEditProfileState(BuildContext context, ProfileState state) {
    if (state is ProfileLoadingState) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
      if (state is ProfileSuccessState) {
        _yearOfBirth.text =
            Utils.formatDateTime('${state.person?.birthDate ?? ""}');
        _fullName.text = state.person!.getFullName();
        WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildSuccessSnackbar(context, "Cập nhật thông tin thành công"));
        setState(() {
          _enabled = false;
        });
      } else if (state is ProfileFailureState) {
        WidgetsBinding.instance!.addPostFrameCallback((_) =>
            CustomWidgetsSnackBar.buildErrorSnackbar(
                context, "Cập nhật không thành công"));
        UiHelper.showMyDialog(
          context: context,
          content: state.msg ?? "This is something wrong",
        );
      } else {}
    }
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
      bytesImage = base64.decode('$img64encode');
    });
  }

  Widget itemButtonRightAppBar() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: _enabled
            ? null
            : TextButton(
                onPressed: () {
                  setState(() {
                    _enabled = true;
                  });
                },
                child: Text((AppLocalizations.of(context)!.edit),
                    style: AppBarStyle.textButtonRightStyle),
              ));
  }
}
