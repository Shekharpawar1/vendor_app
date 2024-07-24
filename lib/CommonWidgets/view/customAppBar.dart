import 'package:flutter/material.dart';

class CustomAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;

  CustomAppBarBottom({required this.child, this.height = kToolbarHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: child,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
