part of 'pickup_place_bloc.dart';
abstract class PickUpPlaceEvent extends Equatable {
  const PickUpPlaceEvent();
  @override
  List<Object> get props => [];
}
class FetchPickUpPlace extends PickUpPlaceEvent {
  const FetchPickUpPlace() : super();
}
