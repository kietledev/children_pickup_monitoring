import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/get_parents_request.dart';
import 'package:children_pickup_monitoring/common/core/params/get_users_by_person.dart';
import 'package:children_pickup_monitoring/common/core/params/post_teachers_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/get_parents_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/get_users_by_person_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(this._getUsersByPersonUseCase) : super(FetchUsersLoadingState());
  final GetUsersByPersonUseCase _getUsersByPersonUseCase;
  @override
  Stream<UsersState> mapEventToState(
      UsersEvent event,
      ) async* {
    if (event is FetchUsers) {
      final dataState = await _getUsersByPersonUseCase(
        params: GetUsersByPersonRequest(
           page: event.page,
          pageSize: event.pageSize
        ),
      );

      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final users = dataState.data!;
       // print(parents[0].personDetail!.currentMiddleName);
        yield FetchUsersSuccessState(users: users);
      } else {
        yield FetchUsersFailureState(msg: dataState.error!.message);
      }
    }
  }
}
