import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:diary_app/injection_container.dart' as di;
import 'package:flutter/widgets.dart';

/// {@template AppBlocObserver}
/// A bloc observer that logs onChange and onError events
/// {@endTemplate}
class AppBlocObserver extends BlocObserver {
  /// {@macro AppBlocObserver}
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

/// Boostraps the application for cross flavor configurations
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here
  await di.init();

  runApp(await builder());
}
