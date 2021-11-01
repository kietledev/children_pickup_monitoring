import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/common/helpers/validators.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<LoginBloc>(),
      child: const Scaffold(
        body: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 104.h),
            Text(
              StringConstatns.hello,
              style: Utils.setStyle(color: const Color(0xFFF7931A), size: 32),
            ),
            SizedBox(height: 12.h),
            Text(
              StringConstatns.welcome,
              style: Utils.setStyle(
                  color: ColorConstants.secondaryColor2.withOpacity(0.6),
                  size: 14,
                  weight: FontWeight.w600),
            ),
            SizedBox(height: 26.h),
            LoginForm()
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<_UsernameTextFieldState> _usernameState =
      GlobalKey<_UsernameTextFieldState>();
  final GlobalKey<_PasswordTextFieldState> _passwordState =
      GlobalKey<_PasswordTextFieldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) => listenerLoginState(context, state),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            UsernameTextField(key: _usernameState),
            SizedBox(height: 24.h),
            PasswordTextField(key: _passwordState),
            SizedBox(height: 48.h),
            CustomButton(
                text: ButtonConstatns.login,
                width: 180.w,
                press: () => onLogin(context))
          ],
        ),
      ),
    );
  }

  void listenerLoginState(BuildContext context, LoginState state) {
    if (state is LoginLoadingState) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
      if (state is LoginSuccessState) {
        Navigator.pushReplacementNamed(context, RouteConstants.bottomBar);
        Navigator.pushNamedAndRemoveUntil(
            context, RouteConstants.bottomBar, (route) => false);
      } else if (state is LoginFailureState) {
        UiHelper.showMyDialog(
          context: context,
          content: state.msg ?? "This is something wrong",
        );
      } else {}
    }
  }

  void onLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final username = _usernameState.currentState!.controller.text;
      final password = _passwordState.currentState!.controller.text;

      BlocProvider.of<LoginBloc>(context)
          .add(PostLoginEvent(username: username, password: password));
    }
  }
}

class UsernameTextField extends StatefulWidget {
  const UsernameTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<UsernameTextField> createState() => _UsernameTextFieldState();
}

class _UsernameTextFieldState extends State<UsernameTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 10,
      shadowColor: Colors.black45,
      child: TextFormField(
        controller: controller,
        // autofocus: true,
        keyboardAppearance: Brightness.light,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          final error = Validators.userValidator(value!);
          return error.isNotEmpty ? error : null;
        },
        decoration: InputDecoration(
          hintText: StringConstatns.enterUserName,
          hintStyle: Utils.setStyle(color: const Color(0xFFAbA9BC)),
          fillColor: Colors.white,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: const CustomSurffixIcon(
              svgIcon: "assets/icons/ic_user_hexagon.svg"),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE63946)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE63946)),
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();

  static _PasswordTextFieldState? of(BuildContext context) =>
      context.findAncestorStateOfType<_PasswordTextFieldState>();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isVisible = true;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 10,
      shadowColor: Colors.black45,
      child: TextFormField(
        controller: controller,
        obscureText: isVisible,
        keyboardAppearance: Brightness.light,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          final error = Validators.passValidator(value!);
          return error.isNotEmpty ? error : null;
        },
        decoration: InputDecoration(
          hintText: StringConstatns.enterPassword,
          hintStyle: Utils.setStyle(color: const Color(0xFFAbA9BC)),
          fillColor: Colors.white,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: const CustomSurffixIcon(
              svgIcon: "assets/icons/ic_password_hexagon.svg"),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: isVisible
                ? Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(
                      'assets/icons/ic_eye.svg',
                      height: 20,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(
                      'assets/icons/ic_hiden_eye.svg',
                      height: 20,
                    ),
                  ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE63946)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE63946)),
          ),
        ),
      ),
    );
  }
}
