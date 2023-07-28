import 'dart:convert';
import 'dart:io';

import 'package:diary_app/core/error/failures.dart';
import 'package:diary_app/feature/diary/data/datasources/diary_remote_source.dart';
import 'package:diary_app/feature/diary/data/models/diary_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

class FakeDiaryModel extends Fake implements DiaryModel {}

void main() {
  group('DailyRemoteDatasourceImpl', () {
    late http.Client mockHttpClient;
    late DiaryRemoteDatasource diaryRemoteDatasource;

    const baseUrl = 'https://reqres.in/api';

    setUp(() {
      registerFallbackValue(FakeDiaryModel());
      mockHttpClient = MockHttpClient();
      diaryRemoteDatasource =
          DiaryRemoteDatasourceImpl2(httpClient: mockHttpClient);
    });

    const modelSut = DiaryModel(
      comments: '',
      diaryDate: '',
      areaId: 1,
      taskCategoryId: 1,
      images: [],
      isIncludeInPhotoGallery: false,
      tags: [],
    );

    test(
      'should return null',
      () async {
        when(
          () => mockHttpClient.post(
            Uri.parse('$baseUrl/diary'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(modelSut.toJson()),
          ),
        ).thenAnswer((_) async => http.Response('Success', 201));

        expect(
          () async => diaryRemoteDatasource.createDiaryEntry(modelSut),
          isA<void>(),
        );
      },
    );

    test(
      'should return Failure if http status is not 201',
      () async {
        when(
          () => mockHttpClient.post(
            Uri.parse('$baseUrl/diary'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(modelSut.toJson()),
          ),
        ).thenAnswer((_) async => http.Response('Error', 500));

        expect(
          () async => diaryRemoteDatasource.createDiaryEntry(modelSut),
          throwsA(isA<DiaryPostFailure>()),
        );
      },
    );

    test(
      'should return Failure if SocketException is thrown',
      () async {
        when(
          () => mockHttpClient.post(
            Uri.parse('$baseUrl/diary'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(modelSut.toJson()),
          ),
        ).thenThrow(const SocketException('Error'));

        expect(
          () async => diaryRemoteDatasource.createDiaryEntry(modelSut),
          throwsA(isA<NetworkFailure>()),
        );
      },
    );

    test(
      'should return Failure if exception is thrown',
      () async {
        when(
          () => mockHttpClient.post(
            Uri.parse('$baseUrl/diary'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(modelSut.toJson()),
          ),
        ).thenThrow(Exception('Error'));

        expect(
          () async => diaryRemoteDatasource.createDiaryEntry(modelSut),
          throwsA(isA<UnknownFailure>()),
        );
      },
    );
  });
}
