import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLoginUseCase _postLoginUseCase;
  LoginBloc(this._postLoginUseCase) : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is PostLoginEvent) {
      yield const LoginLoadingState();
      final dataState = await _postLoginUseCase(
        params: LoginRequest(
          username: event.username,
          password: event.password,
        ),
      );

      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final user = dataState.data!;
        yield LoginSuccessState(user: user);
      } else {
        yield LoginFailureState(msg: dataState.error!.message);
      }
    }
  }
}
