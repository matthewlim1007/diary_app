// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:diary_app/app/app.dart';
import 'package:diary_app/feature/diary/presentation/view/diary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diary_app/injection_container.dart' as di;
import 'helpers/helpers.dart';

void main() {
  setUp(() async {
    await di.init();
  });

  testWidgets('Diary page is shown', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpApp(const DiaryPage());

    await tester.enterText(
      find.byKey(const Key('commentTextFieldKey')),
      'adding comments',
    );
    expect(find.text('adding comments'), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('tagTextFieldKey')),
      'Tag1, Tag2',
    );
    expect(find.text('Tag1, Tag2'), findsOneWidget);
  });
}
