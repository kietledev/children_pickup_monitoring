part of 'achievement_bloc.dart';

abstract class AchievementState extends Equatable {
  const AchievementState({this.achievements, this.msg});
  final List<Achievement>? achievements;
  final String? msg;

  @override
  List<Object> get props => [achievements!, msg!];
}

class FetchAchievementLoadingState extends AchievementState {}

class FetchAchievementSuccessState extends AchievementState {
  const FetchAchievementSuccessState({required List<Achievement> achievement})
      : super(achievements: achievement);
}

class FetchAchievementFailureState extends AchievementState {
  const FetchAchievementFailureState({required String msg}) : super(msg: msg);
}
