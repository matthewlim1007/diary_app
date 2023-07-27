import 'package:diary_app/feature/diary/presentation/bloc/diary_bloc.dart';
import 'package:diary_app/feature/diary/presentation/widgets/diary_body.dart';
import 'package:diary_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template diary_page}
/// A description for DiaryPage
/// {@endtemplate}
class DiaryPage extends StatelessWidget {
  /// {@macro diary_page}
  const DiaryPage({super.key});

  /// The static route for DiaryPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const DiaryPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<DiaryBloc>(),
      child: const Scaffold(
        body: DiaryView(),
      ),
    );
  }
}

/// {@template diary_view}
/// Displays the Body of DiaryView
/// {@endtemplate}
class DiaryView extends StatelessWidget {
  /// {@macro diary_view}
  const DiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DiaryBody();
  }
}
