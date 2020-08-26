import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/foundation.dart';
import 'package:repositiv/app/shared/models/git_repo_model.dart';

class BookmarkRepository extends Disposable {
  final Dio dio;
  final FirebaseFirestore firestore;

  BookmarkRepository({@required this.dio, this.firestore});

  @override
  void dispose() {}

  Stream<List<GitRepoModel>> getBookmark() {
    return firestore.collection('bookmark').orderBy('id').snapshots().map(
        (query) =>
            query.docs.map((doc) => GitRepoModel.fromDocument(doc)).toList());
  }

  Future deleteBookmark(GitRepoModel model) {
    return model.reference.delete();
  }

  Future<List<GitRepoModel>> getGitRepo() async {
    var response = await dio.get('/flutter/repos');
    List<GitRepoModel> list = List<GitRepoModel>();
    for (var item in (response.data as List)) {
      GitRepoModel model = GitRepoModel(
        name: item['name'],
        description: item['description'],
        language: item['language'],
        createdAt: item['created_at'],
        id: item['id'],
        stargazersCount: item['stargazers_count'],
      );
      list.add(model);
    }
    return list;
  }


  @override
  Future saveGitRepo(GitRepoModel model) async {
    var total = (await firestore.collection('bookmark').get())
        .docs
        .length;

    if (model.reference == null) {
      CollectionReference collection =
      await firestore.collection('bookmark');

      collection.doc(model.name).set({
        'id': model.id,
        'name': model.name,
        'description': model.description,
        'language': model.language != null ? model.language : "Nenhuma",
        'created_at': model.createdAt,
        'stargazers_count': model.stargazersCount,
        'saved_at': DateTime.now(),
      });
    } else {
      model.reference.update({
        'name': model.name,
        'description': model.description,
        'language': model.language != null ? model.language : "Nenhuma",
        'created_at': model.createdAt,
        'stargazers_count': model.stargazersCount,
      });
    }
  }

  @override
  Future<int> countBookmark() async {
    return firestore
        .collection('bookmark')
        .get()
        .then((value) => value.docs.length);
  }

  @override
  Future<List<QueryDocumentSnapshot>> verifyBookmark() async {
    return firestore
        .collection('bookmark')
        .get()
        .then((value) => value.docs);
  }
}