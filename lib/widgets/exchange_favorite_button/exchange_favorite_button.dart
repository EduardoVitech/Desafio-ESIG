import 'package:mobx/mobx.dart';
part 'exchange_favorite_button.g.dart';

class ExchangeFavoriteButton = _ExchangeFavoriteButton
    with _$ExchangeFavoriteButton;

abstract class _ExchangeFavoriteButton with Store {
  @observable
  bool isFavorite = false;

  @action
  exchange() {
    isFavorite = !isFavorite;
  }
}
