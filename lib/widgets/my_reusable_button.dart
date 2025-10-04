import 'package:flutter/material.dart';
import 'package:blood_link/utils/size_config.dart';

class MyReusableButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color;

  const MyReusableButton(
      {required this.title,
      required this.onPress,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: SizeUtils.height(50),
        width: SizeUtils.width(350),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(SizeUtils.width(8)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: SizeUtils.fontSize(25),
            ),
          ),
        ),
      ),
    );
  }
}
