import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:flutter/material.dart';
part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoaded(Locale(Languages.languages[0].code)));

  @override
  Stream<LanguageState> mapEventToState(
      LanguageEvent event,
      ) async* {
    if (event is ToggleLanguageEvent) {
      yield LanguageLoaded(Locale(event.language.code));
    }
  }
}