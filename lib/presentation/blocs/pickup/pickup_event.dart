part of 'pickup_bloc.dart';


abstract class PickUpEvent extends Equatable {
  const PickUpEvent();

  @override
  List<Object> get props => [];
}
class InsertPickUpRequestEvent extends PickUpEvent {
  Map<String, dynamic> body;
  InsertPickUpRequestEvent({required this.body});
}
class DeletePickUpRequestEvent extends PickUpEvent {
  final int requestId;
  final int roleId;
  Map<String, dynamic> body;
  DeletePickUpRequestEvent({required this.body, required this.requestId, required this.roleId});
}

