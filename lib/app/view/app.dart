import 'package:diary_app/core/themes/diary_theme.dart';
import 'package:diary_app/feature/diary/presentation/view/diary_page.dart';
import 'package:diary_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template App}
/// The main widget app to load the app
/// {@endTemplate}
class App extends StatelessWidget {
  /// {@macro App}
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DiaryTheme.light(),
      darkTheme: DiaryTheme.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const DiaryPage(),
    );
  }
}
