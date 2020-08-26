// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookmarkController on _BookmarkControllerBase, Store {
  final _$bookmarkListAtom = Atom(name: '_BookmarkControllerBase.bookmarkList');

  @override
  ObservableStream<List<Model>> get bookmarkList {
    _$bookmarkListAtom.reportRead();
    return super.bookmarkList;
  }

  @override
  set bookmarkList(ObservableStream<List<Model>> value) {
    _$bookmarkListAtom.reportWrite(value, super.bookmarkList, () {
      super.bookmarkList = value;
    });
  }

  final _$_BookmarkControllerBaseActionController =
      ActionController(name: '_BookmarkControllerBase');

  @override
  void getBookmarkList() {
    final _$actionInfo = _$_BookmarkControllerBaseActionController.startAction(
        name: '_BookmarkControllerBase.getBookmarkList');
    try {
      return super.getBookmarkList();
    } finally {
      _$_BookmarkControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(Model model) {
    final _$actionInfo = _$_BookmarkControllerBaseActionController.startAction(
        name: '_BookmarkControllerBase.delete');
    try {
      return super.delete(model);
    } finally {
      _$_BookmarkControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bookmarkList: ${bookmarkList}
    ''';
  }
}
