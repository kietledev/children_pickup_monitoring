part of 'relationship_type_bloc.dart';





abstract class RelationshipTypeEvent extends Equatable {

  const RelationshipTypeEvent();
  @override
  List<Object> get props => [];
}

class FetchRelationshipType extends RelationshipTypeEvent {
  const FetchRelationshipType() : super();
}

