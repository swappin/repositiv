import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:repositiv/app/shared/repositories/bookmark_repository.dart';
import 'package:repositiv/app/shared/models/git_repo_model.dart';

part 'bookmark_controller.g.dart';

class BookmarkController = _BookmarkControllerBase with _$BookmarkController;

abstract class _BookmarkControllerBase with Store {
  final BookmarkRepository repository;

  _BookmarkControllerBase({@required this.repository}) {
    getBookmarkList();
  }

  @observable
  ObservableStream<List<GitRepoModel>> bookmarkList;

  @action
  void getBookmarkList() {
    bookmarkList = repository.getBookmark().asObservable();
  }

  @action
  void delete(GitRepoModel model) {
    repository.deleteBookmark(model);
  }
}
