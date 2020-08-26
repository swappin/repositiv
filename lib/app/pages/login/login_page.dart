import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repositiv/app/shared/components/button_component.dart';
import 'package:repositiv/app/shared/components/text_input_component.dart';
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(75, 75, 75, 0),
                  child: Image.asset("assets/logotype.png"),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextInputComponent(
                            hintText: 'E-mail ou Telefone',
                            prefixIcon: 'profile',
                          )),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextInputComponent(
                            hintText: 'Senha de Acesso',
                            prefixIcon: 'password',
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Acessar minha conta",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Modular.to.pushNamed("/home");
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                padding: EdgeInsets.fromLTRB(32, 28, 32, 35),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Theme.of(context).primaryColor,
                                    Color(0xFFCC7A00),
                                  ]),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconComponent(
                                  name: "go",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20, 75, 20, 0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Não possui uma conta? ',
                      style: Theme.of(context).textTheme.subtitle1,
                      children: <TextSpan>[
                        TextSpan(
                          text: "Cadastre-se",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9C620E),
                          ),
                        ),
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
