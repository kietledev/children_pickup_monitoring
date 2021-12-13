import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/get_all_messages_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/message_detail_usecase.dart';
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
  final MessageDetailUseCase _useCase;
  MessageDetailBloc(
      MessageDetailState initialState, this.repository, this._useCase)
      : super(initialState);

  @override
  Stream<MessageDetailState> mapEventToState(
    MessageDetailEvent event,
  ) async* {
    if (event is DownloadMessageDetail) {
      yield MessageDetailInitial(status: DownloadStatus.loading);
      _mapDowloadMessageToState(event);
    } else if (event is DownloadSuccess) {
      yield MessageDetailInitial(
        status: DownloadStatus.success,
      );
      yield ListMessageState(
          status: ListMessageStatus.success, messages: event.listMessage);
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
      final List<Message> messages = [];
      messages.add(event.message!);
      yield ListMessageState(
          status: ListMessageStatus.add, messages: messages);
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

  Future _mapDowloadMessageToState(MessageDetailEvent event) async {
    if (event is DownloadMessageDetail) {
      final dataState = await _useCase(
          params: GetAllMessagesRequest(
              personId: event.personId,
              groupId: event.groupId,
              page: event.page));
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final messages = dataState.data!;
        add(DownloadSuccess(messages));
      } else {
        add(DownloadFailure(dataState.error!.message));
      }
    }
  }
}

enum DownloadStatus { loading, success, failure }
enum ListMessageStatus { success, failure, add }
enum InputStatus { onFocus, hasValue, add }
enum FocusStatus { focus, unFocus }
enum ValueStatus { value, non }
enum ProcessStatus { loading, success, failure }
