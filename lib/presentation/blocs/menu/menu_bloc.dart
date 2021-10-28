import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';

part 'menu_event.dart';
part 'menu_state.dart';
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc(this._menusUseCase): super(FetchMenuLoadingState());
  final PostMenusUseCase _menusUseCase;
  @override
  Stream<MenuState> mapEventToState(
      MenuEvent event,
      ) async* {  if (event is FetchMenu) {
    final dataState = await _menusUseCase(
      params: PostMenusRequest(
        classTypeId:  event.classTypeId,
        currentDate:  event.currentDate,


      ),
    );
    print(dataState.data);
    if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
      final foodMenu = dataState.data!;
      yield FetchMenuSuccessState(foodMenu: foodMenu);
    } else {
      yield FetchMenuFailureState(msg: dataState.error!.message);
    }
  }
  }
}
