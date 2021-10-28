part of 'menu_bloc.dart';
abstract class MenuEvent extends Equatable {
  const MenuEvent({required this.classTypeId, required this.currentDate});
  final int classTypeId;
  final String currentDate;

  @override
  List<Object> get props => [classTypeId, currentDate];
}

class FetchMenu extends MenuEvent {
  const FetchMenu({required int classTypeId, required String currentDate}) : super(classTypeId: classTypeId, currentDate:currentDate);
}
