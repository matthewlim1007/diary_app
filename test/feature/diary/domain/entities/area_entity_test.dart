import 'package:diary_app/feature/diary/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AreaEntity', () {
    const areaSut = AreaEntity(id: 1, name: 'Area 1');

    const areaSut2 = AreaEntity(id: 2, name: 'Area 2');

    test('entities should not be the same', () {
      expect(areaSut != areaSut2, true);
    });

    test('entities should be the same', () {
      expect(areaSut == areaSut, true);
    });
  });
}
