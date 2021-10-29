import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/get_pickup_place_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';

part 'pickup_place_event.dart';
part 'pickup_place_state.dart';
class PickUpPlaceBloc extends Bloc<PickUpPlaceEvent, PickUpPlaceState> {
  PickUpPlaceBloc(this._pickUpPlaceUseCase): super(FetchPickUpPlaceLoadingState());
  final GetPickUpPlaceUseCase _pickUpPlaceUseCase;
  @override
  Stream<PickUpPlaceState> mapEventToState(
      PickUpPlaceEvent event) async* {  if (event is FetchPickUpPlace) {
    final dataState = await _pickUpPlaceUseCase(
      params: GetPickUpPlasesRequest(),
    );
    print("hue ???"+dataState.data.toString());
    if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
      final pickUpPlaces = dataState.data!;
      print("HUE 1111 "+ dataState.data!.toString());
      yield FetchPickUpPlaceSuccessState(pickUpPlaces: pickUpPlaces);
    } else {
      yield FetchPickUpPlaceFailureState(msg: dataState.error!.message);
    }
  }
  }
}
