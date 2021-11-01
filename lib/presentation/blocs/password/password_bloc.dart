import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/usecases/get_profile_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/post_profile_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';


part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final PostPasswordUseCase _postPasswordUseCase;
  PasswordBloc(this._postPasswordUseCase)
      : super(PasswordInitialState());

  @override
  Stream<PasswordState> mapEventToState(
      PasswordEvent event,
      ) async* {
    if (event is PostPasswordEvent) {
      yield const PasswordLoadingState();
      final dataState = await _postPasswordUseCase(
        params: PostPasswordRequest(
            userId: event.userId,
            roleId: event.roleId,
            body: event.body,
        ),
      );
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final msg = dataState.data!;
        yield PasswordSuccessState(msg: msg);
      } else {
        yield PasswordFailureState(msg: dataState.error!.message);
        print('error');
      }
    }
  }
}
