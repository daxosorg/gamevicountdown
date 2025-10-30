import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/ui/widgets/vi_widget.dart';

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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),
        Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                gtaStyledText('game'),
                gtaStyledText('      count'),
                gtaStyledText('   down'),
              ],
            ),
            const Positioned(
              right: -50,
              bottom: -10,
              child: ViImage(),
            ),
          ],
        ),
        const SizedBox.shrink(),
        const SizedBox.shrink(),
        const SizedBox.shrink(),
      ],
    );
  }
}
