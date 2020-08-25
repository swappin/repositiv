import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:repositiv/app/shared/repositories/git_repo_repository.dart';
import 'package:repositiv/app/pages/favorite/bookmark_page.dart';
import 'package:repositiv/app/shared/repositories/favorite_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'pages/favorite/bookmark_controller.dart';
import 'pages/home/home_controller.dart';
import 'pages/home/home_page.dart';
import 'shared/utils/constants.dart';
import 'shared/repositories/git_repo_repository.dart';

class AppModule extends MainModule {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController(repository: i.get<GitRepoRepository>())),
        Bind((i) => BookmarkController(repository: i.get<BookmarkRepository>())),
        Bind((i) => BookmarkRepository(firestore: firestore)),
        Bind((i) => GitRepoRepository(dio: i.get<Dio>(), firestore: firestore)),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/home', child: (_, __) => HomePage()),
        ModularRouter('/bookmark', child: (_, __) => BookmarkPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
