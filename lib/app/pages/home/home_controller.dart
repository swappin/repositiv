import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:repositiv/app/shared/models/git_repo_model.dart';
import 'package:repositiv/app/shared/repositories/git_repo_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GitRepoRepository repository;

  _HomeControllerBase({@required this.repository}) {
    getTotalFavorite();
    fetchGitRepo();
  }

  @observable
  ObservableFuture gitRepo;

  @observable
  int totalFavorite = 0;

  @observable
  bool isTotalIncreased;

  @action
  fetchGitRepo() {
    gitRepo = repository.getGitRepo().asObservable();
  }

  @action
  void saveRepo(GitRepoModel model) {
    repository.saveGitRepo(model).whenComplete(() => getTotalFavorite());
  }

  @action
  getTotalFavorite() async {
    int verifyTotalFavorites = totalFavorite;
    totalFavorite = await repository.countFavorite();
    if(totalFavorite == verifyTotalFavorites) isTotalIncreased = false;
    else isTotalIncreased = true;
  }
}
