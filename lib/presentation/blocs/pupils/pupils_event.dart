part of 'pupils_bloc.dart';

abstract class PupilsEvent extends Equatable {
  // const PupilsEvent({required this.classId, required this.date});
  // final int classId;
  // final String date;
  const PupilsEvent();
  @override
  List<Object> get props => [];
}

class FetchPupils extends PupilsEvent {
  final int classId;
  final String date;
  const FetchPupils({required this.classId,required this.date}) ;
}
class PostUpdateProfilePupil extends PupilsEvent{
  final int pupilId ;
  final int roleId;
  Map<String, dynamic> body;
  PostUpdateProfilePupil({required this.pupilId,required this.roleId,required this.body});

}
