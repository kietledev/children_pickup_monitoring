part of 'pickup_bloc.dart';

abstract class PickUpState extends Equatable {
  final PickUpRequestModel? pickUpRequest;
  final String? msg;
  const PickUpState({this.pickUpRequest, this.msg});

  @override
  List<Object> get props => [msg!];
}
class FetchPickUpLoadingState extends PickUpState {}

class PickUpSuccessState extends PickUpState {
  const PickUpSuccessState({required PickUpRequestModel pickUpRequest}) : super(pickUpRequest: pickUpRequest);
}

class PickUpFailureState extends PickUpState {
  const PickUpFailureState({required String msg}) : super(msg: msg);
}
