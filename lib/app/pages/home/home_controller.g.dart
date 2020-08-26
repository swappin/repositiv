// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$gitRepoAtom = Atom(name: '_HomeControllerBase.gitRepo');

  @override
  ObservableFuture<dynamic> get gitRepo {
    _$gitRepoAtom.reportRead();
    return super.gitRepo;
  }

  @override
  set gitRepo(ObservableFuture<dynamic> value) {
    _$gitRepoAtom.reportWrite(value, super.gitRepo, () {
      super.gitRepo = value;
    });
  }

  final _$filterAtom = Atom(name: '_HomeControllerBase.filter');

  @override
  int get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(int value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$isDescendingAtom = Atom(name: '_HomeControllerBase.isDescending');

  @override
  bool get isDescending {
    _$isDescendingAtom.reportRead();
    return super.isDescending;
  }

  @override
  set isDescending(bool value) {
    _$isDescendingAtom.reportWrite(value, super.isDescending, () {
      super.isDescending = value;
    });
  }

  final _$verifiedBookmarkListAtom =
      Atom(name: '_HomeControllerBase.verifiedBookmarkList');

  @override
  ObservableList<bool> get verifiedBookmarkList {
    _$verifiedBookmarkListAtom.reportRead();
    return super.verifiedBookmarkList;
  }

  @override
  set verifiedBookmarkList(ObservableList<bool> value) {
    _$verifiedBookmarkListAtom.reportWrite(value, super.verifiedBookmarkList,
        () {
      super.verifiedBookmarkList = value;
    });
  }

  final _$isBookmarkedAtom = Atom(name: '_HomeControllerBase.isBookmarked');

  @override
  bool get isBookmarked {
    _$isBookmarkedAtom.reportRead();
    return super.isBookmarked;
  }

  @override
  set isBookmarked(bool value) {
    _$isBookmarkedAtom.reportWrite(value, super.isBookmarked, () {
      super.isBookmarked = value;
    });
  }

  final _$bookmarkListAtom = Atom(name: '_HomeControllerBase.bookmarkList');

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

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic bookmarkGitRepo() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.bookmarkGitRepo');
    try {
      return super.bookmarkGitRepo();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchGitRepo() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.fetchGitRepo');
    try {
      return super.fetchGitRepo();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveRepo(Model model, int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.saveRepo');
    try {
      return super.saveRepo(model, index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getBookmarkList() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getBookmarkList');
    try {
      return super.getBookmarkList();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVerifiedBookGitRepos(int index, bool isBookmarked) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setVerifiedBookGitRepos');
    try {
      return super.setVerifiedBookGitRepos(index, isBookmarked);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterGitRepoList(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.filterGitRepoList');
    try {
      return super.filterGitRepoList(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFilterOrder() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeFilterOrder');
    try {
      return super.changeFilterOrder();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gitRepo: ${gitRepo},
filter: ${filter},
isDescending: ${isDescending},
verifiedBookmarkList: ${verifiedBookmarkList},
isBookmarked: ${isBookmarked},
bookmarkList: ${bookmarkList}
    ''';
  }
}
