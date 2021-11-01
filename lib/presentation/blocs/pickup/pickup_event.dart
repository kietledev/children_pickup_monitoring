part of 'pickup_bloc.dart';


abstract class PickUpEvent extends Equatable {
  const PickUpEvent();

  @override
  List<Object> get props => [];
}
class InsertPickUpRequestEvent extends PickUpEvent {
  Map<String, dynamic> body;
  InsertPickUpRequestEvent({required this.body});

  @override
  PickUpEventEvent() {
    // TODO: implement PickUpEventEvent
    throw UnimplementedError();
  }
}
class UpdatePickUpRequestEvent extends PickUpEvent {
  final String requestId;
  Map<String, dynamic> body;
  UpdatePickUpRequestEvent({required this.body, required this.requestId});
}

