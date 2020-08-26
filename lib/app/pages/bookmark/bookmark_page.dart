import 'package:flutter/material.dart';
import 'package:repositiv/app/pages/bookmark/bookmark_controller.dart';
import 'package:repositiv/app/shared/components/alert_dialog_component.dart';
import 'package:repositiv/app/shared/components/error_component.dart';
import 'package:repositiv/app/shared/components/sliver_list_item_component.dart';
import 'package:repositiv/app/shared/components/icon_component.dart';
import 'package:repositiv/app/shared/models/model.dart';
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
              if (controller.bookmarkList.hasError) {
                return ErrorComponent(
                  errorMessage: "Ooops! Algo deu errado!",
                  buttonText: "Retornar",
                );
              } else {
                List<Model> bookmarkList = controller.bookmarkList.data;
                if (bookmarkList.length > 0) {
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
                            var model = bookmarkList[index];
                            return SliverListItemComponent(
                              index: index,
                              image: "assets/octocat.jpg",
                              title: bookmarkList[index].name,
                              description: bookmarkList[index].description,
                              actionIcon: "save",
                              date: bookmarkList[index].createdAt,
                              language: bookmarkList[index].language,
                              stars: bookmarkList[index].stargazersCount,
                              verifiedBookmarkList: null,
                              action: () {
                                _showDialog(model);
                              },
                            );
                          },
                          childCount: bookmarkList.length,
                        ),
                      ),
                      bookmarkList.length < 5
                          ? SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  Container(
                                    color: Colors.white,
                                    height:
                                        (MediaQuery.of(context).size.height -
                                                (bookmarkList.length * 150))
                                            .toDouble(),
                                  ),
                                ],
                              ),
                            )
                          : SliverList(
                        delegate: SliverChildListDelegate([
                          Container(),
                        ]),
                      )
                    ],
                  );
                } else {
                  return ErrorComponent(
                    errorMessage:
                        "Que pena! Você não tem nenhum repositório salvo... Vamos favoritar algo?",
                    buttonText: "Pesquisar Repositórios",
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(Model model) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogComponent(
          widget: Column(
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
                  ),
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
                    "Deletar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
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
        );
      },
    );
  }
}
