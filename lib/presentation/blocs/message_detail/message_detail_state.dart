part of 'message_detail_bloc.dart';

class MessageDetailState {}

class MessageDetailInitial extends MessageDetailState {
  final DownloadStatus? status;
  final String? message;

  MessageDetailInitial({this.status, this.message});
}

class ListMessageState extends MessageDetailState {
  final ListMessageStatus? status;
  final String? message;

  ListMessageState({this.status, this.message});
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
