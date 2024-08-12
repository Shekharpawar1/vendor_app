import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class ProgressBarWidget extends StatelessWidget {
  final double value;

  ProgressBarWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure the value is at least a small minimum value to make the bar visible
    final displayValue = value > 0 ? value : 0.01;

    return ProgressBar(
      value: displayValue, // ProgressBar expects a percentage (0 to 100)
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.purpleAccent, Colors.deepOrange],
      ),
    );
  }
}
