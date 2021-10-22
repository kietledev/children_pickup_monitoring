part of 'message_detail_bloc.dart';

class MessageDetailEvent {}

class DownloadMessageDetail extends MessageDetailEvent {
  final String id;

  DownloadMessageDetail(this.id);
}

class DownloadSuccess extends MessageDetailEvent {
  // final List<String>? listMessage;

  // DownloadSuccess(this.listMessage);
}

class DownloadFailure extends MessageDetailEvent {
  final String msg;

  DownloadFailure(this.msg);
}

class MoreHeightEvent extends MessageDetailEvent {
  final bool moreHeight;

  MoreHeightEvent({required this.moreHeight});
}

class AddNewMessage extends MessageDetailEvent {
  final String? message;

  AddNewMessage({this.message});
}

class InputEvent extends MessageDetailEvent {
  final bool? onFocus;
  final bool? hasValue;
  final bool? showGallery;
  final bool? isRecording;

  InputEvent({this.onFocus, this.hasValue, this.showGallery, this.isRecording});
}

class GalleryEvent extends MessageDetailEvent {
  final bool show;
  GalleryEvent({required this.show});
}

class FetchAssetsEvent extends MessageDetailEvent {
  final ProcessStatus? status;
  final List<AssetEntity>? assets;

  FetchAssetsEvent({this.status, this.assets});
}

class AmplitudeEvent extends MessageDetailEvent {
  final double currentAmplitude;
  final double recordDuration;
  AmplitudeEvent(this.currentAmplitude, this.recordDuration);
}