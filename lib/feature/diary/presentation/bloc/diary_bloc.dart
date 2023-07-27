import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diary_app/feature/diary/domain/entities/diary_entity.dart';
import 'package:diary_app/feature/diary/domain/usecases/create_diary_use_case.dart';
import 'package:equatable/equatable.dart';
part 'diary_event.dart';
part 'diary_state.dart';

/// {@template DiaryBloc}
/// The Bloc that handles the logic for the Diary feature
/// {@endTemplate}
class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  /// {@macro DiaryBloc}
  DiaryBloc({required CreateDiaryUseCase createDiaryUseCase})
      : _createDiaryUseCase = createDiaryUseCase,
        super(const DiaryInitial()) {
    on<CustomDiaryEvent>(_onCustomDiaryEvent);
  }

  final CreateDiaryUseCase _createDiaryUseCase;

  FutureOr<void> _onCustomDiaryEvent(
    CustomDiaryEvent event,
    Emitter<DiaryState> emit,
  ) {
    if (event is CreateDiaryEntryEvent) {
      _createDiaryUseCase
          .call(CreateDiaryParam(diaryEntity: event.diaryEntity));
    }
  }
}
