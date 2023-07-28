// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:io';

import 'package:diary_app/feature/diary/data/models/models.dart';
import 'package:diary_app/feature/diary/presentation/view/diary_page.dart';
import 'package:diary_app/injection_container.dart' as di;
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'helpers/helpers.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late http.Client mockHttpClient;

  const baseUrl = 'https://reqres.in/api';

  const modelSut = DiaryModel(
    comments: '',
    diaryDate: '',
    areaId: 1,
    taskCategoryId: 1,
    images: [],
    isIncludeInPhotoGallery: false,
    tags: [],
  );

  setUp(() async {
    HttpOverrides.global = null;
    await di.init();
    mockHttpClient = MockHttpClient();
    when(
      () => mockHttpClient.post(
        Uri.parse('$baseUrl/diary'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(modelSut.toJson()),
      ),
    ).thenAnswer((_) async => http.Response('Success', 201));
  });

  testWidgets('Diary page is shown', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpApp(const DiaryPage());

    await tester.enterText(
      find.byKey(const Key('commentTextFieldKey')),
      'adding comments',
    );
    expect(find.text('adding comments'), findsOneWidget);

    final dateTextField = find.byKey(const Key('diaryTextFieldKey'));

    // final gesture = await tester
    //     .startGesture(const Offset(0, 300)); //Position of the scrollview
    // await gesture.moveBy(const Offset(0, -300)); //How much to scroll by
    // await tester.pump();

    await tester.tap(dateTextField);

    await tester.pump();

    expect(find.byKey(const Key('datePickerKey')), findsOneWidget);

    // await tester.tap(find.byType(CupertinoButton));

    // await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('tagTextFieldKey')),
      'Tag1, Tag2',
    );
    expect(find.text('Tag1, Tag2'), findsOneWidget);
  });
}
