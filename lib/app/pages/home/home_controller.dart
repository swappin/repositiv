import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:repositiv/app/shared/models/git_repo_model.dart';
import 'package:repositiv/app/shared/repositories/git_repo_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GitRepoRepository repository;

  _HomeControllerBase({@required this.repository}) {
    fetchGitRepo();
    getTotalBookmark();
    getBookmarkGitRepos();
  }

  @observable
  ObservableFuture gitRepo;

  @observable
  ObservableList<String> bookmarkList = ObservableList<String>();

  @observable
  ObservableList<bool> verifiedBookmarkList = ObservableList<bool>();

  @observable
  int totalBookmark = 0;

  @observable
  bool isBookmarked = false;

  @action
  bookmarkGitRepo() => isBookmarked = !isBookmarked;


  @action
  fetchGitRepo() {
    gitRepo = repository.getGitRepo().asObservable();
  }

  @action
  void saveRepo(GitRepoModel model) {
    repository.saveGitRepo(model).whenComplete(() {
      getTotalBookmark();
      bookmarkGitRepo();
    });
  }

  @action
  getBookmarkGitRepos() async {
    await repository.verifyBookmark().then((bookmark){
      bookmark.forEach((element) {
        bookmarkList.add(element.id);
      });
    });
  }

  @action
  setVerifiedBookGitRepos(int index, bool isBookmarked){
    verifiedBookmarkList.insert(index, isBookmarked);
    return verifiedBookmarkList;
  }

  @action
  getTotalBookmark() async {
    totalBookmark = await repository.countBookmark();
  }
}
