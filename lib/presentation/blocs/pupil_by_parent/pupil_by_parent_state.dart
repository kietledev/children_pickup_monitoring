part of 'pupil_by_parent_bloc.dart';


class PupilByParentState extends Equatable {

  final List<PupilModel>? pupils;
  final String? msg;
  const PupilByParentState({this.pupils, this.msg});
  PupilByParentState coppyWith(
      {String? msg, List<PupilModel>? pupils}) {
    return PupilByParentState(
        msg: msg ?? this.msg,
        pupils: pupils ?? this.pupils);
  }
  @override
  List<Object> get props => [msg!];


}

class FetchPupilByParentLoadingState extends PupilByParentState {}

class FetchPupilByParentSuccessState extends PupilByParentState {

  const FetchPupilByParentSuccessState({required List<PupilModel> pupils})
      : super(pupils: pupils);
}

class FetchPupilByParentFailureState extends PupilByParentState {
  const FetchPupilByParentFailureState({required String msg}) : super(msg: msg);
}
