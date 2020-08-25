import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repositiv/app/shared/components/ButtonComponent.dart';
import 'package:repositiv/app/shared/components/icon_component.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/login.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 75),
              margin: EdgeInsets.only(bottom: 50),
              child: Image.asset(
                  "assets/logotype.png"),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Usuário'
                ),
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Senha'
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35),
              child: Row(
                children: [
                  Expanded(
                    child: Text("Acessar minha conta",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconComponent(
                        name: "go",
                        width: 25,
                        height: 25,
                      )
                    ),
                  )
                ],
              ),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    text: 'Não possui uma conta? ',
                    style: Theme.of(context).textTheme.subtitle1,
                    children: <TextSpan>[
                      TextSpan(
                          text: "Cadastre-se",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
            ),
          ],
        ),
      )),
    );
  }
}
