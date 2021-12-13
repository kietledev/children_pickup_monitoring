part of 'message_page_bloc.dart';

abstract class MessagePageState extends Equatable {
  const MessagePageState({this.conversations, this.msg});
  final List<Conversation>? conversations;
  final String? msg;

  @override
  List<Object> get props => [conversations!, msg!];
}

class MessagePageLoadingState extends MessagePageState {}

class MessagePageSuccessState extends MessagePageState {
  const MessagePageSuccessState({required List<Conversation> conversations})
      : super(conversations: conversations);
}

class MessagePageLoadingStateFailureState extends MessagePageState {
  const MessagePageLoadingStateFailureState({required String msg})
      : super(msg: msg);
}
