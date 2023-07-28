// ignore_for_file: prefer_const_constructors

import 'package:diary_app/feature/diary/presentation/diary.dart';
import 'package:flutter/material.dart';
import 'package:diary_app/injection_container.dart' as di;
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('DiaryPage', () {
    setUp(() async {
      await di.init();
    });

    group('route', () {
      test('is routable', () {
        expect(DiaryPage.route(), isA<MaterialPageRoute<void>>());
      });
    });

    // testWidgets('renders DiaryView', (tester) async {
    //   await tester.pumpApp(
    //     DiaryPage(),
    //   );
    //   expect(find.byType(DiaryView), findsOneWidget);
    // });
  });
}
