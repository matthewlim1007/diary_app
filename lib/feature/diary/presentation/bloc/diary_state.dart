part of 'diary_bloc.dart';

/// {@template diary_state}
/// DiaryState description
/// {@endtemplate}
class DiaryState extends Equatable {
  /// {@macro diary_state}
  const DiaryState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current DiaryState with property changes
  DiaryState copyWith({
    String? customProperty,
  }) {
    return DiaryState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template diary_initial}
/// The initial state of DiaryState
/// {@endtemplate}
class DiaryInitial extends DiaryState {
  /// {@macro diary_initial}
  const DiaryInitial() : super();
}

/// A state wherein the page is loading
class DiaryLoading extends DiaryState {}

/// A state wherein the diary entry has been successfully created
class DiaryEntryCreated extends DiaryState {}

/// A state wherein the creation of the diary entry received an error
class DiaryCreationFailed extends DiaryState {}
