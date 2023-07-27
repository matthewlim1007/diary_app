import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/feature/diary/data/datasources/diary_remote_source.dart';
import 'package:diary_app/feature/diary/data/models/diary_model.dart';
import 'package:diary_app/feature/diary/domain/entities/diary_entity.dart';
import 'package:diary_app/feature/diary/domain/repositories/diary_repository.dart';
import 'package:fpdart/fpdart.dart';

/// {@template DiaryRepositoryImpl}
/// The implementation class of the [DiaryRepository]
/// {@endTemplate}
class DiaryRepositoryImpl extends DiaryRepository {
  /// {@macro DiaryRepositoryImpl}
  DiaryRepositoryImpl({
    required DiaryRemoteDatasource diaryRemoteDatasource,
  }) : _diaryRemoteDatasource = diaryRemoteDatasource;

  final DiaryRemoteDatasource _diaryRemoteDatasource;

  @override
  Future<Either<Failure, void>> createDiaryEntry(
    DiaryEntity diaryEntity,
  ) async {
    try {
      final model = DiaryModel(
        comments: diaryEntity.comments,
        diaryDate: diaryEntity.diaryDate,
        areaId: diaryEntity.areaId,
        taskCategoryId: diaryEntity.taskCategoryId,
        images: diaryEntity.images,
        isIncludeInPhotoGallery: diaryEntity.isIncludeInPhotoGallery,
        tags: diaryEntity.tags,
      );

      await _diaryRemoteDatasource.createDiaryEntry(model);

      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
