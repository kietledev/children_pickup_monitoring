part of 'alarm_bloc.dart';

abstract class AlarmEvent extends Equatable {
  const AlarmEvent();

  @override
  List<Object> get props => [];
}

class NewAlarm extends AlarmEvent {
  final AlarmStatus? status;
  final String? stringTime;
  final int? counter;

  const NewAlarm({
     this.status,
     this.stringTime,
     this.counter,
  });
}
