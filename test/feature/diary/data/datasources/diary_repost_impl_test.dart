import 'package:diary_app/feature/diary/data/datasources/diary_remote_source.dart';
import 'package:diary_app/feature/diary/data/models/diary_model.dart';
import 'package:diary_app/feature/diary/data/repositories/diary_repository_impl.dart';
import 'package:diary_app/feature/diary/domain/entities/diary_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockDiaryRemoteDataSource extends Mock implements DiaryRemoteDatasource {}

class FakeDiaryModel extends Fake implements DiaryModel {}

void main() {
  late DiaryRemoteDatasource mockDiaryRemoteDataSource;
  late DiaryRepositoryImpl diaryRepository;

  setUp(() {
    registerFallbackValue(FakeDiaryModel());
    mockDiaryRemoteDataSource = MockDiaryRemoteDataSource();

    diaryRepository = DiaryRepositoryImpl(
      diaryRemoteDatasource: mockDiaryRemoteDataSource,
    );
  });

  const modelSut = DiaryEntity(
    comments: '',
    diaryDate: '',
    areaId: 1,
    taskCategoryId: 1,
    images: [],
    isIncludeInPhotoGallery: false,
    tags: [],
  );

  test(
    'should return Failure if exception is thrown',
    () async {
      when(() => mockDiaryRemoteDataSource.createDiaryEntry(any()))
          .thenAnswer((_) async => null);
      final result = await diaryRepository.createDiaryEntry(modelSut);
      expect(
        result,
        const Right(null),
      );

      verify(() => mockDiaryRemoteDataSource.createDiaryEntry(any())).called(1);
    },
  );
}
