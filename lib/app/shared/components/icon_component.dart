import 'package:flutter/material.dart';

class IconComponent extends StatelessWidget {
  double width;
  double height;
  String name;

  IconComponent({this.name, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.75,
      child: Image.asset(
        'assets/icons/${this.name}.png',
        width: this.width != null ? this.width : 25,
        height: this.height != null ? this.height : 25,
      ),
    );
  }
}
