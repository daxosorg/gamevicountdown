import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/ui/widgets/time_block.dart';

import 'package:flutter_application_1/core/constants.dart';

class ResponsiveCountdown extends StatelessWidget {
  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  final BoxConstraints constraints;

  const ResponsiveCountdown({
    super.key,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final timeBlocks = [
      TimeBlock(
        value: days,
        label: kDaysLabel,
        constraints: constraints,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TimeBlock(
            value: hours,
            label: kHoursLabel,
            constraints: constraints,
          ),
          const SizedBox(width: 10),
          TimeBlock(
            value: minutes,
            label: kMinutesLabel,
            constraints: constraints,
          ),
          const SizedBox(width: 10),
          TimeBlock(
            value: seconds,
            label: kSecondsLabel,
            constraints: constraints,
          ),
        ],
      ),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: timeBlocks
          .map((block) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: block,
              ))
          .toList(),
    );
  }
}
