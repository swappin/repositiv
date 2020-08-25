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
        "assets/icons/$name.png",
        width: width != null ? width : 25,
        height: height != null ? height : 25,
      ),
    );
  }
}
