import 'package:mobx/mobx.dart';
part 'button_navigation_bar_function.g.dart';

class ButtonNavvigationBarFunction = _ButtonNavvigationBarFunction
    with _$ButtonNavvigationBarFunction;

abstract class _ButtonNavvigationBarFunction with Store {
  @observable
  int selectedIndex = 0;

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
  }
}
