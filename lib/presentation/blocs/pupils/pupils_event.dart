part of 'pupils_bloc.dart';

abstract class PupilsEvent extends Equatable {
  const PupilsEvent({required this.classId, required this.date});
  final int classId;
  final String date;
  @override
  List<Object> get props => [classId];
}

class FetchPupils extends PupilsEvent {
  const FetchPupils({required int classId,required String date}) : super(classId: classId, date: date);
}
