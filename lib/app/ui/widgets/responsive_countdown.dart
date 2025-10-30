import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/ui/widgets/time_block.dart';

import 'package:flutter_application_1/core/constants.dart';

class ResponsiveCountdown extends StatelessWidget {
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final Orientation orientation;
  final BoxConstraints constraints;

  const ResponsiveCountdown({
    super.key,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.orientation,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final isPortrait = orientation == Orientation.portrait;
    final timeBlocks = [
      TimeBlock(
        value: days,
        label: kDaysLabel,
        orientation: orientation,
        constraints: constraints,
      ),
      TimeBlock(
        value: hours,
        label: kHoursLabel,
        orientation: orientation,
        constraints: constraints,
      ),
      TimeBlock(
        value: minutes,
        label: kMinutesLabel,
        orientation: orientation,
        constraints: constraints,
      ),
      TimeBlock(
        value: seconds,
        label: kSecondsLabel,
        orientation: orientation,
        constraints: constraints,
      ),
    ];

    return isPortrait
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: timeBlocks
                .map((block) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: block,
                    ))
                .toList(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: timeBlocks
                .map((block) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: block,
                    ))
                .toList(),
          );
  }
}
