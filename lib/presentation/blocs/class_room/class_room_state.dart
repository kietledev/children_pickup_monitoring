part of 'class_room_bloc.dart';


abstract class ClassRoomState extends Equatable {
  const ClassRoomState({this.classRoomsTeacher, this.msg,this.classRooms});
  final List<ClassByTeacherModel>? classRoomsTeacher;
  final List<ClassRoomModel>? classRooms;
  final String? msg;
  @override
  List<Object> get props => [];
}

class FetchClassRoomLoadingState extends ClassRoomState {}

class FetchClassRoomByTeacherSuccessState extends ClassRoomState {
  const FetchClassRoomByTeacherSuccessState({required List<ClassByTeacherModel> classRoomsTeacher})
      : super(classRoomsTeacher: classRoomsTeacher);
}
class ClassRoomsSuccessState extends ClassRoomState {
  const ClassRoomsSuccessState({required List<ClassRoomModel> classRooms})
      : super(classRooms: classRooms);
}
class FetchClassRoomFailureState extends ClassRoomState {
  const FetchClassRoomFailureState({required String msg}) : super(msg: msg);
}
