import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/password/password_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/custom_textfield_password_change.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PasswordChangePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
          hideBack: true,
          title: TitlesAppBar.changePassword,
          actionBack: ()=>Navigator.pop(context)
      ),
      body: BlocProvider(
        create: (context) => injector<PasswordBloc>(),
        child: BodyPasswordChange()
      ),
    );

  }
}
class BodyPasswordChange extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_BodyPasswordChange();
}
class _BodyPasswordChange extends State<BodyPasswordChange>{
  bool _passwordVisible = true;
  TextEditingController _currentPassword = new TextEditingController();
  TextEditingController _newPassword1 = new TextEditingController();
  TextEditingController _newPassword2 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return BlocListener<PasswordBloc, PasswordState>(
      listener: (context, state) => listenerPasswordState(context, state),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_body_a.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tài khoản", style:EditProfileStyle.titleStyleEditTrue,),
                  userName(),
                  SizedBox(height: 24.h,),
                  TextFieldPasswordChange(controller:_currentPassword , passwordVisible: _passwordVisible,title: StringConstatns.currentPassword,),
                  TextButton(
                      child: Text("Quyên mật khẩu ?",
                        style: AddUserToParentStyle.buttonTextStyle,
                      ),
                    onPressed: (){},
                  ),
                  TextFieldPasswordChange(controller:_newPassword1 , passwordVisible: _passwordVisible,title: StringConstatns.newPassword,),
                  SizedBox(height: 24.h,),
                  TextFieldPasswordChange(controller:_newPassword2 , passwordVisible: _passwordVisible,title: StringConstatns.newPassword,),
                  SizedBox(height: 24.h,),
                  Stack(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: CustomButtonBorder(width: 133,text: 'Hủy',press: (){Navigator.pop(context);},)
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomButtonText(text: "Xác nhận",width:133,press: (){
                          //print("${_currentPassword.text} + ${_passwordnew1.text} + ${_passwordnew2.text}");
                         changePasswordUser(context, 2, 1);
                        },),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void listenerPasswordState(BuildContext context, PasswordState state) {
    if (state is PasswordLoadingState) {
    } else {
      EasyLoading.dismiss();
      if (state is PasswordSuccessState) {
        if(state.msg == "Change password successfully"){
          CustomWidgetsSnackBar.buildSuccessSnackbar(context, state.msg!);
          Navigator.pop(context);
        }else {
          CustomWidgetsSnackBar.buildErrorSnackbar(context, state.msg!);
        }
      } else if (state is PasswordFailureState) {
        UiHelper.showMyDialog(
          context: context,
          content: state.msg ?? "This is something wrong",
        );
      } else {}
    }
  }
  Future changePasswordUser(BuildContext context,int userId, int roleId) async {
    if (_currentPassword.text == "") {
      CustomWidgetsSnackBar.buildErrorSnackbar(
          context, "Bạn chưa nhập mật khẩu hiện tại");
    } else if (_newPassword1.text == "" || _newPassword2.text == "") {
      CustomWidgetsSnackBar.buildErrorSnackbar(
          context, "Bạn chưa nhập mật khẩu mới");
    }
    else if (_newPassword1.text != _newPassword2.text) {
      CustomWidgetsSnackBar.buildErrorSnackbar(context, "Mật khẩu không khớp");
    }
    else {
      final Map<String, dynamic> body = <String, dynamic>{
        "password": _newPassword1.text.trim(),
        "passwordOld": _currentPassword.text.trim()
      };
      BlocProvider.of<PasswordBloc>(context).add(
          PostPasswordEvent(userId: userId, roleId: roleId, body: body));
    }
  }

  Widget userName(){
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstants.neutralColor8,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 3,
            blurRadius: 8,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
        child: Text('QT123A21',style: TextStyle(fontSize: 16,color: ColorConstants.neutralColor1,fontFamily: FontsConstants.notoSans),),
      ),
    );
  }

}