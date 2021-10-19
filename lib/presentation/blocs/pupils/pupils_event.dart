part of 'pupils_bloc.dart';

abstract class PupilsEvent extends Equatable {
  const PupilsEvent({required this.classId});
  final int classId;

  @override
  List<Object> get props => [classId];
}

class FetchPupils extends PupilsEvent {
  const FetchPupils({required int classId}) : super(classId: classId);
}
