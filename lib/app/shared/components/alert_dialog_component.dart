import 'package:flutter/material.dart';

class AlertDialogComponent extends StatelessWidget {
  final Widget widget;

  AlertDialogComponent({@required this.widget});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        contentPadding: EdgeInsets.only(top: 10),
        content: Container(
          height: 200,
          child: this.widget
        ),
    );
  }
}
