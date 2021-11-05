import 'package:children_pickup_monitoring/common/constants/color_constants.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
class AddUserToParent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddUserToParent();
}
class _AddUserToParent extends State <AddUserToParent>{
  int currentIndex = -1;
  List<UserByPersonModel> listUsers = [];
  List<UserByPersonModel> _searchResult = [];
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    bool listItemsExist =(listUsers.length > 0 || _searchResult.length > 0);
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
        hideBack: true,
        title: 'Thêm mới',
        actionBack: ()=>Navigator.pop(context),
      ),
      body: BlocProvider(
          create: (context) => injector<UsersBloc>()..add(FetchUsers(page: 1, pageSize: 10)),
          child:BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
            if (state is FetchUsersSuccessState) {
              EasyLoading.dismiss();
             listUsers = state.users!;
              return  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_body_a.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                  child: Column(
                    children: [
                      textFieldSearch(),
                      SizedBox(height: 30.h),
                      (_searchResult.length != 0)
                      ? Expanded(
                       child:  ListView.builder(
                           primary: false,
                           itemCount:_searchResult.length ,
                           itemBuilder: (context,index){
                             final items = _searchResult[index];
                             return ItemUserListView(
                                 index: index,
                                 isSelected:currentIndex == index ,
                                 avatar: items.personDetail!.avatarPicture.toString(),
                                 fullName: items.personDetail!.getFullName(),
                                 phoneNumber1: items.personDetail!.currentPhoneNumber1!,
                                 user: items,
                                 onSelect: (){
                                  Navigator.pushNamed(context, RouteConstants.formAddUserToParent,arguments: items);
                                 },
                               );
                           }
                       ),
                     )
                      :Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                                (searchController.text.isNotEmpty)
                                    ? Text('Chúng tôi không tìm thấy kết quả?',style:AddUserToParentStyle.contentStyle)
                                    :Text('Nhập vào số điện thoại tìm kiếm hoặc',style: AddUserToParentStyle.contentStyle ),
                                TextButton(
                                    onPressed: (){
                                      Navigator.pushNamed(context, RouteConstants.parentAdd);
                                    },
                                    child: Text('Thêm mới',style: AddUserToParentStyle.buttonTextStyle)
                                )
                              ],
                            ),


                    ],
                  ),
                ),
              );
            } else if (state is FetchUsersFailureState) {
              EasyLoading.dismiss();
              return const SizedBox.shrink();
            } else {
              EasyLoading.show();
              return const SizedBox.shrink();
            }
          })
      ),
    );
  }

   onSearchTextChanged(String text) async {
     _searchResult.clear();
     if (text.isEmpty) {
       return;
     }
    setState(() {
      listUsers.forEach((user) {
        if (user.personDetail!.currentPhoneNumber1.toString() == text) _searchResult.add(user);
      });
    });
  }
  Widget textFieldSearch(){
    return Container(
      height: 36,
      decoration: BoxDecoration(
          color: ColorConstants.neutralColor4,
          borderRadius:
          BorderRadius.all(Radius.circular(10))),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: searchController,
        onChanged: onSearchTextChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstants.neutralColor4,
          contentPadding: EdgeInsets.symmetric(horizontal: 6),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstants.neutralColor4, width: 2),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstants.neutralColor4, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstants.neutralColor4, width: 2),
          ),
          hintText: "Tìm theo số điện thoại",
          hintStyle: TextStyle(color: ColorConstants.neutralColor2,fontFamily: FontsConstants.notoSans,fontSize: 16),
          prefixIcon:Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: SvgPicture.asset(
                'assets/icons/ic_search.svg',
                height: 16,
                width: 16,
              ),
            ),
        ),
      ),
    );
  }
}

class FormAddUserToParent extends StatefulWidget{
  State<StatefulWidget> createState() => _FormAddUserToParent();
}
class _FormAddUserToParent extends State<FormAddUserToParent>{
  UserByPersonModel? user;
  String avatar = "";
  int relationshipTypeID = -1;
  String relationshipTypeName = "";
  String relationshipTypeNameEN = "";
  String email = "";
  String homeAddress = "";
  String lastName = "";
  String firstName = "";
  String middleName = "";
  String birthday = "";
  int pupilId = -1 ;
  bool isChecked = false;
  String fromDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now());
  List<RelationshipTypeModel> listRelationship = [];
  TextEditingController fullName = new TextEditingController();
  TextEditingController phoneNumber1 = new TextEditingController();
  TextEditingController phoneNumber2 = new TextEditingController();
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
                  return Container(
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
                            Avatar(avatar: avatar,avatarNull: "assets/images/img_avatar_null.png", enabled: false),
                            TextFieldCustom(
                              controller: fullName,
                              title: StringConstatns.fullNameParent2,
                              enabled: false,
                              typeTextField: "name",
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
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: TextFieldCustom(
                                        title: StringConstatns.phoneNumber1,
                                        controller: phoneNumber1,
                                        enabled: false),
                                  ),
                                ),
                                SizedBox(width: 25.w,),
                                Expanded(
                                  child: Container(
                                    child: TextFieldCustom(
                                        title: StringConstatns.phoneNumber2,
                                        controller: phoneNumber2,
                                        enabled: false),
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
                            SizedBox(height: 12.h,),
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
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 32),
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
                                          text: ButtonConstatns.sentPickUp,
                                          width: 153,
                                          press: () {
                                            if(isChecked == true){
                                              getUser().then((value) => postUserToParent(context,value!.userId,1));
                                            }else{
                                              WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa đồng ý với điều khoản"));
                                            }
                                          },
                                        ) ,
                                      )
                                    ],
                                  ),
                                )
                            )
                          ],
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

  Future postUserToParent(BuildContext context,int userId,int roleId) async{
    pupilId = await getPupilID();
    if(relationshipTypeID == -1){
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa chọn mối quan hệ"));
    }else{
      final Map<String, dynamic> body = <String, dynamic>{
        "USER_ID": userId,
        "CURRENT_LAST_NAME": lastName,
        "CURRENT_FIRST_NAME": firstName,
        "CURRENT_MIDDLE_NAME":middleName,
        "CURRENT_PHONE_NUMBER_1": phoneNumber1.text.trim(),
        "CURRENT_PHONE_NUMBER_2": phoneNumber2.text.trim(),
        "CURRENT_EMAIL": email,
        "HOME_ADDRESS_1": homeAddress,
        "BIRTH_DATE": birthday,
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
      BlocProvider.of<ParentsBloc>(context).add(PostParentEvent(roleId: roleId,body: body));
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
  void getUserInit() {
    Future.delayed(Duration.zero, () {
      user = ModalRoute.of(context)!.settings.arguments as UserByPersonModel?;
      if (user != null) {
        fullName.text = user!.personDetail!.getFullName();
        phoneNumber1.text = user!.personDetail!.currentPhoneNumber1!;
        phoneNumber2.text = user!.personDetail!.currentPhoneNumber2!;
        email = user!.personDetail!.currentEmail!;
        homeAddress = user!.personDetail!.homeAddress1!;
        lastName = user!.personDetail!.currentLastName!;
        middleName = user!.personDetail!.currentMiddleName!;
        firstName = user!.personDetail!.currentFirstName!;
        birthday = user!.personDetail!.birthDate!;
       setState(() {
         avatar = user!.personDetail!.avatarPicture!;
       });
      }else{
      }

    });
  }
}

