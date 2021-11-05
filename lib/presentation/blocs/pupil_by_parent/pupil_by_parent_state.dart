part of 'pupil_by_parent_bloc.dart';


abstract class PupilByParentState extends Equatable {
  const PupilByParentState({this.pupils, this.msg});
  final List<PupilModel>? pupils;
  final String? msg;

  @override
  List<Object> get props => [pupils!];
}

class FetchPupilByParentLoadingState extends PupilByParentState {}

class FetchPupilByParentSuccessState extends PupilByParentState {
  const FetchPupilByParentSuccessState({required List<PupilModel> pupils})
      : super(pupils: pupils);
}

class FetchPupilByParentFailureState extends PupilByParentState {
  const FetchPupilByParentFailureState({required String msg}) : super(msg: msg);
}
