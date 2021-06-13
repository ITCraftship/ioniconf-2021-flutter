import 'package:flutter/material.dart';
import 'package:ioniconf_2021_flutter/app_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(AppWrapper());
}
