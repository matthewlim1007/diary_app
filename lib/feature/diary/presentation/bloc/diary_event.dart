part of 'diary_bloc.dart';

/// {@template DiaryEvent}
/// An abtract class for events used on the Diary Feature
/// {@endTemplate}
abstract class DiaryEvent extends Equatable {
  /// {@macro}
  const DiaryEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_diary_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomDiaryEvent extends DiaryEvent {
  /// {@macro custom_diary_event}
  const CustomDiaryEvent();
}

/// {@template CreateDiaryEntry}
/// Event added when some custom logic happens
/// {@endtemplate}
class CreateDiaryEntryEvent extends CustomDiaryEvent {
  /// {@macro CreateDiaryEntry}
  const CreateDiaryEntryEvent({required this.diaryEntity});

  /// The diary entry to be created
  final DiaryEntity diaryEntity;
}
