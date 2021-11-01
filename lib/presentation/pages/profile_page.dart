



import 'dart:convert';
import 'dart:typed_data';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/my_behavior.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/presentation/pages/edit_profile_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/pages.dart';
import 'package:children_pickup_monitoring/presentation/widgets/avatar.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      create: (context) => injector<ProfileBloc>()..add(GetprofileEvent(personId: 2)),
      child: Scaffold(
          body: ProfileBody()
      ),
    );
  }
}

class ProfileBody extends StatelessWidget{
  PersonModel? user;
  late ProfileBloc bloc;
  String avatar = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileSuccessState) {
        EasyLoading.dismiss();
        user = state.person;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_body_a.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Avatar(
                      enabled: false,
                      avatar: user!.avatarPicture!,
                      avatarNull:"assets/images/img_avatar_null.png" ,
                    ),
                    SizedBox(height: 12.h,),
                    (user!=null)?Text("${user!.getFullName()}",style:ProfileStyle.contentStyle1): Text(""),
                    SizedBox(height: 6.h,),
                    (user!=null)?Text(user!.currentPhoneNumber1.toString(),style: ProfileStyle.contentStyle2,): Text(""),
                    SizedBox(height: 24.h,),
                    Container(
                      height: (65 + 24) * listMenuPersonal.length.toDouble(),
                      child: Menu(user: user,),
                    ),
                    SizedBox(height: 48.h,),
                    CustomButtonText(
                      text: 'Đăng xuất ',
                      width: 174,
                      press: () {
                      },
                    ),
                    SizedBox(height: 24.h,)
                  ],
                ),
              ),
            ),
          ),
        );
      } else if (state is ProfileFailureState) {
        EasyLoading.dismiss();
        return const SizedBox.shrink();
      } else { EasyLoading.show();

        return const SizedBox.shrink();
      }
    });

  }
}

class Menu extends StatefulWidget {
  final PersonModel? user;
  Menu({this.user});
  @override
  State<Menu> createState() => _Menu();
}
class _Menu extends State<Menu>{
  final List<ItemMenu> listItemsProfile= [
    ItemMenu(1, "Thông tin cá nhân", "assets/icons/ic_information_personal.svg", ""),
    ItemMenu(2, "Danh sách liên quan", "assets/icons/ic_list_order.svg", RouteConstants.listparent),
    ItemMenu(3, "Đổi mật khẩu", "assets/icons/ic_change_password.svg", RouteConstants.passwordChange),
    ItemMenu(4, "Cài đặt ứng dụng", "assets/icons/ic_setting.svg", RouteConstants.settingApp),
  ];
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
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
                Navigator.of(context).pushNamed(RouteConstants.editProfile,arguments: widget.user).then((value) => context.read<ProfileBloc>().add(GetprofileEvent(personId: 2)));
              }else{
                Navigator.pushNamed(context, item.route);
              }
            },
          );
        },
      );

  }
}