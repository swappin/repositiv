import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:repositiv/app/shared/repositories/favorite_repository.dart';
import 'package:repositiv/app/shared/models/git_repo_model.dart';

part 'favorite_controller.g.dart';

class FavoriteController = _FavoriteControllerBase with _$FavoriteController;

abstract class _FavoriteControllerBase with Store {
  final FavoriteRepository repository;

  _FavoriteControllerBase({@required this.repository}) {
    getList();
  }

  @observable
  ObservableStream<List<GitRepoModel>> favoriteList;

  @action
  void getList() {
    favoriteList = repository.getFavorite().asObservable();
  }

  @action
  void delete(GitRepoModel model) {
    repository.deleteFavorite(model);
  }
}
