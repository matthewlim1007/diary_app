import 'package:diary_app/feature/diary/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiaryEntity', () {
    const entitySut = DiaryEntity(
      comments: '',
      diaryDate: '',
      areaId: 1,
      taskCategoryId: 1,
      images: [],
      isIncludeInPhotoGallery: false,
      tags: [],
    );

    const entitySut2 = DiaryEntity(
      comments: '',
      diaryDate: '',
      areaId: 1,
      taskCategoryId: 2,
      images: [],
      isIncludeInPhotoGallery: false,
      tags: [],
    );

    test('entities should not be the same', () {
      expect(entitySut != entitySut2, true);
    });

    test('entities should be the same', () {
      expect(entitySut == entitySut, true);
    });
  });
}
