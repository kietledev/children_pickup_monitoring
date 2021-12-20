part of 'message_detail_bloc.dart';

class MessageDetailState {}

class MessageDetailInitial extends MessageDetailState {
  final DownloadStatus? status;
  final String? message;

  MessageDetailInitial({this.status, this.message});
}

class ListMessageState extends MessageDetailState {
  final ListMessageStatus? status;
  final List<Message>? messages;
  final bool checkMessage;

  ListMessageState({this.status, this.messages, required this.checkMessage});
}
class SendMessageSuccessState extends MessageDetailState{
  final bool checkMessage;
  final List<Message>? messages;
  SendMessageSuccessState({required this.checkMessage, this.messages});
}
class SendMessageFailureState extends MessageDetailState{
  final bool checkMessage;
  final List<Message>? messages;
  SendMessageFailureState({required this.checkMessage, this.messages});
}
class MoreHeightState extends MessageDetailState {
  final bool moreHeight;

  MoreHeightState({required this.moreHeight});
}

class InputState extends MessageDetailState {
  final bool? onFocus;
  final bool? hasValue;
  final bool? showGallery;
  final bool? isRecording;

  InputState({this.onFocus, this.hasValue, this.showGallery, this.isRecording});
}

class GalleryState extends MessageDetailState {
  final bool? show;
  final List<AssetEntity>? assets;
  GalleryState({this.assets, this.show});
}

class AmplitudeState extends MessageDetailState {
  final double currentAmplitude;
  final double recordDuration;

  AmplitudeState(this.currentAmplitude, this.recordDuration);
}
