import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:repositiv/app/shared/models/git_repo_model.dart';
import 'package:repositiv/app/shared/repositories/bookmark_repository.dart';
import 'package:repositiv/app/shared/repositories/git_repo_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GitRepoRepository repository;
  BookmarkRepository bookmarkRepository;

  _HomeControllerBase({@required this.repository}) {
    getList();
    fetchGitRepo();
    getTotalBookmark();
  }

  @observable
  ObservableFuture gitRepo;


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
  void saveRepo(GitRepoModel model, int index) {
    repository.saveGitRepo(model).whenComplete(() {
      getTotalBookmark();
      bookmarkGitRepo();
    });
  }

  @observable
  ObservableList<String> abookmarkList = ObservableList<String>();


  @observable
  ObservableStream<List<GitRepoModel>> bookmarkList;

  @action
  void getList() {
    bookmarkList = repository.getBookmark().asObservable();
  }

  @action
  getBookmarkGitRepos() async {
    await repository.verifyBookmark().then((bookmark){
      bookmark.forEach((element) {
        abookmarkList.add(element.id);
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
