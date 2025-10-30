import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants.dart';

class TimeBlock extends StatelessWidget {
  final int value;
  final String label;
  final Orientation orientation;
  final BoxConstraints constraints;

  const TimeBlock({
    super.key,
    required this.value,
    required this.label,
    required this.orientation,
    required this.constraints,
  });

  String _formatTime(int value) =>
      value.toString().padLeft(2, kDatePaddingChar);

  @override
  Widget build(BuildContext context) {
    final isPortrait = orientation == Orientation.portrait;
    final screenWidth = constraints.maxWidth;

    double fontSize = isPortrait ? screenWidth / 6 : screenWidth / 12;

    final digitalTextStyle = TextStyle(
      height: 1,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: kAccentColor,
      fontFamily: kFontFamily,
    );

    final formattedValue =
        label == kDaysLabel ? value.toString() : _formatTime(value);

    final blockContent = Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kAccentColor.withOpacity(0.2), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(formattedValue, style: digitalTextStyle),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: isPortrait ? 18 : 14,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.8),
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );

    return isPortrait ? blockContent : Expanded(child: blockContent);
  }
}
