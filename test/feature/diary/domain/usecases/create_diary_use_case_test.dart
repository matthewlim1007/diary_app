import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/feature/diary/data/datasources/diary_remote_source.dart';
import 'package:diary_app/feature/diary/data/models/diary_model.dart';
import 'package:diary_app/feature/diary/data/repositories/diary_repository_impl.dart';
import 'package:diary_app/feature/diary/domain/entities/diary_entity.dart';
import 'package:diary_app/feature/diary/domain/repositories/diary_repository.dart';
import 'package:diary_app/feature/diary/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockDiaryRepository extends Mock implements DiaryRepository {}

class FakeDiaryEntity extends Fake implements DiaryEntity {}

void main() {
  late DiaryRepository mockDiaryRepository;
  late CreateDiaryUseCase createDiaryUseCase;

  const entitySut = DiaryEntity(
    comments: '',
    diaryDate: '',
    areaId: 1,
    taskCategoryId: 1,
    images: [],
    isIncludeInPhotoGallery: false,
    tags: [],
  );

  setUp(() {
    registerFallbackValue(FakeDiaryEntity());
    mockDiaryRepository = MockDiaryRepository();

    createDiaryUseCase = CreateDiaryUseCase(mockDiaryRepository);
  });

  test(
    'should return Failure if exception is thrown',
    () async {
      when(() => mockDiaryRepository.createDiaryEntry(entitySut))
          .thenAnswer((_) async => const Right(null));

      final result = await createDiaryUseCase.call(
        const CreateDiaryParam(
          diaryEntity: entitySut,
        ),
      );

      expect(
        result,
        const Right<dynamic, void>(null),
      );
    },
  );
}
