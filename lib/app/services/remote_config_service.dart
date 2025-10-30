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
    // Return a default date if the config is not available
    return DateTime(2026, 5, 26);
  }
}
