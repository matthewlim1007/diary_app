// ignore_for_file: prefer_const_constructors

import 'package:diary_app/feature/diary/presentation/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiaryEvent', () {
    group('CustomDiaryEvent', () {
      test('supports value equality', () {
        expect(
          CustomDiaryEvent(),
          equals(const CustomDiaryEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(const CustomDiaryEvent(), isNotNull);
      });
    });
  });
}
