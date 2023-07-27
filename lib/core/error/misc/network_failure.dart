import 'package:diary_app/core/error/failure.dart';

/// {@template NetworkFailure}
/// A [Failure] returned when internet is unavailable.
/// {@endtemplate}
class NetworkFailure extends Failure {
  /// {@macro NetworkFailure}
  NetworkFailure({
    super.message = 'There is limited or no internet connection',
  });
}
