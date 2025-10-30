import 'package:flutter/material.dart';

class CountdownHeader extends StatelessWidget {
  final double headerFontSize;
  final DateTime releaseDate;

  const CountdownHeader({
    super.key,
    required this.headerFontSize,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    Widget gtaStyledText(String text) {
      return Stack(
        children: <Widget>[
          // Stroked text
          Text(
            text,
            style: TextStyle(
              height: 1,
              fontSize: headerFontSize,
              fontFamily: 'Pricedown',
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 4
                ..color = Colors.black,
            ),
          ),
          // Solid text
          Text(
            text,
            style: TextStyle(
              height: 1,
              fontSize: headerFontSize,
              fontFamily: 'Pricedown',
              color: Colors.white,
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        gtaStyledText('game'),
        gtaStyledText('      count'),
        gtaStyledText('   down'),
      ],
    );
  }
}
