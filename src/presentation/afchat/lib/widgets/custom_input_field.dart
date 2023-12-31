import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final Function(String) onSaved;
  final String regEx;
  final String hintText;
  final bool obscureText;

  const CustomInputField(
      {super.key,
      required this.onSaved,
      required this.regEx,
      required this.hintText,
      required this.obscureText
      });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (_value) => onSaved(_value!),
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      obscureText: obscureText,
      validator: (_value) {
        return RegExp(regEx).hasMatch(_value!) ? null: "Enter a valid value";
      },
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(50, 129, 236, 1),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white54)),
    );
  }
}
