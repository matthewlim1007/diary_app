// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:diary_app/feature/diary/presentation/bloc/bloc.dart';
import 'package:diary_app/injection_container.dart' as di;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiaryBloc', () {
    late DiaryBloc diaryBloc;

    setUp(() async {
      await di.init();

      diaryBloc = DiaryBloc(createDiaryUseCase: di.serviceLocator());
    });

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
  });
}
