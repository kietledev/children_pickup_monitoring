import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/get_parents_request.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/params/post_teachers_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/get_parents_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/post_parent_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';

part 'pupil_by_parent_event.dart';
part 'pupil_by_parent_state.dart';

class PupilByParentBloc extends Bloc<PupilByParentEvent,PupilByParentState> {
  PupilByParentBloc(this._getPupilByParentUseCase) : super(FetchPupilByParentLoadingState());
  final GetPupilByParentUseCase _getPupilByParentUseCase;
  @override
  Stream<PupilByParentState> mapEventToState(
      PupilByParentEvent event,
      ) async* {
    if (event is FetchPupilByParent) {
      final dataState = await _getPupilByParentUseCase(
        params: PupilByParentRequest(
            parentId: event.parentId,
        ),
      );

      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final pupils = dataState.data!;
        yield FetchPupilByParentSuccessState(pupils: pupils);
      } else {
        yield FetchPupilByParentFailureState(msg: dataState.error!.message);
      }
    }

  }
}
