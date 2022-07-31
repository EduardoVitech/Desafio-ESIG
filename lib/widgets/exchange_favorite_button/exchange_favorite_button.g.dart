// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_favorite_button.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExchangeFavoriteButton on _ExchangeFavoriteButton, Store {
  late final _$isFavoriteAtom =
      Atom(name: '_ExchangeFavoriteButton.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$_ExchangeFavoriteButtonActionController =
      ActionController(name: '_ExchangeFavoriteButton', context: context);

  @override
  dynamic exchange() {
    final _$actionInfo = _$_ExchangeFavoriteButtonActionController.startAction(
        name: '_ExchangeFavoriteButton.exchange');
    try {
      return super.exchange();
    } finally {
      _$_ExchangeFavoriteButtonActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFavorite: ${isFavorite}
    ''';
  }
}
