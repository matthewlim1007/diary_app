import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/core/usecases/use_case.dart';
import 'package:diary_app/feature/diary/domain/entities/diary_entity.dart';
import 'package:diary_app/feature/diary/domain/repositories/diary_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

/// {@template CreateDiaryUseCase}
/// Creates a diary entry use case
/// {@endTemplate}
class CreateDiaryUseCase implements UseCase<void, CreateDiaryParam> {
  /// {@macro CreateDiaryUseCase}
  CreateDiaryUseCase(this.repository);

  /// An instance of the authentication repository
  late final DiaryRepository repository;

  @override
  Future<Either<Failure, void>> call(
    CreateDiaryParam params,
  ) async {
    return repository.createDiaryEntry(params.diaryEntity);
  }
}

/// {@template CreateDiaryParam}
/// A class that stores the parameters for [CreateDiaryUseCase] use case
/// {@endTemplate}
class CreateDiaryParam extends Equatable {
  /// {@macro CreateDiaryParam}
  const CreateDiaryParam({required this.diaryEntity});

  /// The diary entity to be created
  final DiaryEntity diaryEntity;

  @override
  List<Object?> get props => [diaryEntity];
}
