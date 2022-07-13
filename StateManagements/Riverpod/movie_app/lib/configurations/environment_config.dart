// Flutter: External Libraries
import 'package:flutter_riverpod/flutter_riverpod.dart';

// EnvironmentConfig: Configuration Class
class EnvironmentConfig {
  // We add the api key by running "flutter run --debug --dart-define=movieApiKey=MYKEY".
  final movieApiKey = const String.fromEnvironment("movieApiKey");
}

// environmentConfigProvider: Riverpod Provider
final environmentConfigProvider = Provider<EnvironmentConfig>(
  (ref) => EnvironmentConfig(),
);
