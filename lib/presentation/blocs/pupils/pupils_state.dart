part of 'pupils_bloc.dart';

abstract class PupilsState extends Equatable {
  const PupilsState({this.pupils, this.msg});
  final List<Pupil>? pupils;
  final String? msg;
  @override
  List<Object> get props => [];
}

class FetchPupilsLoadingState extends PupilsState {}

class FetchPupilsSuccessState extends PupilsState {
  const FetchPupilsSuccessState({required List<Pupil> pupils})
      : super(pupils: pupils);
}

class FetchPupilsFailureState extends PupilsState {
  const FetchPupilsFailureState({required String msg}) : super(msg: msg);
}
