import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:repositiv/app/shared/components/drawer_component.dart';
import 'package:repositiv/app/shared/components/icon_component.dart';
import 'package:repositiv/app/shared/components/logo_component.dart';
import 'package:repositiv/app/shared/models/git_repo_model.dart';
import 'package:repositiv/app/pages/home/home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: LogoComponent(),
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://tecnoblog.net/wp-content/uploads/2018/01/LinuxCon-Europe-Linus-Torvalds.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(left: 20),
              width: 45,
              child: GestureDetector(
                onTap: () {
                  Modular.to.pushNamed('/bookmark');
                },
                child: Stack(
                  children: [
                    Container(
                        height: 60,
                        child: IconComponent(
                          name: "bookmark",
                        )),
                    Observer(builder: (_) {
                      List<GitRepoModel> bookmarkList =
                          controller.bookmarkList.data;
                      if (bookmarkList == null)
                        return Container();
                      else if (bookmarkList.length > 0 &&
                          controller.bookmarkList.data != null)
                        return Container(
                          height: 16,
                          width: 16,
                          margin: EdgeInsets.only(left: 12, top: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFEB4461),
                                  Color(0xFFA1122B),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            bookmarkList.length.toString(),
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        );
                      else
                        return Container();
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
        drawer: DrawerComponent(),
        body: Container(
          child: Observer(
            builder: (_) {
              if (controller.gitRepo.error != null) {
                return Center(
                  child: RaisedButton(
                    onPressed: () {
                      controller.fetchGitRepo();
                    },
                    child: Text('Tente Novamente'),
                  ),
                );
              } else if (controller.gitRepo.value == null ||
                  controller.bookmarkList.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<GitRepoModel> bookmarkList = controller.bookmarkList.data;
                List<dynamic> gitRepoList = controller.gitRepo.value;
                List<String> verifiedBookmarkList = [];
                bookmarkList.forEach((bookmark) {
                  verifiedBookmarkList.add(bookmark.name);
                });
                gitRepoList.asMap().forEach((index, repository) {
                  if (verifiedBookmarkList.contains(gitRepoList[index].name)) {
                    controller.setVerifiedBookGitRepos(index, true);
                  } else {
                    controller.setVerifiedBookGitRepos(index, false);
                  }
                });

                return CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 35),
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "Repositório",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 35),
                            margin: EdgeInsets.only(bottom: 30),
                            child: Text(
                              "Flutter",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) {
                          return Container(
                            color: index == 0
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20, 28, 20, 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                ),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: index == 0
                                        ? Colors.transparent
                                        : Color(0x44333333),
                                    offset: Offset(1, -15),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 75,
                                          height: 75,
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/octocat.jpg"),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Nome: ${gitRepoList[index].name}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4,
                                              ),
                                              Text(
                                                gitRepoList[index]
                                                            .description !=
                                                        null
                                                    ? gitRepoList[index]
                                                        .description
                                                    : "Nenhuma descrição foi inserida.",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    child: Row(
                                                      children: [
                                                        IconComponent(
                                                          name: "date",
                                                          width: 20,
                                                        ),
                                                        Container(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          gitRepoList[index]
                                                              .createdAt
                                                              .substring(0, 10),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        IconComponent(
                                                          name: "star",
                                                          width: 20,
                                                        ),
                                                        Container(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          gitRepoList[index]
                                                              .stargazersCount
                                                              .toString(),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Observer(
                                            builder: (_) {
                                              if (controller
                                                  .verifiedBookmarkList[index])
                                                return IconComponent(
                                                  name: "saved",
                                                  width: 30,
                                                  height: 30,
                                                );
                                              else
                                                return GestureDetector(
                                                  child: IconComponent(
                                                    name: "save",
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                  onTap: () {
                                                    GitRepoModel model =
                                                        GitRepoModel();
                                                    model.id =
                                                        gitRepoList[index].id;
                                                    model.name =
                                                        gitRepoList[index].name;
                                                    model.description =
                                                        gitRepoList[index]
                                                            .description;
                                                    model.language =
                                                        gitRepoList[index]
                                                            .language;
                                                    model.createdAt =
                                                        gitRepoList[index]
                                                            .createdAt;
                                                    model.stargazersCount =
                                                        gitRepoList[index]
                                                            .stargazersCount;
                                                    _showDialog(index, model);
                                                  },
                                                );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: gitRepoList.length,
                      ),
                    ),
                    gitRepoList.length < 5
                        ? SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                Container(
                                  color: Colors.white,
                                  height: (150 * (5 - gitRepoList.length))
                                      .toDouble(),
                                ),
                              ],
                            ),
                          )
                        : SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                Container(),
                              ],
                            ),
                          )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(int index, GitRepoModel model) async {
    controller.isBookmarked = false;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Observer(
          builder: (_) {
            return controller.isBookmarked
                ? AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    contentPadding: EdgeInsets.only(top: 10),
                    content: Container(
                      height: 200,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        child: FlareActor('assets/animations/success.flr',
                            animation: "success"),
                      ),
                    ))
                : AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    contentPadding: EdgeInsets.only(top: 10),
                    content: Container(
                      height: 200,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              child: Text("Deseja favoritas repositório?"),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                "Salvar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              onPressed: () async {
                                controller.saveRepo(model, index);
                                await Future.delayed(
                                        const Duration(milliseconds: 2500))
                                    .then((value) => Modular.to.pop());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
