part of 'teachers_bloc.dart';

abstract class TeachersEvent extends Equatable {
  const TeachersEvent({required this.classId});
  final int classId;

  @override
  List<Object> get props => [classId];
}

class FetchTeaches extends TeachersEvent {
  const FetchTeaches({required int classId}) : super(classId: classId);
}

