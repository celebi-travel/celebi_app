// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_nav_bar_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomNavBarViewModel on _BottomNavBarViewModelBase, Store {
  final _$currentIndexAtom =
      Atom(name: '_BottomNavBarViewModelBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$_BottomNavBarViewModelBaseActionController =
      ActionController(name: '_BottomNavBarViewModelBase');

  @override
  void changeCurrentIndex(dynamic i, dynamic context) {
    final _$actionInfo = _$_BottomNavBarViewModelBaseActionController
        .startAction(name: '_BottomNavBarViewModelBase.changeCurrentIndex');
    try {
      return super.changeCurrentIndex(i, context);
    } finally {
      _$_BottomNavBarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
