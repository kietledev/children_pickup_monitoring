import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/blocs/relationship_type/relationship_type_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ParentDetailsPage extends StatefulWidget {
  @override
  State<ParentDetailsPage> createState() => _ParentDetails();
}

class _ParentDetails extends State<ParentDetailsPage> {
  ParentModel? parent;
  bool _enabled = false;
  bool _enabledRelationship = false;
  bool _enabledButton= false;
  bool? approved;
  String avatar = "";
  Uint8List? bytesImage;
  bool? checkUser;
  int relationshipTypeID = -1;
  String relationshipTypeName = "";
  String relationshipTypeNameEN = "";
  List<RelationshipTypeModel> listRelationship = [];
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
          hideBack: true,
        title: (AppLocalizations.of(context)!.detail),
       // menuItem: [itemButtonRightAppBar()],
        actionBack: () => Navigator.pop(context),
    ),
      body: MultiBlocProvider(
          providers: [
            BlocProvider<RelationshipTypeBloc>(
              create: (context) =>
              injector<RelationshipTypeBloc>()..add(FetchRelationshipType()),
            ),
            BlocProvider<ParentsBloc>(
              create: (context) => injector<ParentsBloc>(),
            ),
          ], child: BlocBuilder<RelationshipTypeBloc, RelationshipTypeState>(
          builder: (context, state) {
            if (state is FetchRelationshipTypeSuccessState) {
              EasyLoading.dismiss();
              listRelationship = state.relationshipType!;
              return Container(
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
                                ? Text((AppLocalizations.of(context)!.confirm),style:Utils.setStyle(color: ColorConstants.secondaryColor4,size: 12),)
                                : Text((AppLocalizations.of(context)!.notVerified),style:Utils.setStyle(color: ColorConstants.neutralColor2,size: 12))
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: Column(
                            children: [
                              TextFieldCustom(
                                controller: _fullName,
                                title: (AppLocalizations.of(context)!.fullName),
                                enabled: _enabled,
                              ),
                              (_enabledRelationship) ? DropdownRelationship(
                                listRelationship: listRelationship,
                                title: StringConstatns.relationship,
                                returnRelationShip: (int value, int index) {
                                  relationshipTypeID = listRelationship[index].personToPersonPersonalRelationshipTypeId!;
                                  relationshipTypeName = listRelationship[index].personToPersonPersonalRelationshipTypeName!;
                                  relationshipTypeNameEN = listRelationship[index].personToPersonPersonalRelationshipTypeNameEn!;
                                },
                              )
                                         : TextFieldCustom(
                                  title: (AppLocalizations.of(context)!.relationship),
                                  controller: _relationship,
                                  enabled: _enabledRelationship),
                              TextFieldCustom(
                                  title: (AppLocalizations.of(context)!.birthday),
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
                                          title:(AppLocalizations.of(context)!.phone1),
                                          controller: _phone1,
                                          enabled: _enabled),
                                    ),
                                  ),
                                  SizedBox(width: 25.w,),
                                  Expanded(
                                    child: Container(
                                      child: TextFieldCustom(
                                          title: (AppLocalizations.of(context)!.phone2),
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
                                title: (AppLocalizations.of(context)!.address),
                                enabled: _enabled,
                                typeTextField: "address",
                              ),
                              _enabledButton
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
                                          _enabledRelationship = false;
                                          _enabledButton = false;
                                        });
                                      },
                                    ),
                                    Spacer(),
                                    CustomButtonText(
                                      text: ButtonConstatns.sentPickUp,
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
      )
      )
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
         checkUser = parent!.accountUser!;
         // print(parent!.parentId!);
         // print(parent!.personDetail!.personId!);
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
  Widget itemButtonRightAppBar() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: _enabled
            ? null
            : TextButton(
          onPressed: () {
           if(checkUser == false){
             setState(() {
               _enabled = true;
               _enabledRelationship = true;
               _enabledButton = true;
             });
           }else {
            setState(() {
              _enabledRelationship = true;
              _enabledButton = true;
            });
           }
          },
          child: Text((AppLocalizations.of(context)!.edit),
              style: AppBarStyle.textButtonRightStyle),
        ));
  }
}
