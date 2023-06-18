import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldtimes/app_state_observer.dart';
import 'package:worldtimes/core/logs/primary_logger.dart';
import 'package:worldtimes/locator.dart';

/// Bootstrap is responsible for any common setup and calls
/// [runApp] with the widget returned by [builder] in an error zone.
///
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      Bloc.observer = const AppStateObserver();
      WidgetsFlutterBinding.ensureInitialized();

      /// Status bar configuration
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,

          /// navigation bar color
          statusBarColor: Colors.transparent,

          /// status bar color
          statusBarIconBrightness: Brightness.dark,
        ),
      );

      await setupLocator();

      locator.allReady().then((value) async {
        runApp(await builder());
      });
    },
    (error, stackTrace) {
      primaryLogger.wtf('**Error Below**\n', error, stackTrace);
    },
  );
}
