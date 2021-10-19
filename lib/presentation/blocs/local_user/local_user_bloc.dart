import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/local_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'local_user_event.dart';
part 'local_user_state.dart';

class LocalUserBloc extends Bloc<LocalUserEvent, LocalUserState> {
  final GetSavedUserUseCase _getSavedUserUseCase;
  LocalUserBloc(this._getSavedUserUseCase) : super(const LocalUserInitial());

  @override
  Stream<LocalUserState> mapEventToState(LocalUserEvent event) async* {
    if (event is GetAllSavedUser) {
      yield const LocalUserLoading();
      final users = await _getSavedUserUseCase();
      if (users.isNotEmpty) {
        final user = users[0];
        yield LocalUserDone(user: user);
      } else {
        yield const LocalUserFailure(msg: 'msg');
      }
    }
  }
}
