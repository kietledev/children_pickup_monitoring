import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/get_profile_usercase.dart';
import 'package:equatable/equatable.dart';


part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  ProfileBloc(this._getProfileUseCase) : super(ProfileInitialState());

  @override
  Stream<ProfileState> mapEventToState(
      ProfileEvent event,
      ) async* {
    if (event is GetprofileEvent) {
      yield const ProfileLoadingState();
      final dataState = await _getProfileUseCase(
        params: ProfileRequest(
            personId: event.personId
        ),
      );
      print("Nhuan${dataState}");
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final person = dataState.data!;
        yield ProfileSuccessState(person: person);
      } else {
        yield ProfileFailureState(msg: dataState.error!.message);
        print('error');
      }
    }
  }
}
