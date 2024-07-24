import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class ProgressBarWidget extends StatelessWidget {
  double value;
  ProgressBarWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      value: value,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.purpleAccent, Colors.deepOrange],
      ),
    );
  }
}