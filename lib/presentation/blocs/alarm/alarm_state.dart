part of 'alarm_bloc.dart';

enum AlarmStatus { before, alarm, after }

class AlarmState extends Equatable {
  const AlarmState({
    this.status = AlarmStatus.before,
    this.stringTime = "",
    this.counter = 100,
  });

  final AlarmStatus status;
  final String stringTime;
  final int counter;

  AlarmState copyWith({
    AlarmStatus? status,
    String? stringTime,
    int? counter,
  }) {
    return AlarmState(
      status: status ?? this.status,
      stringTime: stringTime ?? this.stringTime,
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object> get props => [status, stringTime, counter];
}
