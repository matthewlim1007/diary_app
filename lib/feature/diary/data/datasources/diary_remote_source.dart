import 'dart:convert';
import 'dart:io';

import 'package:diary_app/core/error/failures.dart';
import 'package:diary_app/core/utils/http_client.dart';
import 'package:diary_app/feature/diary/data/models/models.dart';

import 'package:http/http.dart' as http;

/// An abstract class for the diary remote datasource
// ignore: one_member_abstracts
abstract class DiaryRemoteDatasource {
  /// Creates the user profile of the user for goodbank.
  ///
  /// A [Failure] may be thrown.
  /// - [UnknownFailure]
  Future<void> createDiaryEntry(
    DiaryModel diaryModel,
  );
}

/// The remote data source implementation for the diary feature
class DiaryRemoteDatasourceImpl extends DiaryRemoteDatasource {
  final _httpClient = MHttpClient(http.Client());

  @override
  Future<void> createDiaryEntry(DiaryModel diaryModel) async {
    try {
      final body = jsonEncode(diaryModel.toJson());

      final response = await _httpClient.post(
        body: body,
        path: '/diary',
      );

      if (response.statusCode == 201) {
        return;
      } else {
        throw DiaryPostFailure(
          message: response.reasonPhrase ?? 'Creation has failed,',
        );
      }
    } on SocketException {
      throw NetworkFailure();
    } on Exception {
      throw UnknownFailure();
    }
  }
}
