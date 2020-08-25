import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:repositiv/app/shared/components/icon_component.dart';
import 'package:repositiv/app/shared/components/sliver_app_bar_delegate.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Repositórios',
          style: Theme.of(context).textTheme.headline2,
        ),
        leading: Padding(
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
                    if (controller.totalBookmark > 0)
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
                          controller.totalBookmark.toString(),
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
            } else if (controller.gitRepo.value == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<dynamic> list = controller.gitRepo.value;
              list.asMap().forEach((index, repository) {
                if (controller.bookmarkList.contains(list[index].name))
                  controller.setVerifiedBookGitRepos(index, true);
                else
                  controller.setVerifiedBookGitRepos(index, false);
              });
              return CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: 100,
                      maxHeight: 150,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Repositório",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Text(
                              "Flutter",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 150,
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        return Container(
                          color: index == 0 ? Theme.of(context).primaryColor : Colors.white,
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
                                          color: Theme.of(context).primaryColor,
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
                                              "Nome: ${list[index].name}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
                                            Text(
                                              list[index].description != null
                                                  ? list[index].description
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
                                                        list[index]
                                                            .createdAt
                                                            .substring(0, 10),
                                                        style: Theme.of(context)
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
                                                        list[index]
                                                            .stargazersCount
                                                            .toString(),
                                                        style: Theme.of(context)
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
                                                width: 36,
                                              );
                                            else
                                              return GestureDetector(
                                                child: IconComponent(
                                                  name: "save",
                                                  width: 36,
                                                ),
                                                onTap: () {
                                                  GitRepoModel model =
                                                      GitRepoModel();
                                                  model.id = list[index].id;
                                                  model.name = list[index].name;
                                                  model.description =
                                                      list[index].description;
                                                  model.language =
                                                      list[index].language;
                                                  model.createdAt =
                                                      list[index].createdAt;
                                                  model.stargazersCount =
                                                      list[index]
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
                      childCount: list.length,
                    ),
                  ),
                ],
              );
            }
          },
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
                                controller.saveRepo(model);

                                controller.setVerifiedBookGitRepos(index, true);
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
