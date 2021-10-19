import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';

part 'achievement_event.dart';
part 'achievement_state.dart';

class AchievementBloc extends Bloc<AchievementEvent, AchievementState> {
  AchievementBloc(this._achievementsUseCase)
      : super(FetchAchievementLoadingState());
  final PostAchievementsUseCase _achievementsUseCase;

  @override
  Stream<AchievementState> mapEventToState(
    AchievementEvent event,
  ) async* {
    if (event is FetchAchievements) {
      final dataState = await _achievementsUseCase(
        params: PostAchievementsRequest(
          pupilId: event.pupilId,
        ),
      );
      print(dataState.data);
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final achievement = dataState.data!;
        yield FetchAchievementSuccessState(achievement: achievement);
      } else {
        yield FetcAchievementFailureState(msg: dataState.error!.message);
      }
    }
  }
}
