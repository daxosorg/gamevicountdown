import 'dart:async';
import 'package:flutter_application_1/app/services/remote_config_service.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_application_1/core/constants.dart';

class CountdownController extends GetxController {
  final RemoteConfigService _remoteConfigService;

  var days = 0.obs;
  var hours = 0.obs;
  var minutes = 0.obs;
  var seconds = 0.obs;
  var isReleased = false.obs;
  var isLoading = true.obs;
  DateTime? releaseDate;

  Timer? _timer;

  CountdownController(this._remoteConfigService);

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    await _remoteConfigService.initialize();
    releaseDate = _remoteConfigService.releaseDate;
    isLoading.value = false;
    _startCountdown();
  }

  void _startCountdown() {
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTime());
  }

  void _updateTime() {
    if (releaseDate == null) return;
    final now = DateTime.now();
    final difference = releaseDate!.difference(now);

    if (difference.isNegative) {
      isReleased.value = true;
      days.value = hours.value = minutes.value = seconds.value = 0;
      _timer?.cancel();
    } else {
      days.value = difference.inDays;
      hours.value = difference.inHours % 24;
      minutes.value = difference.inMinutes % 60;
      seconds.value = difference.inSeconds % 60;
    }
  }

  void shareAppLink() {
    final appLink = _remoteConfigService.appLink;
    Share.share('$kShareMessagePrefix$appLink');
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
