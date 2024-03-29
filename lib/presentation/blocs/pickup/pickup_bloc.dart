import 'dart:async';

import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/data_state.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'pickup_event.dart';
part 'pickup_state.dart';

class PickUpBloc extends Bloc<PickUpEvent, PickUpState> {
  final PostPickUpUseCase _postPickUpUseCase;
  final DeletePickupCardUseCase _deletePickupCardUseCase;
  PickUpBloc(this._postPickUpUseCase, this._deletePickupCardUseCase) : super(FetchPickUpLoadingState());

  @override
  Stream<PickUpState> mapEventToState(
      PickUpEvent event,
      ) async* {
    if (event is InsertPickUpRequestEvent) {
      yield FetchPickUpLoadingState();
      final dataState = await _postPickUpUseCase(
        params: PostPickUpRequest(
          body: event.body
        )
      );

      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final pickUpRequest= dataState.data!;
        yield PickUpSuccessState(pickUpRequest: pickUpRequest);
      } else {
        yield PickUpFailureState(msg: dataState.error!.message);
        print('error');
      }
    }
    if(event is DeletePickUpRequestEvent){
      final dataState = await _deletePickupCardUseCase(
        params: DeletePickupDestroyedRequest (
            body: event.body,
            roleId: event.roleId,
            requestId: event.requestId
        ),
      );
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final pickUpRequest= dataState.data!;
        yield DeletePickUpSuccessState(pickUpRequest: pickUpRequest);
      } else {
        yield PickUpFailureState(msg: dataState.error!.message);
        print('error');
      }
    }
  }
}
