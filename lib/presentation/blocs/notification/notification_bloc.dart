import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/helpers/preferences.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';


part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotificationUseCase _getNotificationUseCase;
  final PostNotificationByTeacherUseCase _postNotificationByTeacherUseCase;
  final PostNotificationReadUseCase _postNotificationReadUseCase;
  NotificationBloc(this._getNotificationUseCase,this._postNotificationByTeacherUseCase,this._postNotificationReadUseCase ) : super(NotificationInitialState());

  @override
  Stream<NotificationState> mapEventToState(
      NotificationEvent event,
      ) async* {
    if (event is GetNotificationEvent) {
      yield const NotificationLoadingState();
      final dataState = await _getNotificationUseCase(
        params: GetNotificationRequest(
           page: event.page,
          pageSize: event.pageSize,
          personId: event.personId
        ),
      );

      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final notification = dataState.data!;
        yield NotificationSuccessState(notificationModel:notification );
        final preferences = Preferences();
        preferences.setNotification(state.notificationModel!);
      } else {
        yield NotificationFailureState(msg: dataState.error!.message);
      }
    }
    if (event is PostNotificationByTeacherEvent) {
      yield const NotificationLoadingState();
      final dataState = await _postNotificationByTeacherUseCase(
        params: PostNotificationByTeacherRequest(
         personId: event.personId,
          teacherId: event.teacherId,
          listClassId: event.listClassId,
          titleAnnoucement: event.titleAnnoucement,
          contentAnnoucement: event.contentAnnoucement
        ),
      );

      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        yield PostNotificationSuccessState(msg: dataState.data!);
      } else {
        yield NotificationFailureState(msg: dataState.error!.message);
      }
    }
    if (event is PostNotificationReadEvent) {
      yield const NotificationLoadingState();
      final dataState = await _postNotificationReadUseCase(
        params: PostNotificationReadRequest(
            personId: event.personId,
            annoucementId: event.annoucementId,
            page: event.page,
            pageSize: event.pageSize,
        ),
      );
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        yield PostNotificationReadSuccessState(notificationModel: dataState.data!);
      } else {
        yield NotificationFailureState(msg: dataState.error!.message);
      }
    }

  }
}
