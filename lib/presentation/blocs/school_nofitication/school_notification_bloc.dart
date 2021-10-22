import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'school_notification_event.dart';
part 'school_notification_state.dart';

class SchoolNotificationBloc extends Bloc<SchoolNotificationEvent, SchoolNotificationState> {
  SchoolNotificationBloc() : super(SchoolNotificationInitial());

  @override
  Stream<SchoolNotificationState> mapEventToState(
    SchoolNotificationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
