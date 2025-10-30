import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/core/constants.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:get/get.dart';
import 'app/bindings/countdown_binding.dart';
import 'package:flutter_application_1/app/ui/countdown_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const GTACountdownApp());
}

class GTACountdownApp extends StatelessWidget {
  const GTACountdownApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: kAppTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kDarkBackground,
        fontFamily: kFontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: kAccentColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      initialBinding: CountdownBinding(),
      home: const CountdownScreen(),
    );
  }
}