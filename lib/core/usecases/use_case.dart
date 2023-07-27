import 'package:diary_app/core/error/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

/// An abstract class used for the creation of use cases
// ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  /// A function that calls the repository from the presentation layer
  Future<Either<Failure, Type>> call(Params params);
}

/// A class used when a parameter class is not needed
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
