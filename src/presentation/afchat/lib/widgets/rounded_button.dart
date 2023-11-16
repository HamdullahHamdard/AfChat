import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final String name;
  final double height;
  final double width;
  final Function onPressed;

  const RoundedButton({super.key, required this.name, required this.height, required this.width, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextButton(
        onPressed: ()=>onPressed(),
        child: Text(name,
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
          height: 1.5,
        ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Color.fromRGBO(50, 129, 236, 1),
      ),
    );
  }
}
