import 'package:equatable/equatable.dart';

/// {@template AreaEntity}
/// The entity class for the diary area
/// {@endTemplate}
class AreaEntity extends Equatable {
  /// {@macro AreaEntity}
  const AreaEntity({
    required this.id,
    required this.name,
  });

  /// The id of the area
  final int id;

  /// The name of the area
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
