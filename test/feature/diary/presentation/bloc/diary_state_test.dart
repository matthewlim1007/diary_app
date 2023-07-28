// ignore_for_file: prefer_const_constructors

import 'package:diary_app/feature/diary/presentation/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiaryState', () {
    test('supports value equality', () {
      expect(
        DiaryState(),
        equals(
          const DiaryState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const DiaryState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const diaryState = DiaryState(
            customProperty: 'My property',
          );
          expect(
            diaryState.copyWith(),
            equals(diaryState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const diaryState = DiaryState(
            customProperty: 'My property',
          );
          final otherDiaryState = DiaryState(
            customProperty: 'My property 2',
          );
          expect(diaryState, isNot(equals(otherDiaryState)));

          expect(
            diaryState.copyWith(
              customProperty: otherDiaryState.customProperty,
            ),
            equals(otherDiaryState),
          );
        },
      );
    });
  });
}
