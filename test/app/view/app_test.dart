import 'package:diary_app/app/app.dart';
import 'package:diary_app/feature/diary/presentation/view/diary_page.dart';
import 'package:diary_app/injection_container.dart' as di;
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('App', () {
    setUp(() async {
      await di.init();
    });

    testWidgets('renders Diary Page', (tester) async {
      await tester.pumpApp(const App());
      expect(find.byType(DiaryPage), findsOneWidget);
    });
  });
}
