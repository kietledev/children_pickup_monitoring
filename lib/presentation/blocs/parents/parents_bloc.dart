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

part 'parents_event.dart';
part 'parents_state.dart';

class ParentsBloc extends Bloc<ParentsEvent, ParentsState> {
  ParentsBloc(this._getParentsUseCase,this._postParentUseCase,this._deleteParentUseCase) : super(FetchParentsLoadingState());
  final GetParentsUseCase _getParentsUseCase;
  final PostParentUseCase _postParentUseCase;
  final DeleteParentUseCase _deleteParentUseCase;
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

        yield FetchParentsSuccessState(parents: parents);
      } else {
        yield FetchParentsFailureState(msg: dataState.error!.message);
      }
    }
    if(event is PostParentEvent){
      final dataState = await _postParentUseCase(
        params: PostParentRequest(
          body: event.body,
          roleId: event.roleId,
        ),
      );
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        yield PostParentSuccessState(msg: dataState.data!);
      } else {
        yield FetchParentsFailureState(msg: dataState.error!.message);
      }
    }
    if(event is DeleteParentEvent){
      final dataState = await _deleteParentUseCase(
        params: DeleteParentRequest(
          body: event.body,
          roleId: event.roleId,
          parentID: event.parentId
        ),
      );
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        yield DeleteParentSuccessState(msg: dataState.data!);
      } else {
        yield FetchParentsFailureState(msg: dataState.error!.message);
      }
    }
  }
}
