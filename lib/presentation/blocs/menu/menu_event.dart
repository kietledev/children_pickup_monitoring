part of 'menu_bloc.dart';
abstract class MenuEvent extends Equatable {
  const MenuEvent({required this.classTypeId, required this.fromDate, required this.thruDate});
  final int classTypeId;
  final String fromDate;
  final String thruDate;

  @override
  List<Object> get props => [classTypeId, fromDate,thruDate];
}

class FetchMenu extends MenuEvent {
  const FetchMenu({required int classTypeId, required String fromDate, required String thruDate}) : super(classTypeId: classTypeId, fromDate:fromDate, thruDate:thruDate );
}
