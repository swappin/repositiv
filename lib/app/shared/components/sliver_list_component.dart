import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:repositiv/app/shared/components/icon_component.dart';

class SliverListItemComponent extends StatelessWidget {
  final int index;
  final String image;
  final String title;
  final String description;
  final String actionIcon;
  final String date;
  final String language;
  final int stars;
  final bool verifiedBookmarkList;
  final Function action;

  SliverListItemComponent(
      {@required this.index,
      this.image,
      this.title,
      this.description,
      this.actionIcon,
      this.date,
      this.language,
      this.stars,
      this.verifiedBookmarkList,
      this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.index == 0 ? Theme.of(context).primaryColor : Colors.white,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 28, 20, 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: this.index == 0 ? Colors.transparent : Color(0x44333333),
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
                        image: AssetImage(this.image),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nome: ${this.title}",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          this.description != null
                              ? this.description
                              : "Nenhuma descrição foi inserida.",
                          style: Theme.of(context).textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Opacity(opacity: 0.65,
                                    child:
                                    IconComponent(
                                      name: "date",
                                      width: 20,
                                    ),
                                  ),
                                  Container(
                                    width: 4,
                                  ),
                                  Text(
                                    this.date.substring(0, 10),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Opacity(opacity: 0.65,
                                    child:
                                    IconComponent(
                                      name: "star",
                                      width: 20,
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                  ),
                                  Text(
                                    this.stars.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            this.language != null ? Container(
                              child: Row(
                                children: [
                                  Opacity(opacity: 0.65,
                                    child:
                                    IconComponent(
                                      name: "language",
                                      width: 16,
                                    ),
                                  ),
                                  Container(
                                    width: 4,
                                  ),
                                  Text(this.language,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ) : Container(),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: verifiedBookmarkList == false
                        ? GestureDetector(
                            child: IconComponent(
                              name: "save",
                              width: 30,
                              height: 30,
                            ),
                            onTap: action,
                          )
                        : verifiedBookmarkList == true
                            ? IconComponent(
                                name: "saved",
                                width: 30,
                                height: 30,
                              )
                            : GestureDetector(
                                child: IconComponent(
                                  name: "delete",
                                  width: 36,
                                ),
                                onTap: action,
                              ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
