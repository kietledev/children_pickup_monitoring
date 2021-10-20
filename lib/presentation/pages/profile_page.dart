



import 'dart:convert';
import 'dart:typed_data';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/my_behavior.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/presentation/pages/edit_profile_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({Key? key}) : super(key: key);

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
  Uint8List? bytesImage;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener:(context, state)=>listenerProfileState(context, state),
      builder: (context, state) {
        return Container(
          width: double.infinity.w,
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
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 27, 0, 0),
                      height: 112,
                      width: 112,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/img_border_avatar.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: CircleAvatar(
                          backgroundImage:bytesImage != null ? MemoryImage(bytesImage!)
                              : AssetImage('assets/images/img_avatar_null.png') as ImageProvider,
                        ),
                      ),
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
                          // print(state.user!.CURRENT_FIRST_NAME!);
                          // final prefs = Preferences();
                          // prefs.clear();
                          // Navigator.of(context).pushNamedAndRemoveUntil(
                          //     LoginScreen.routeName, (Route<dynamic> route) => false);
                        },
                    ),
                    SizedBox(height: 24.h,)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  void listenerProfileState(BuildContext context, ProfileState state) {
    if (state is ProfileLoadingState) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
      if (state is ProfileSuccessState) {
        user = state.person;
        bytesImage = base64.decode('${user?.avatarPicture}');
        //print('Nhuan success ${user!.currentPhoneNumber1}');
      } else if (state is ProfileFailureState) {
        UiHelper.showMyDialog(
          context: context,
          content: state.msg ?? "This is something wrong",
        );
      } else {}
    }
  }
}


class Menu extends StatefulWidget {
  final Person? user;
  Menu({this.user});
  @override
  State<Menu> createState() => _Menu();
}
class _Menu extends State<Menu>{
  int _selectedIndex = 0;
  void _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: listMenuPersonal.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Container(
              width: 360,
              height: 65,
              margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
              decoration: BoxDecoration(
                gradient:
                _selectedIndex != null && _selectedIndex == index
                    ? kMenuGradienColor
                    : kWhiteGradiendColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF3F5FF).withOpacity(1),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(12, 0, 24, 0),
                            child: SvgPicture.asset(
                                listMenuPersonal[index].icon),
                          ),
                          Text(
                            listMenuPersonal[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: _selectedIndex != null &&
                                    _selectedIndex == index
                                    ? ColorConstants.neutralColor6
                                    : ColorConstants.neutralColor1,
                                fontFamily: FontsConstants.notoSans),
                          )
                        ],
                      )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: SvgPicture.asset(
                            'assets/icons/ic_next_arrow_right.svg',
                            color: _selectedIndex != null &&
                                _selectedIndex == index
                                ? Colors.white
                                : ColorConstants.brandColor,
                          ))),
                ],
              ),
            ),
            onTap: () {
              _onSelected(index);
              switch (listMenuPersonal[index].id) {
                case 1:
                    Navigator.pushNamed(context, RouteConstants.editProfile,arguments: widget.user);
                  break;
                case 2:
                // Navigator.pushNamed(
                //     context, ListParentScreen.routeName);
                  break;
                case 3:
                // Navigator.pushNamed(
                //     context, ChangePasswordScreen.routeName);
                  break;
                case 4:
                // Navigator.pushNamed(
                //     context, SettingAppScreen.routeName);
                  break;
              }
            },
          );
        });
  }
}
