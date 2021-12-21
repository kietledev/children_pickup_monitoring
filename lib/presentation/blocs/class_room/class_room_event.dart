part of 'class_room_bloc.dart';

abstract class ClassRoomEvent  extends Equatable {
  const ClassRoomEvent();



  @override
  List<Object> get props => [];
}

class GetListClassByTeacherId extends ClassRoomEvent {
  final int personId;
   GetListClassByTeacherId({required this.personId});
}
class GetListClassRoom extends ClassRoomEvent {
 final int page;
 final int pageSize;
 const GetListClassRoom({required this.page, required this.pageSize });
}
