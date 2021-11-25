import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';

part 'class_room_event.dart';
part 'class_room_state.dart';

class ClassRoomBloc extends Bloc<ClassRoomEvent, ClassRoomState> {
  ClassRoomBloc(this._postClassByTeacherUseCase) : super(FetchClassRoomLoadingState());
  final PostClassByTeacherUseCase _postClassByTeacherUseCase;
  @override
  Stream<ClassRoomState> mapEventToState(
      ClassRoomEvent event,
      ) async* {
    if (event is GetListClassByTeacherId) {

      final dataState = await _postClassByTeacherUseCase(
        params: PostClassByTeacherRequest(
          personId: event.personId,
        ),
      );

      print(dataState.data.toString());
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final classRooms = dataState.data!;

        yield FetchClassRoomSuccessState(classRooms: classRooms);
      } else {
        yield FetchClassRoomFailureState(msg: dataState.error!.message);
      }
    }
  }
}
