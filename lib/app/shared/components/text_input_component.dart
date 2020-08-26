import 'package:flutter/material.dart';
import 'package:repositiv/app/shared/components/icon_component.dart';

class TextInputComponent extends StatelessWidget {
  final String hintText;
  final String prefixIcon;
  final bool obscuredText;

  TextInputComponent({@required this.hintText, this.prefixIcon, this.obscuredText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Color(0xFF9C620E),
      cursorWidth: 4,
      obscureText: this.obscuredText != null ? this.obscuredText : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFE8E8E8),
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
            BorderSide(color: Color(0xFF9C620E), width: 2),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Color(0xAA9C620E), width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
