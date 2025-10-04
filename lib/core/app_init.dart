import 'package:blood_link/utils/size_config.dart';
import 'package:flutter/material.dart';

class AppInit extends StatelessWidget {
  final Widget child;

  const AppInit({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return child;
  }
}
