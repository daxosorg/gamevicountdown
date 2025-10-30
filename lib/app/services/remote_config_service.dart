import 'package:firebase_remote_config/firebase_remote_config.dart';

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
    final releaseDateString = _remoteConfig.getString('release_date');
    if (releaseDateString.isNotEmpty) {
      return DateTime.parse(releaseDateString);
    }
    return DateTime(2026, 5, 26);
  }

  String get bannerAdUnitId {
    final adUnitId = _remoteConfig.getString('banner_ad_unit_id');
    if (adUnitId.isNotEmpty) {
      return adUnitId;
    }
    return 'ca-app-pub-3940256099942544/6300978111';
  }

  String get appLink {
    final link = _remoteConfig.getString('app_link');
    if (link.isNotEmpty) {
      return link;
    }
    return 'Game countdown VI on play store';
  }
}
