part of 'menu_bloc.dart';

abstract class MenuState extends Equatable{
  const MenuState({this.foodMenu, this.msg});
  final List<FoodMenu>? foodMenu;
  final String? msg;
  @override
  List<Object> get props => [foodMenu!, msg!];
}
class FetchMenuLoadingState extends MenuState{}

class FetchMenuSuccessState extends MenuState{
  const FetchMenuSuccessState({required List<FoodMenu> foodMenu})
      : super(foodMenu: foodMenu);
}
class FetchMenuFailureState extends MenuState {
  const FetchMenuFailureState({required String msg}) : super(msg: msg);
}
