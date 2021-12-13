part of 'class_room_bloc.dart';

abstract class ClassRoomEvent  extends Equatable {
  const ClassRoomEvent({required this.personId});
  final int personId;

  @override
  List<Object> get props => [personId];
}

class GetListClassByTeacherId extends ClassRoomEvent {
  const GetListClassByTeacherId({required int personId}) : super(personId: personId);
}
