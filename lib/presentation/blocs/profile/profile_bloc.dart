import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/helpers/preferences.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/get_profile_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/post_profile_usercase.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final PostProfileUseCase _postProfileUseCase;
  ProfileBloc(this._getProfileUseCase, this._postProfileUseCase)
      : super(ProfileInitialState());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetprofileEvent) {
      yield const ProfileLoadingState();
      final dataState = await _getProfileUseCase(
        params: ProfileRequest(personId: event.personId),
      );
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final person = dataState.data!;
        yield ProfileSuccessState(person: person as PersonModel);

      } else {
        yield ProfileFailureState(msg: dataState.error!.message);
        print('error');
      }
    }
    if (event is PostProfileEvent) {
      yield const ProfileLoadingState();
      final dataState = await _postProfileUseCase(
        params: PostProfileRequest(
          personId: event.personId,
          body: event.body,
          roleId: event.roleId,
        ),
      );
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final person = dataState.data!;
        yield ProfileSuccessState(person: person);
      } else {
        yield ProfileFailureState(msg: dataState.error!.message);
        print('error');
      }
    }
    if (event is ReloadProfileEvent) {
      yield const ProfileLoadingState();
      print('Nhuan');
      print(event.user.getFullName());
      yield ProfileSuccessState(person: event.user);
    }
  }
}
