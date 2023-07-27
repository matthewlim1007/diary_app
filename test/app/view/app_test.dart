import 'package:diary_app/app/app.dart';
import 'package:diary_app/feature/diary/presentation/view/diary_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(DiaryPage), findsOneWidget);
    });
  });
}
