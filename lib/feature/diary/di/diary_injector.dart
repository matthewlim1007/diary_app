import 'package:diary_app/feature/diary/data/datasources/diary_remote_source.dart';
import 'package:diary_app/feature/diary/data/repositories/diary_repository_impl.dart';
import 'package:diary_app/feature/diary/domain/repositories/diary_repository.dart';
import 'package:diary_app/feature/diary/domain/usecases/create_diary_use_case.dart';
import 'package:diary_app/feature/diary/presentation/bloc/diary_bloc.dart';
import 'package:get_it/get_it.dart';

/// Injects all ekyc feature factories
Future<void> initDiaryFeature(GetIt serviceLocator) async {
  serviceLocator
    // DataSources
    ..registerLazySingleton<DiaryRemoteDatasource>(
      () => DiaryRemoteDatasourceImpl2(httpClient: serviceLocator()),
    )

    // Repositories
    ..registerLazySingleton<DiaryRepository>(
      () => DiaryRepositoryImpl(
        diaryRemoteDatasource: serviceLocator(),
      ),
    )

    // Use Cases
    ..registerLazySingleton(
      () => CreateDiaryUseCase(serviceLocator()),
    )

    /// Blocs
    ..registerFactory(
      () => DiaryBloc(
        createDiaryUseCase: serviceLocator(),
      ),
    );
}
