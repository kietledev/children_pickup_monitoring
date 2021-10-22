import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:photo_manager/photo_manager.dart';

part 'message_detail_event.dart';
part 'message_detail_state.dart';

class MessageDetailRepository {
  // static final MessageDetailRepository _singleton = MessageDetailRepository._internal();

  // factory MessageDetailRepository() {
  //   return _singleton;
  // }

  // MessageDetailRepository._internal();

  Future fetchAssets(
      {required Function success, required Function error}) async {
    final permision = await PhotoManager.requestPermissionExtend();
    if (permision.isAuth) {
      final albums = await PhotoManager.getAssetPathList(onlyAll: true);
      final recentAlbum = albums.first;

      final recentAssets = await recentAlbum.getAssetListRange(
        start: 0,
        end: 1000000,
      );
      if (recentAssets.isNotEmpty) {
        success(recentAssets);
      } else {
        error('msg');
      }
    } else {
      PhotoManager.openSetting();
    }
  }
}

class MessageDetailBloc extends Bloc<MessageDetailEvent, MessageDetailState> {
  MessageDetailRepository repository;
  MessageDetailBloc(MessageDetailState initialState, this.repository)
      : super(initialState);

  @override
  Stream<MessageDetailState> mapEventToState(
    MessageDetailEvent event,
  ) async* {
    if (event is DownloadMessageDetail) {
      yield MessageDetailInitial(status: DownloadStatus.loading);
      _mapDowloadMessageToState();
    } else if (event is DownloadSuccess) {
      yield MessageDetailInitial(status: DownloadStatus.success);
      yield ListMessageState(status: ListMessageStatus.success);
    } else if (event is DownloadFailure) {
      yield MessageDetailInitial(
          status: DownloadStatus.failure, message: event.msg);
      yield ListMessageState(status: ListMessageStatus.success);
    } else if (event is MoreHeightEvent) {
      yield MoreHeightState(moreHeight: event.moreHeight);
    } else if (event is InputEvent) {
      yield InputState(
          onFocus: event.onFocus,
          hasValue: event.hasValue,
          showGallery: event.showGallery ?? false,
          isRecording: event.isRecording ?? false);
    } else if (event is AddNewMessage) {
      yield ListMessageState(
          status: ListMessageStatus.add, message: event.message);
    } else if (event is GalleryEvent) {
      if (event.show) {
        _mapFetchAssetsToState();
      } else {
        yield GalleryState(show: false);
      }
    } else if (event is FetchAssetsEvent) {
      if (event.status == ProcessStatus.success) {
        yield GalleryState(show: true, assets: event.assets);
      } else {
        yield GalleryState(show: false);
      }
    } else if (event is AmplitudeEvent) {
      yield AmplitudeState(event.currentAmplitude, event.recordDuration);
    }
  }

  Future _mapFetchAssetsToState() async {
    try {
      await repository.fetchAssets(success: (List<AssetEntity> assets) {
        add(FetchAssetsEvent(status: ProcessStatus.success, assets: assets));
      }, error: (String error) {
        add(FetchAssetsEvent(status: ProcessStatus.failure));
      });
    } catch (e) {
      add(FetchAssetsEvent(status: ProcessStatus.failure));
    }
  }

  Future _mapDowloadMessageToState() async {
    try {
      Timer(const Duration(milliseconds: 400), () {
        add(DownloadSuccess());
      });
    } on Exception {
      add(DownloadFailure('errorMessage'));
    }
  }
}

enum DownloadStatus { loading, success, failure }
enum ListMessageStatus { success, failure, add }
enum InputStatus { onFocus, hasValue, add }
enum FocusStatus { focus, unFocus }
enum ValueStatus { value, non }
enum ProcessStatus { loading, success, failure }
