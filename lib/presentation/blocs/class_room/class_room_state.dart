part of 'class_room_bloc.dart';


abstract class ClassRoomState extends Equatable {
  const ClassRoomState({this.classRooms, this.msg});
  final List<ClassByTeacherModel>? classRooms;
  final String? msg;
  @override
  List<Object> get props => [];
}

class FetchClassRoomLoadingState extends ClassRoomState {}

class FetchClassRoomSuccessState extends ClassRoomState {
  const FetchClassRoomSuccessState({required List<ClassByTeacherModel> classRooms})
      : super(classRooms: classRooms);
}

class FetchClassRoomFailureState extends ClassRoomState {
  const FetchClassRoomFailureState({required String msg}) : super(msg: msg);
}
