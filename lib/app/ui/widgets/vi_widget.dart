import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants.dart';

class ViImage extends StatelessWidget {
  const ViImage({super.key});

  @override
  Widget build(BuildContext context) =>
      Image.asset(kViImagePath, height: 50);
}
