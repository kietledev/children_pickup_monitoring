part of 'pupil_by_parent_bloc.dart';



abstract class PupilByParentEvent extends Equatable {
  const PupilByParentEvent();
  @override
  List<Object> get props => [];
}

class FetchPupilByParent extends PupilByParentEvent {
  final int parentId;

  const FetchPupilByParent({required this.parentId});
}
