import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:ioniconf_2021_flutter/core/config/config.dart';
import 'package:ioniconf_2021_flutter/core/injection/injection.config.dart';
import 'package:ioniconf_2021_flutter/core/networking/network_manager.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(generateForDir: ['lib', 'bin', 'test'])
Future<void> configureInjection(String environment) async {
  await $initGetIt(getIt, environment: environment);
}

@module
abstract class RegisterModule {
  @Named(apiBaseUrl)
  String get baseUrl => getIt<Config>().apiUrl;
}
