import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 25),
      height: 27,
      child: Image.asset('assets/logo.png'),
    );
  }
}
