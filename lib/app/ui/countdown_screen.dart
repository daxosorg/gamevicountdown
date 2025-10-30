import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/countdown_controller.dart';
import 'package:flutter_application_1/app/ui/widgets/banner_ad_widget.dart';
import 'package:flutter_application_1/app/ui/widgets/countdown_header.dart';
import 'package:flutter_application_1/app/ui/widgets/responsive_countdown.dart';
import 'package:flutter_application_1/core/constants.dart';
import 'package:get/get.dart';

class CountdownScreen extends StatelessWidget {
  const CountdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CountdownController ctrl = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/bg2.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: LayoutBuilder(builder: (context, constraints) {
            const headerFontSize = 50.0;
            return Obx(() {
              if (ctrl.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8, top: 8),
                          child: IconButton(
                            icon: const Icon(Icons.share, color: Colors.white),
                            onPressed: () {
                              ctrl.shareAppLink();
                            },
                          ),
                        ),
                      ],
                    ),
                    CountdownHeader(
                      headerFontSize: headerFontSize,
                      releaseDate: ctrl.releaseDate!,
                    ),
                    const SizedBox(),
                    Obx(() {
                      if (ctrl.isReleased.value) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                kReleasedMessage,
                                style: TextStyle(
                                  height: 1,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: kReleasedMessageColor,
                                  shadows: [
                                    BoxShadow(
                                      color: kReleasedMessageColor
                                          .withOpacity(0.6),
                                      blurRadius: 10,
                                    )
                                  ],
                                ),
                              ),
                              const Text(
                                'Enjoy the game!',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return ResponsiveCountdown(
                        days: ctrl.days.value,
                        hours: ctrl.hours.value,
                        minutes: ctrl.minutes.value,
                        seconds: ctrl.seconds.value,
                        constraints: constraints,
                      );
                    }),
                    const SizedBox(),
                    const BannerAdWidget(),
                  ],
                ),
              );
            });
          }),
        ),
      ),
    );
  }
}
