part of 'users_bloc.dart';





abstract class UsersEvent extends Equatable {

  final int page;
  final int pageSize	;
  const UsersEvent({required this.page, required this.pageSize});
  @override
  List<Object> get props => [page,pageSize];
}

class FetchUsers extends UsersEvent {
  const FetchUsers({required int page, required int pageSize}) : super(page: page,pageSize: pageSize);
}

