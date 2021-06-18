import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

typedef ConfigCallback = Config Function(String env, String apiUrl);

abstract class Config {
  final String env;
  final String apiUrl;

  Config(this.env, this.apiUrl);

  static Future<Config> getConfig(
      String config, ConfigCallback configFactory) async {
    final configString =
        await rootBundle.loadString('config/${config}_config.json');
    final decodedConfig = json.decode(configString) as Map<String, dynamic>;
    return configFactory(
      decodedConfig['env'] as String,
      decodedConfig['apiUrl'] as String,
    );
  }
}

@dev
@preResolve
@Singleton(as: Config)
class DevConfig extends Config {
  DevConfig(
    String env,
    String apiUrl,
  ) : super(
          env,
          apiUrl,
        );

  @factoryMethod
  static Future<Config> create() async {
    return Config.getConfig(
      Environment.dev,
      (env, apiUrl) => DevConfig(env, apiUrl),
    );
  }
}
