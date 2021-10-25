part of 'parents_bloc.dart';



abstract class ParentsEvent extends Equatable {

  final int pupilId;
  final int relationshipTypeId;
  const ParentsEvent({required this.pupilId, required this.relationshipTypeId});
  @override
  List<Object> get props => [pupilId,relationshipTypeId];
}

class FetchParents extends ParentsEvent {
  const FetchParents({required int pupilId, required int relationshipTypeId }) : super(pupilId: pupilId,relationshipTypeId: relationshipTypeId);
}

