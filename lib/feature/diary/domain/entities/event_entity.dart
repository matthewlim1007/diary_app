import 'package:equatable/equatable.dart';

/// {@template EventEntity}
/// The entity class for the diary event
/// {@endTemplate}
class EventEntity extends Equatable {
  /// {@macro EventEntity}
  const EventEntity({
    required this.id,
    required this.name,
  });

  /// The id of the event
  final int id;

  /// The name of the event
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
