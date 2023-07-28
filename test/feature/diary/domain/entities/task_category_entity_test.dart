import 'package:diary_app/feature/diary/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskCategoryEntity', () {
    const taskCategorySut = TaskCategoryEntity(id: 1, name: 'Task Category 1');

    const taskCategorySut2 = TaskCategoryEntity(id: 2, name: 'Task Category 2');

    test('entities should not be the same', () {
      expect(taskCategorySut != taskCategorySut2, true);
    });

    test('entities should be the same', () {
      expect(taskCategorySut == taskCategorySut, true);
    });
  });
}
