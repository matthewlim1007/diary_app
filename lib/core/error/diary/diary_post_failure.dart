import 'package:diary_app/core/error/failure.dart';

/// {@template DiaryPostFailure}
/// A [Failure] returned when posting of the diary entry failed.
/// {@endtemplate}
class DiaryPostFailure extends Failure {
  /// {@macro DiaryPostFailure}
  DiaryPostFailure({
    super.message = 'An error has occured while submitting your entry.',
  });
}
