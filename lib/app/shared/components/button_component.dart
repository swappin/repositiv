import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Function action;
  final String title;

  ButtonComponent({@required this.action, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.action,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(this.title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
