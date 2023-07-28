import 'package:equatable/equatable.dart';

/// {@template TaskCategoryEntity}
/// The entity class for the diary task category
/// {@endTemplate}
class TaskCategoryEntity extends Equatable {
  /// {@macro TaskCategoryEntity}
  const TaskCategoryEntity({
    required this.id,
    required this.name,
  });

  /// The id of the task category
  final int id;

  /// The name of the task category
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
