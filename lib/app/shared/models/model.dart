import 'package:cloud_firestore/cloud_firestore.dart';

class Model {
  String name;
  String description;
  String language;
  String createdAt;
  int id;
  int stargazersCount;
  DocumentReference reference;

  Model({
    this.name = '',
    this.description = '',
    this.language = '',
    this.createdAt = '',
    this.id,
    this.stargazersCount,
    this.reference,
  });

  factory Model.fromDocument(DocumentSnapshot doc) {
    Map getDocs = doc.data();
    return Model(
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
