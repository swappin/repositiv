import 'package:flutter/material.dart';
import 'package:repositiv/app/pages/bookmark/bookmark_controller.dart';
import 'package:repositiv/app/shared/components/button_component.dart';
import 'package:repositiv/app/shared/components/icon_component.dart';
import 'package:repositiv/app/shared/models/git_repo_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState
    extends ModularState<BookmarkPage, BookmarkController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Favoritos',
            style: Theme.of(context).textTheme.headline2,
          ),
          leading: GestureDetector(
            onTap: () => Modular.to.pop("/home"),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: IconComponent(
                name: "home",
                width: 20,
              ),
            ),
          ),
        ),
        body: Container(
          child: Observer(
            builder: (_) {
              if (controller.bookmarkList.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.bookmarkList.hasError) {
                return Center(
                  child: RaisedButton(
                    onPressed: controller.getList,
                    child: Text('Error'),
                  ),
                );
              } else {
                List<GitRepoModel> list = controller.bookmarkList.data;
                if (list.length > 0) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 35),
                              margin: EdgeInsets.only(bottom: 20),
                              child: Text(
                                "Meus Favoritos",
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (_, index) {
                            var model = list[index];
                            return Container(
                              color: index == 0
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              height: index == 2
                                  ? MediaQuery.of(context).size.height
                                  : 150,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(20, 28, 20, 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
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
                                                  "Nome: ${model.name}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                ),
                                                Text(
                                                  model.description != null
                                                      ? model.description
                                                      : "Nenhuma descrição foi inserida.",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                            model.createdAt
                                                                .toString(),
                                                            style: Theme.of(
                                                                    context)
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
                                                            model
                                                                .stargazersCount
                                                                .toString(),
                                                            style: Theme.of(
                                                                    context)
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
                                          GestureDetector(
                                            child: IconComponent(
                                              name: "delete",
                                              width: 36,
                                            ),
                                            onTap: () {
                                              _showDialog(model);
                                            },
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
                      list.length < 5
                          ? SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  Container(
                                    color: Colors.white,
                                    height: (150 * (5 - list.length)).toDouble(),
                                  ),
                                ],
                              ),
                            )
                          : null
                    ],
                  );
                } else {
                  return Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 75),
                            child: Image.asset(
                                "assets/vectors/assymetric_octocat.png"),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            margin: EdgeInsets.only(top: 50),
                            child: Text(
                              "Que pena! Você não tem nenhum repositório salvo... Vamos favoritar algo?",
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: ButtonComponent(
                              title: "Pesquisar Repositórios",
                              action: () => Modular.to.pop(),
                            ),
                          )
                        ],
                      ));
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(GitRepoModel model) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                      child: RichText(
                        text: TextSpan(
                          text: 'Certeza que deseja remover o repositório ',
                          style: Theme.of(context).textTheme.subtitle1,
                          children: <TextSpan>[
                            TextSpan(
                                text: model.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' dos favoritos?'),
                          ],
                        ),
                      )),
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
                      "Deletar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "Poppins",
                      ),
                    ),
                    onPressed: () {
                      controller.delete(model);
                      Modular.to.pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
