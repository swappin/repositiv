import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repositiv/app/shared/components/button_component.dart';

class ErrorComponent extends StatelessWidget {
  final String errorMessage;
  final String buttonText;

  ErrorComponent({@required this.errorMessage, this.buttonText});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 75),
              child: Image.asset(
                  'assets/vectors/assymetric_octocat.png'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.only(top: 50),
              child: Text(
                this.errorMessage,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: ButtonComponent(
                title: this.buttonText,
                action: () => Modular.to.pop(),
              ),
            ),
          ],
        ));
  }
}
