import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'alarm_event.dart';
part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc() : super(const AlarmState());

  @override
  Stream<AlarmState> mapEventToState(
    AlarmEvent event,
  ) async* {
    if (event is NewAlarm) {
      print(event.stringTime);
      yield state.copyWith(
          status: event.status,
          stringTime: event.stringTime,
          counter: event.counter);
    }
  }
}
