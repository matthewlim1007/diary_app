// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:diary_app/feature/diary/data/datasources/diary_remote_source.dart';
import 'package:diary_app/feature/diary/data/repositories/diary_repository_impl.dart';
import 'package:diary_app/feature/diary/domain/entities/entities.dart';
import 'package:diary_app/feature/diary/domain/repositories/diary_repository.dart';
import 'package:diary_app/feature/diary/domain/usecases/create_diary_use_case.dart';
import 'package:diary_app/feature/diary/presentation/bloc/bloc.dart';
import 'package:diary_app/injection_container.dart' as di;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateDiaryUseCase extends Mock implements CreateDiaryUseCase {}

void main() {
  group('DiaryBloc', () {
    late CreateDiaryUseCase mockCreateDiaryUseCase;
    late DiaryBloc diaryBloc;

    setUp(() async {
      mockCreateDiaryUseCase = MockCreateDiaryUseCase();

      diaryBloc = DiaryBloc(createDiaryUseCase: mockCreateDiaryUseCase);
    });

    const entitysut = DiaryEntity(
      comments: '',
      diaryDate: '',
      areaId: 1,
      taskCategoryId: 1,
      images: [],
      isIncludeInPhotoGallery: false,
      tags: [],
    );

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          diaryBloc,
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      expect(diaryBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<DiaryBloc, DiaryState>(
      'CustomDiaryEvent emits nothing',
      build: () => diaryBloc,
      act: (bloc) => bloc.add(const CustomDiaryEvent()),
      expect: () => <DiaryState>[],
    );

    blocTest<DiaryBloc, DiaryState>(
      'CreateDiaryEntryEvent emits loading state',
      build: () => diaryBloc,
      act: (bloc) => bloc.add(CreateDiaryEntryEvent(diaryEntity: entitysut)),
      expect: () => <DiaryState>[DiaryLoading()],
    );
  });
}
