import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaford<LoginBloc>(
      title: 'Login',
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
            if (state is LoginSuccessState) {
              Navigator.of(context).pushNamed(RouteConstants.home);
            } else if (state is LoginFailureState) {
              UiHelper.showMyDialog(
                context: context,
                content: state.msg ?? "This is something wrong",
              );
            } else {}
          }
        },
        // buildWhen: (previous, current) {
        //   return (current is LoginSuccess);
        // },
        builder: (context, state) {
          return Center(
            child: TextButton(
              child: const Text('Login'),
              onPressed: () {
                context.read<LoginBloc>().add(const PostLoginEvent(
                    username: '0949594313', password: '12345678'));
              },
            ),
          );
        },
      ),
    );
  }
}
