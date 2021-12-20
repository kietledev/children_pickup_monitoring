import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:children_pickup_monitoring/common/core/params/get_all_conversations_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/usecases/message_page_usecase.dart';
import 'package:equatable/equatable.dart';

part 'message_page_event.dart';
part 'message_page_state.dart';

class MessagePageBloc extends Bloc<MessagePageEvent, MessagePageState> {
  MessagePageBloc(this._useCase) : super(MessagePageLoadingState());
  final MessagePageUseCase _useCase;

  @override
  Stream<MessagePageState> mapEventToState(
    MessagePageEvent event,
  ) async* {
    if (event is GetAllConversations) {
      final dataState = await _useCase(
          params: GetAllConversationsRequest(
              personId: event.personId, page: event.page));
      if (dataState is DataSuccess && dataState.data.toString().isNotEmpty) {
        final conversations = dataState.data!;
        yield MessagePageSuccessState(conversations: conversations);
      } else {
        yield MessagePageLoadingStateFailureState(
            msg: dataState.error!.message);
      }
    }
  }
}
