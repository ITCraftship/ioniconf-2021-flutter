import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:ioniconf_2021_flutter/core/injection/injection.dart';
import 'package:ioniconf_2021_flutter/jobs/application/jobs_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

Future<void> initialize() async {
  await configureInjection(Environment.dev);
  _configureOrientationAndStyle();
}

Future<void> _configureOrientationAndStyle() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
      ScreenBreakpoints(desktop: 1200, tablet: 1000, watch: 200));
}

class AppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'IONICONF_2021_FLUTTER',
      home: JobsPage(),
    );
  }
}
