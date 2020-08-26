/*
 Mensagem Importante:  Drawer é para ser dinâmica,
 mas nessa caso foi removida apenas para legibilidade do cógido.
*/

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repositiv/app/shared/components/icon_component.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://tecnoblog.net/wp-content/uploads/2018/01/LinuxCon-Europe-Linus-Torvalds.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Linus Torvalds',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text('Desenvolver Ultra Senior'),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                IconComponent(
                                  name: 'date',
                                  width: 16,
                                ),
                                Container(
                                  width: 4,
                                ),
                                Text(
                                  'Último login: ${DateTime.now().toString().substring(0, 10)}',
                                  style:
                                  Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE5E5E5),
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  child: Opacity(
                    opacity: 0.65,
                    child: IconComponent(
                      name: 'save',
                      width: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Meus Favoritos'),
                  ),
                ),
                Container(
                  child: Opacity(
                    opacity: 0.65,
                    child: IconComponent(
                      name: 'arrow_right',
                      width: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE5E5E5),
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  child: Opacity(
                    opacity: 0.65,
                    child: IconComponent(
                      name: 'reload',
                      width: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Configurações'),
                  ),
                ),
                Container(
                  child: Opacity(
                    opacity: 0.65,
                    child: IconComponent(
                      name: 'arrow_right',
                      width: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: (){
              Modular.to.pushNamed('/login');
            },
            child:
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: EdgeInsets.only(bottom: 50),
              child: Row(
                children: [
                  Container(
                    child: Opacity(
                      opacity: 0.65,
                      child: IconComponent(
                        name: 'exit',
                        width: 15,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Sair da Conta'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
