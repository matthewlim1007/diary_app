import 'package:diary_app/core/utils/http_client.dart';
import 'package:diary_app/feature/diary/di/diary_injector.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

/// The get it instance
final serviceLocator = GetIt.instance;

/// initializes all the services, usecases and repositories
Future<void> init() async {
  await initDiaryFeature(serviceLocator);

  serviceLocator
      .registerLazySingleton<MHttpClient>(() => MHttpClient(http.Client()));
}
