import 'package:diary_app/core/error/failure.dart';

/// {@template UnknownFailure}
/// A [Failure] returned when an unknown exception has occurred.
///
/// This is typically returned when a general [Exception] class is caught.
/// {@endtemplate}
class UnknownFailure extends Failure {
  /// {@macro UnknownFailure}
  UnknownFailure({
    super.message = "Something went wrong! We're looking into it",
  });
}
