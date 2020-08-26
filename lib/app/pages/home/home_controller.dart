import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:repositiv/app/shared/models/model.dart';
import 'package:repositiv/app/shared/repositories/repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final BookmarkRepository repository;

  _HomeControllerBase({@required this.repository}) {
    getBookmarkList();
    fetchGitRepo();
  }

  @observable
  ObservableFuture gitRepo;

  @observable
  int filter = 1;

  @observable
  bool isDescending = false;

  @observable
  ObservableList<bool> verifiedBookmarkList = ObservableList<bool>();

  @observable
  bool isBookmarked = false;

  @action
  bookmarkGitRepo() => isBookmarked = !isBookmarked;

  @action
  fetchGitRepo() {
    gitRepo = repository.getGitRepo().asObservable();
  }

  @action
  void saveRepo(Model model, int index) {
    repository.saveGitRepo(model).whenComplete(() {
      bookmarkGitRepo();
    });
  }

  @observable
  ObservableStream<List<Model>> bookmarkList;

  @action
  void getBookmarkList() {
    bookmarkList = repository.getBookmark().asObservable();
  }

  @action
  setVerifiedBookGitRepos(int index, bool isBookmarked){
    verifiedBookmarkList.insert(index, isBookmarked);
    return verifiedBookmarkList;
  }

  @action
  filterGitRepoList(int index){
    filter = index;
  }

  @action
  changeFilterOrder() => isDescending = !isDescending;
}
