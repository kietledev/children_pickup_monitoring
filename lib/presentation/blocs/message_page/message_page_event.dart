part of 'message_page_bloc.dart';

abstract class MessagePageEvent extends Equatable {
  const MessagePageEvent({required this.personId, required this.page});
  final int personId;
  final int page;

  @override
  List<Object> get props => [personId, page];
}

class GetAllConversations extends MessagePageEvent {
  const GetAllConversations({
    required int personId,
    required int page,
  }) : super(personId: personId, page: page);
}
