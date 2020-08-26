import 'package:flutter/material.dart';
import 'package:repositiv/app/shared/components/icon_component.dart';

class TextInputComponent extends StatelessWidget {
  final String hintText;
  final String prefixIcon;

  TextInputComponent({@required this.hintText, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Opacity(
          opacity: 0.65,
          child: Container(
            padding: EdgeInsets.all(15),
            child: IconComponent(
              name: this.prefixIcon,
              width: 15,
            ),
          ),
        ),
        hintText: this.hintText,
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Color(0xFF9C620E), width: 1),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Color(0x33000000), width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
