import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/get_relationship_type_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/relationship_type_model.dart';
import 'package:children_pickup_monitoring/domain/usecases/get_relationship_type_usercase.dart';
import 'package:equatable/equatable.dart';


part 'relationship_type_event.dart';
part 'relationship_type_state.dart';

class RelationshipTypeBloc extends Bloc<RelationshipTypeEvent, RelationshipTypeState> {
  RelationshipTypeBloc(this._getRelationshipTypeUseCase) : super(FetchRelationshipTypeLoadingState());
  final GetRelationshipTypeUseCase _getRelationshipTypeUseCase;
  @override
  Stream<RelationshipTypeState> mapEventToState(
      RelationshipTypeEvent event,
      ) async* {
    if (event is FetchRelationshipType) {
      final dataState = await _getRelationshipTypeUseCase(
        params: GetRelationshipTypeRequest(),
      );

      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final relationshipType = dataState.data!;
        // print(parents[0].personDetail!.currentMiddleName);
        yield FetchRelationshipTypeSuccessState(relationshipType: relationshipType);
      } else {
        yield FetchRelationshipTypeFailureState(msg: dataState.error!.message);
      }
    }
  }
}
