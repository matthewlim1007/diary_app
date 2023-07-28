// ignore_for_file: prefer_const_constructors

import 'package:diary_app/feature/diary/presentation/diary.dart';
import 'package:diary_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiaryPage', () {
    group('route', () {
      test('is routable', () {
        expect(DiaryPage.route(), isA<MaterialPageRoute<void>>());
      });
    });

    testWidgets('renders DiaryView', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: DiaryPage(),
        ),
      );
      expect(find.byType(DiaryBody), findsOneWidget);
    });
  });
}
