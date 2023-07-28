import 'package:diary_app/core/error/failures.dart';
import 'package:diary_app/feature/diary/data/datasources/diary_remote_source.dart';
import 'package:diary_app/feature/diary/data/models/models.dart';
import 'package:diary_app/feature/diary/data/repositories/diary_repository_impl.dart';
import 'package:diary_app/feature/diary/domain/repositories/diary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockDiaryRemoteDataSourceTest extends Mock
    implements DiaryRemoteDatasource {}

void main() {
  //sut to System under testing

  late MockDiaryRemoteDataSourceTest dataSource;
  late DiaryModel diaryModel;
  setUp(() {
    dataSource = MockDiaryRemoteDataSourceTest();

    diaryModel = const DiaryModel(
      comments: 'comments',
      diaryDate: '2023-07-28',
      areaId: 1,
      taskCategoryId: 1,
      images: ['image1'],
      isIncludeInPhotoGallery: true,
      tags: ['tag1', 'tag2'],
    );
  });
  group('createDiaryEntry', () {
    test('should fail creation', () {
      when(() => dataSource.createDiaryEntry(diaryModel)).thenThrow(
        UnknownFailure(),
      );

      expect(() => dataSource.createDiaryEntry(diaryModel), UnknownFailure());
    });

    test('creation should be successful', () {
      when(() => dataSource.createDiaryEntry(diaryModel)).thenAnswer(
        () => Future<void>(),
      );

      expect(() => dataSource.createDiaryEntry(diaryModel), UnknownFailure());
    });
  });
}
