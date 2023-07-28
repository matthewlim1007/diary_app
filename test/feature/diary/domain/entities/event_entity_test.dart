import 'package:diary_app/feature/diary/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EventEntity', () {
    const eventSut = EventEntity(id: 1, name: 'Area 1');

    const eventSut2 = EventEntity(id: 2, name: 'Area 2');

    test('entities should not be the same', () {
      expect(eventSut != eventSut2, true);
    });

    test('entities should be the same', () {
      expect(eventSut == eventSut, true);
    });
  });
}
