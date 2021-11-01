import 'dart:async';

import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'pickup_event.dart';
part 'pickup_state.dart';

class PickUpBloc extends Bloc<PickUpEvent, PickUpState> {
  final PostPickUpUseCase _postPickUpUseCase;
  PickUpBloc(this._postPickUpUseCase) : super(FetchPickUpLoadingState());

  @override
  Stream<PickUpState> mapEventToState(
      PickUpEvent event,
      ) async* {
    if (event is PostPickUpUseCase) {

    }
  }
}
