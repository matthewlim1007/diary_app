// ignore_for_file: prefer_const_constructors

import 'package:diary_app/feature/diary/presentation/diary.dart';
import 'package:diary_app/injection_container.dart' as di;
import 'package:diary_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiaryBody', () {
    late DiaryBloc diaryBloc;

    setUp(() async {
      await di.init();

      diaryBloc = DiaryBloc(createDiaryUseCase: di.serviceLocator());
    });

    testWidgets('renders Scaffold', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => diaryBloc,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: DiaryBody(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
