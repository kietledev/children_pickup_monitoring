import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/post_teachers_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';

part 'teachers_event.dart';
part 'teachers_state.dart';

class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  TeachersBloc(this._postTeachersUseCase) : super(FetchTeachersLoadingState());
  final PostTeachersUseCase _postTeachersUseCase;
  @override
  Stream<TeachersState> mapEventToState(
    TeachersEvent event,
  ) async* {
    if (event is FetchTeaches) {
      final dataState = await _postTeachersUseCase(
        params: PostTeachersRequest(
          classId: event.classId,
        ),
      );

      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final teachers = dataState.data!;
        yield FetchTeachersSuccessState(teachers: teachers);
      } else {
        yield FetchTeachersFailureState(msg: dataState.error!.message);
      }
    }
  }
}
