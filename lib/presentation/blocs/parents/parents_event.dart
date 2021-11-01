part of 'parents_bloc.dart';



abstract class ParentsEvent extends Equatable {
  const ParentsEvent();
  @override
  List<Object> get props => [];
}

class FetchParents extends ParentsEvent {
  final int pupilId;
  final int relationshipTypeId;
  const FetchParents({required this.pupilId, required int this.relationshipTypeId });
}
class PostParentEvent extends ParentsEvent {
  final int roleId;
  Map<String, dynamic> body;
  PostParentEvent({required this.roleId,required this.body});
}
class DeleteParentEvent extends ParentsEvent {
  final int roleId;
  final int parentId;
  Map<String, dynamic> body;
  DeleteParentEvent({required this.roleId,required this.body,required this.parentId});
}