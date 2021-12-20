import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/pupil.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';

part 'pupils_event.dart';
part 'pupils_state.dart';

class PupilsBloc extends Bloc<PupilsEvent, PupilsState> {
  PupilsBloc(this._postPupilsUseCase) : super(FetchPupilsLoadingState());
  final PostPupilsUseCase _postPupilsUseCase;
  @override
  Stream<PupilsState> mapEventToState(
    PupilsEvent event,
  ) async* {
    if (event is FetchPupils) {

      final dataState = await _postPupilsUseCase(
        params: PostPupilsRequest(
          classId: event.classId,
          date: event.date,
        ),
      );

      print(dataState.data.toString());
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final pupils = dataState.data!;

        yield FetchPupilsSuccessState(pupils: pupils);
      } else {
        yield FetchPupilsFailureState(msg: dataState.error!.message);
      }
    }
  }
}
