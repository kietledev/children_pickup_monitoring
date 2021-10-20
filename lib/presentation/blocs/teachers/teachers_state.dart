part of 'teachers_bloc.dart';

abstract class TeachersState extends Equatable {
  const TeachersState({this.teachers, this.msg});
  final List<Teacher>? teachers;
  final String? msg;

  @override
  List<Object> get props => [teachers!, msg!];
}

class FetchTeachersLoadingState extends TeachersState {}

class FetchTeachersSuccessState extends TeachersState {
  const FetchTeachersSuccessState({required List<Teacher> teachers})
      : super(teachers: teachers);
}

class FetchTeachersFailureState extends TeachersState {
  const FetchTeachersFailureState({required String msg}) : super(msg: msg);
}
