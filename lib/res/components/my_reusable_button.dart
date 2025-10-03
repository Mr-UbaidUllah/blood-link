

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyReusableButton extends StatelessWidget {

  final String title;
  final VoidCallback onPress;
  final Color color;

  const MyReusableButton({required this.title, required this.onPress, required this.color,  super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(title, style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),),
        ),
      ),
    );
  }
}
