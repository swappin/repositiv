import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/foundation.dart';
import 'package:repositiv/app/shared/models/git_repo_model.dart';

class FavoriteRepository extends Disposable {
  final FirebaseFirestore firestore;

  FavoriteRepository({@required this.firestore});

  @override
  void dispose() {}

  Stream<List<GitRepoModel>> getFavorite() {
    return firestore.collection('favorite').orderBy('id').snapshots().map(
        (query) =>
            query.docs.map((doc) => GitRepoModel.fromDocument(doc)).toList());
  }

  Future deleteFavorite(GitRepoModel model) {
    return model.reference.delete();
  }
}
