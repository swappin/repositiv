import 'package:cloud_firestore/cloud_firestore.dart';

class GitRepoModel {
  String name;
  String description;
  String language;
  String createdAt;
  int id;
  int stargazersCount;
  DocumentReference reference;

  GitRepoModel({
    this.name = '',
    this.description = '',
    this.language = '',
    this.createdAt = '',
    this.id,
    this.stargazersCount,
    this.reference,
  });

  factory GitRepoModel.fromDocument(DocumentSnapshot doc) {
    Map getDocs = doc.data();
    return GitRepoModel(
      name: getDocs['name'],
      description: getDocs['description'],
      language: getDocs['language'],
      createdAt: getDocs['created_at'],
      id: getDocs['id'],
      stargazersCount: getDocs['stargazers_count'],
      reference: doc.reference,
    );
  }
}
