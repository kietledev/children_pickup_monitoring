part of 'achievement_bloc.dart';

abstract class AchievementEvent extends Equatable {
  const AchievementEvent({required this.pupilId});
  final int pupilId;

  @override
  List<Object> get props => [pupilId];
}

class FetchAchievements extends AchievementEvent {
  const FetchAchievements({required int pupilId}) : super(pupilId: pupilId);
}
