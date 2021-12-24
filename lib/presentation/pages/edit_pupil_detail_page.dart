import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:typed_data';
import 'package:children_pickup_monitoring/domain/entities/pupil.dart';
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
  const EditPupilDetailPage({Key? key}) : super(key: key);
  @override
  State<EditPupilDetailPage> createState() => _EditPupilDetailPage();
}
class _EditPupilDetailPage extends State<EditPupilDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(
        providers: [

          BlocProvider<PupilsBloc>(
            create: (context) => injector<PupilsBloc>(),
          ),
        ],
        child: EditPupilDetailBody()
    );
  }
}
class EditPupilDetailBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _EditPupilDetailBody();
  }
}

class _EditPupilDetailBody extends State<EditPupilDetailBody>{
  Pupil? pupil ;
  Pupil? pupilReturn;
  bool _enabled = true;
  String avatar = "";
  final ImagePicker _picker = ImagePicker();
  File? _image;
  Uint8List? bytesImage;
  TextEditingController _height = new TextEditingController();
  TextEditingController _weight = new TextEditingController();
  TextEditingController _yearOfBirth = new TextEditingController();
  String year = "";
  String month = "";
  String day = "";
  int roleId = -1;
  int personId = -1;
  int classId = -1;
  int userId = -1;
  // int classId = -1;
  UserModel? userModel;
  @override
  void initState() {
    super.initState();
    getPupilInit();
    init();
  }
  init() async{
    userModel = await getUser();
    classId = await getClassID();
    setState(() {
      roleId = userModel!.roleId;
      personId = userModel!.personId;
      classId = classId;
      userId = userModel!.userId;
    });
  }
  void updatePupil(int pupil) {
    if (roleId == 2) {
      String currentDate = DateTime.now().toString();
      final Map<String, dynamic> body = <String, dynamic>{
        "date": currentDate,
        "CLASS_ID": classId,
        "LOGIN_USER_ID": userId,
        "BIRTH_DATE": year + '-' + month + '-' + day + "T00:00:00.000Z",
        "PUPIL_WEIGHT": _weight.text.trim(),
        "PUPIL_HEIGHT": _height.text.trim(),
        "AVATAR_PICTURE": avatar
      };
      print(body);
      BlocProvider.of<PupilsBloc>(context)
          .add(PostUpdateProfilePupil(pupilId: pupil, roleId: roleId,body: body));

    }
  }


  void getPupilInit() {
    Future.delayed(Duration.zero, (){
      pupil = ModalRoute
          .of(context)!
          .settings
          .arguments as Pupil;
      if (pupil != null){
        _yearOfBirth.text = pupil!.personDetail!.birthDate!;
        day = Utils.formatDay(pupil!.personDetail!.birthDate!);
        month = Utils.formatMonth(pupil!.personDetail!.birthDate!);
        year = Utils.formatYear(pupil!.personDetail!.birthDate!);
        _yearOfBirth.text = Utils.formatDateTime('${pupil!.personDetail!.birthDate ?? ""}');
        avatar = pupil!.personDetail!.avatarPicture!;
        _height.text = pupil!.pupilHeight!.toString();
        _weight.text =  pupil!.pupilWeight!.toString();
      }
    });
    }
  @override
  Widget build(BuildContext context) {
    pupil = ModalRoute
        .of(context)!
        .settings
        .arguments as Pupil;
   if(pupilReturn == null){
     pupilReturn = pupil;
   }
    return Scaffold(
        appBar: WidgetAppBar(
        title: pupil!.getFullName(),
        menuItem: [],
        hideBack: true,
        actionBack: () {
        Navigator.pop(context,pupilReturn);
        },
        ),
      body: MultiBlocListener(
        listeners: [
            BlocListener<PupilsBloc,PupilsState>(listener: (context,state) =>listenerEditPupilState(context, state))
          ],
          child: Container(
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

                          SizedBox(height: 48.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              (AppLocalizations.of(context)!.fullName),
                              style: ProfileStyle.contentStyle2,
                            ),
                          ),
                          CustomTextFieldMenu(
                              value: pupil!.getFullName(), style: QRCodeStyle.contentStyle2),

                          TextFieldCustom(
                              controller: _yearOfBirth,
                              title: (AppLocalizations.of(context)!.birthday),
                              enabled: _enabled,
                              typeTextField: "birthday",
                              day: Utils.formatDay(pupil!.personDetail!.birthDate!),
                              month: Utils.formatMonth(pupil!.personDetail!.birthDate!),
                              year: Utils.formatYear(pupil!.personDetail!.birthDate!),
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
                                      // Navigator.pop(context);
                                      getPupilInit();
                                    });
                                  },
                                ),
                                Spacer(),
                                CustomButtonText(
                                  text: (AppLocalizations.of(context)!.confirm),
                                  width: 135,
                                  press: () {
                                    updatePupil(pupil!.pupilId!);
                                    EasyLoading.show();
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
    )),
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
  void listenerEditPupilState(BuildContext context, PupilsState state) {
    if (state is FetchPupilsLoadingState) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
      if (state is FetchPupilsSuccessState) {
        pupilReturn = state.pupils![0];
        _yearOfBirth.text =
            Utils.formatDateTime('${state.pupils![0].personDetail!.birthDate ?? ""}');
        _height.text = state.pupils![0].pupilHeight.toString();
        _weight.text = state.pupils![0].pupilWeight.toString();
        WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildSuccessSnackbar(context, "Cập nhật thông tin thành công"));
        setState(() {
            _enabled = false;
        });
      } else if (state is FetchPupilsFailureState) {
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