import 'package:diary_app/core/error/failures.dart';
import 'package:diary_app/feature/diary/domain/entities/diary_entity.dart';
import 'package:fpdart/fpdart.dart';

/// {@template diary_repository}
/// An abstract class for the diary repository
/// Handles the submission of the diary entry
/// {@endTemplate}
// ignore: one_member_abstracts
abstract class DiaryRepository {
  /// Submits the diary entry to the api.
  Future<Either<Failure, void>> createDiaryEntry(
    DiaryEntity diaryEntity,
  );
}
