import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_application_1/core/constants.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService(this._remoteConfig);

  Future<void> initialize() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 0),
    ));
    await _remoteConfig.fetch();
    await _remoteConfig.activate();
  }

  DateTime get releaseDate {
    final releaseDateString = _remoteConfig.getString(kRemoteConfigReleaseDateKey);
    if (releaseDateString.isNotEmpty) {
      return DateTime.parse(releaseDateString);
    }
    return DateTime(2026, 5, 26);
  }

  String get bannerAdUnitId {
    final adUnitId = _remoteConfig.getString(kRemoteConfigBannerAdUnitIdKey);
    if (adUnitId.isNotEmpty) {
      return adUnitId;
    }
    return kDefaultBannerAdUnitId;
  }

  String get appLink {
    final link = _remoteConfig.getString(kRemoteConfigAppLinkKey);
    if (link.isNotEmpty) {
      return link;
    }
    return kDefaultAppLinkDescription;
  }
}
