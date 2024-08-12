import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/utils/helper/colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  CustomRefreshIndicator({required this.child, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
      displacement: 40.0,
      color: primaryColor, // Customize color here
      backgroundColor: Colors.white, // Customize background color here
      strokeWidth: 3.0, // Customize stroke width here
    );
  }
}
