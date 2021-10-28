part of 'relationship_type_bloc.dart';



abstract class RelationshipTypeState extends Equatable {
  const RelationshipTypeState({this.relationshipType, this.msg});
  final List<RelationshipTypeModel>? relationshipType;
  final String? msg;

  @override
  List<Object> get props => [relationshipType!, msg!];
}

class FetchRelationshipTypeLoadingState extends RelationshipTypeState {}

class FetchRelationshipTypeSuccessState extends RelationshipTypeState {
  const FetchRelationshipTypeSuccessState({required List<RelationshipTypeModel> relationshipType})
      : super(relationshipType: relationshipType);
}

class FetchRelationshipTypeFailureState extends RelationshipTypeState {
  const FetchRelationshipTypeFailureState({required String msg}) : super(msg: msg);
}
