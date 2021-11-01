part of 'parents_bloc.dart';



abstract class ParentsState extends Equatable {
  const ParentsState({this.parents, this.msg});
  final List<ParentModel>? parents;
  final String? msg;

  @override
  List<Object> get props => [parents!, msg!];
}

class FetchParentsLoadingState extends ParentsState {}

class FetchParentsSuccessState extends ParentsState {
  const FetchParentsSuccessState({required List<ParentModel> parents})
      : super(parents: parents);
}

class FetchParentsFailureState extends ParentsState {
  const FetchParentsFailureState({required String msg}) : super(msg: msg);
}
class PostParentSuccessState extends ParentsState{
  const PostParentSuccessState({required String msg})
      : super(msg: msg);
}
class DeleteParentSuccessState extends ParentsState{
  const DeleteParentSuccessState({required String msg})
      : super(msg: msg);
}