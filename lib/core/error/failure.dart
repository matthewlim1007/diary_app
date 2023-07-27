/// {@template Failure}
/// An [Exception] object representing an error that has occurred in a
/// repository.
/// {@endtemplate}
abstract class Failure implements Exception {
  /// {@macro Failure}
  const Failure({required this.message});

  /// User-friendly message displayed to the user.
  final String message;
}
