import 'package:flutter/material.dart';
import 'package:repositiv/app/pages/bookmark/bookmark_controller.dart';
import 'package:repositiv/app/pages/home/home_controller.dart';
import 'package:repositiv/app/pages/home/home_page.dart';
import 'package:repositiv/app/pages/login/login_controller.dart';
import 'package:repositiv/app/pages/login/login_page.dart';
import 'package:repositiv/app/shared/repositories/git_repo_repository.dart';
import 'package:repositiv/app/pages/bookmark/bookmark_page.dart';
import 'package:repositiv/app/shared/repositories/bookmark_repository.dart';
import 'package:repositiv/app/shared/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_controller.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
        Bind((i) => AppController()),
        Bind((i) => HomeController(repository: i.get<GitRepoRepository>())),
        Bind(
            (i) => BookmarkController(repository: i.get<BookmarkRepository>())),
        Bind((i) => BookmarkRepository(firestore: firestore)),
        Bind((i) => GitRepoRepository(dio: i.get<Dio>(), firestore: firestore)),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter('/login', child: (_, __) => LoginPage()),
        ModularRouter('/home', child: (_, __) => HomePage()),
        ModularRouter('/bookmark', child: (_, __) => BookmarkPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
