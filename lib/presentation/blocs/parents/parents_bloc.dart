import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/get_parents_request.dart';
import 'package:children_pickup_monitoring/common/core/params/post_teachers_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/get_parents_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';

part 'parents_event.dart';
part 'parents_state.dart';

class ParentsBloc extends Bloc<ParentsEvent, ParentsState> {
  ParentsBloc(this._getParentsUseCase) : super(FetchParentsLoadingState());
  final GetParentsUseCase _getParentsUseCase;
  @override
  Stream<ParentsState> mapEventToState(
      ParentsEvent event,
      ) async* {
    if (event is FetchParents) {
      final dataState = await _getParentsUseCase(
        params: ParentsRequest(
         pupilId: event.pupilId,
          relationshipTypeId: event.relationshipTypeId
        ),
      );

      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final parents = dataState.data!;
        print(parents[0].personDetail!.currentMiddleName);
        yield FetchParentsSuccessState(parents: parents);
      } else {
        yield FetchParentsFailureState(msg: dataState.error!.message);
      }
    }
  }
}
