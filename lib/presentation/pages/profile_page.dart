
import 'dart:convert';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/my_behavior.dart';
import 'package:children_pickup_monitoring/common/helpers/preferences.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/presentation/pages/warning_page.dart';
import 'package:children_pickup_monitoring/presentation/widgets/avatar.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePage();
}
class _ProfilePage extends State<ProfilePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => injector<ProfileBloc>(),
      child: Scaffold(
          body: ProfileBody()
      ),
    );
  }
}
class ProfileBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileBody();
}

class _ProfileBody extends State<ProfileBody>{
  PersonModel? user;
  PersonModel? profile;
  UserModel? userModel;
  String avatar = "";
  int personId = -1;
  int roleId = -1;
  @override
  void initState() {
    getUserId();
    super.initState();
  }
  getProfileAll() async {
    profile = await getProfile();
    setState(() {
      user = profile;
    });
  }
   getUserId() async {
    userModel = await getUser();
    setState(() {
      roleId = userModel!.roleId;
    });
    personId = userModel!.personId.toInt();
    BlocProvider.of<ProfileBloc>(context).add(GetprofileEvent(personId:personId ));
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc,ProfileState>(
        listener: (context,state){
          if (state is ProfileLoadingState) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
            if (state is ProfileSuccessState) {
              final preferences = Preferences();
              preferences.setProfilePreference(state.person!);
              getProfileAll();
            } else if (state is ProfileFailureState) {
              UiHelper.showMyDialog(
                context: context,
                content: state.msg ?? "This is something wrong",
              );
            } else {}
          }
        },
      child:ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (user!= null) ?  Avatar(enabled: false, avatar: user!.avatarPicture!, avatarNull:"assets/images/img_avatar_null.png" ,)
                              :  Avatar(enabled: false, avatar: "", avatarNull:"assets/images/img_avatar_null.png" ,),
                SizedBox(height: 12.h,),
                (user!=null)?Text("${user!.getFullName()}",style:ProfileStyle.contentStyle1): Text(""),
                SizedBox(height: 6.h,),
                (user!=null)?Text(user!.currentPhoneNumber1.toString(),style: ProfileStyle.contentStyle2,): Text(""),
                SizedBox(height: 24.h,),
                Container(
                  height: (65 + 24) * listMenuPersonal.length.toDouble(),
                  child: Menu(user: user,roleId: roleId,),
                ),
                SizedBox(height: 48.h,),
                CustomButtonText(
                  text: (AppLocalizations.of(context)!.logout),
                  width: 174,
                  press: () {
                    final prefs = Preferences();
                    prefs.clear();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteConstants.login, (Route<dynamic> route) => false);
                  },
                ),
                SizedBox(height: 24.h,)
              ],
            ),
          ),
        ),
      ),
    );


    // return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
    //   if (state is ProfileSuccessState) {
    //     EasyLoading.dismiss();
    //     user = state.person;
    //     return Container(
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: AssetImage('assets/images/bg_body_a.png'),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       child: ScrollConfiguration(
    //         behavior: MyBehavior(),
    //         child: SingleChildScrollView(
    //           child: Container(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Avatar(
    //                   enabled: false,
    //                   avatar: user!.avatarPicture!,
    //                   avatarNull:"assets/images/img_avatar_null.png" ,
    //                 ),
    //                 SizedBox(height: 12.h,),
    //                 (user!=null)?Text("${user!.getFullName()}",style:ProfileStyle.contentStyle1): Text(""),
    //                 SizedBox(height: 6.h,),
    //                 (user!=null)?Text(user!.currentPhoneNumber1.toString(),style: ProfileStyle.contentStyle2,): Text(""),
    //                 SizedBox(height: 24.h,),
    //                 Container(
    //                   height: (65 + 24) * listMenuPersonal.length.toDouble(),
    //                   child: Menu(user: user,roleId: roleId,),
    //                 ),
    //                 SizedBox(height: 48.h,),
    //                 CustomButtonText(
    //                   text: (AppLocalizations.of(context)!.logout),
    //                   width: 174,
    //                   press: () {
    //                     final prefs = Preferences();
    //                     prefs.clear();
    //                     Navigator.of(context).pushNamedAndRemoveUntil(
    //                         RouteConstants.login, (Route<dynamic> route) => false);
    //                   },
    //                 ),
    //                 SizedBox(height: 24.h,)
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   } else if (state is ProfileFailureState) {
    //     EasyLoading.dismiss();
    //     return const SizedBox.shrink();
    //   } else {
    //     return const SizedBox.shrink();
    //   }
    // });

  }
}

class Menu extends StatefulWidget {
  final PersonModel? user;
  final int? roleId;
  Menu({this.user,this.roleId});
  @override
  State<Menu> createState() => _Menu();
}
class _Menu extends State<Menu>{
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<ItemMenu> listItemsProfile;
      if(widget.roleId ==1){
         listItemsProfile= [
          ItemMenu(1, (AppLocalizations.of(context)!.profile), "assets/icons/ic_information_personal.svg", ""),
          ItemMenu(2, (AppLocalizations.of(context)!.listOfRelatives), "assets/icons/ic_list_order.svg", RouteConstants.listparent),
          ItemMenu(3, (AppLocalizations.of(context)!.changePassword), "assets/icons/ic_change_password.svg", RouteConstants.passwordChange),
          ItemMenu(4, (AppLocalizations.of(context)!.setting), "assets/icons/ic_setting.svg", RouteConstants.settingApp),
        ];
      }else{
         listItemsProfile= [
          ItemMenu(1, (AppLocalizations.of(context)!.profile), "assets/icons/ic_information_personal.svg", ""),
          ItemMenu(2, (AppLocalizations.of(context)!.changePassword), "assets/icons/ic_change_password.svg", RouteConstants.passwordChange),
          ItemMenu(3, (AppLocalizations.of(context)!.setting), "assets/icons/ic_setting.svg", RouteConstants.settingApp),
        ];
      }
      return ListView.builder(
        primary: false,
        itemCount: listItemsProfile.length,
        itemBuilder: (context, index) {
          final item = listItemsProfile[index];
          return ItemMenuListView(
            index: index,
            isSelected: currentIndex == index,
            item: item,
            onSelect: () {
              setState(() {
                currentIndex = index;
              });
              if(listItemsProfile[index].id == 1){
                Navigator.of(context).pushNamed(RouteConstants.editProfile,arguments: widget.user).then((value) => getUser().then((value) => context.read<ProfileBloc>().add(GetprofileEvent(personId: value!.personId))));
              }else{
                Navigator.pushNamed(context, item.route);
              }
            },
          );
        },
      );

  }
}