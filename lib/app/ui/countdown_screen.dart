import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/countdown_controller.dart';
import 'package:flutter_application_1/app/ui/widgets/countdown_header.dart';
import 'package:flutter_application_1/app/ui/widgets/responsive_countdown.dart';
import 'package:flutter_application_1/app/ui/widgets/viWidget.dart';
import 'package:flutter_application_1/core/constants.dart';
import 'package:get/get.dart';

class CountdownScreen extends StatelessWidget {
  const CountdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CountdownController ctrl = Get.find();
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          final isPortrait = constraints.maxWidth < 600;
          final headerFontSize = isPortrait ? 50.0 : 32.0;

          return Obx(() {
            if (ctrl.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(24),
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CountdownHeader(
                            headerFontSize: headerFontSize,
                            releaseDate: ctrl.releaseDate!,
                          ),
                          const Positioned(
                            bottom: -10,
                            right: -40,
                            child: ViWidget(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Obx(() {
                        if (ctrl.isReleased.value) {
                          return Text(
                            kReleasedMessage,
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: kAccentColor,
                              shadows: [
                                BoxShadow(
                                  color: kAccentColor.withOpacity(0.6),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                          );
                        }
                        return ResponsiveCountdown(
                          days: ctrl.days.value,
                          hours: ctrl.hours.value,
                          minutes: ctrl.minutes.value,
                          seconds: ctrl.seconds.value,
                          orientation: orientation,
                          constraints: constraints,
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          });
        }),
      ),
    );
  }
}
