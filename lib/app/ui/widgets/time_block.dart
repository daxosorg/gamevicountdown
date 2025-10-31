import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants.dart';

class TimeBlock extends StatelessWidget {
  final int value;
  final String label;

  final BoxConstraints constraints;

  const TimeBlock({
    super.key,
    required this.value,
    required this.label,
    required this.constraints,
  });

  String _formatTime(int value) => value.toString().padLeft(2, kPaddingChar);

  @override
  Widget build(BuildContext context) {
    final screenWidth = constraints.maxWidth;
    double fontSize = screenWidth / 6;

    final formattedValue =
        label.toLowerCase() == kDaysLabelLower ? value.toString() : _formatTime(value);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              formattedValue,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1,
              ),
            ),
          ),
          // const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.9),
                letterSpacing: 2,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
