part of 'pickup_place_bloc.dart';

abstract class PickUpPlaceState extends Equatable{
  const PickUpPlaceState({this.pickUpPlaces, this.msg});
  final List<PickUpPlace>? pickUpPlaces;
  final String? msg;
  @override
  List<Object> get props => [pickUpPlaces!, msg!];
}
class FetchPickUpPlaceLoadingState extends PickUpPlaceState{}

class FetchPickUpPlaceSuccessState extends PickUpPlaceState{
  const FetchPickUpPlaceSuccessState({required List<PickUpPlace> pickUpPlaces})
      : super(pickUpPlaces: pickUpPlaces);
}
class FetchPickUpPlaceFailureState extends PickUpPlaceState {
  const FetchPickUpPlaceFailureState({required String msg}) : super(msg: msg);
}
