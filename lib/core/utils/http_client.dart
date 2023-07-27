import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;

/// Referenced from
/// https://stackoverflow.com/questions/62041685/flutter-print-any-http-request-automatically-abstract-http-class
/// {@template MHttpClient}
/// A http client that logs the response of the api
/// {@endTemplate}
class MHttpClient {
  /// {@macro MHttpClient}
  MHttpClient(this.client);

  /// The http client instance
  final http.Client client;

  /// Calls the get method for the http request
  Future<http.Response> get({
    String path = '',
    Map<String, String>? extraHeders,
  }) async {
    _printWrapped('get Path: $path');
    final response = await client.get(
      Uri.parse(_getBaseURL() + path),
      headers: _getHeaders(extraHeaders: extraHeders),
    );
    _printWrapped('get response : \n '
        '${utf8.decode(response.bodyBytes)}');
    return response;
  }

  /// Calls the post method for the http request
  Future<http.Response> post({
    String body = '',
    String path = '',
    Map<String, String>? extraHeders,
  }) async {
    _printWrapped('sended body: \n');
    _printWrapped(' ${json.decode(body)}');
    final response = await client.post(
      Uri.parse(_getBaseURL() + path),
      body: body,
      headers: _getHeaders(extraHeaders: extraHeders),
    );
    _printWrapped('post response : \n '
        '${utf8.decode(response.bodyBytes)}');
    return response;
  }

  /// Calls the put method for the http request
  Future<http.Response> put({String body = '', String path = ''}) async {
    _printWrapped('put body: \n ${json.decode(body)}');
    final response = await client.put(
      Uri.parse(_getBaseURL() + path),
      body: body,
      headers: _getHeaders(),
    );
    _printWrapped(utf8.decode(response.bodyBytes));
    return response;
  }

  String _getBaseURL() {
    return 'https://reqres.in/api';
  }

  Map<String, String> _getHeaders({Map<String, String>? extraHeaders}) {
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if (extraHeaders == null || extraHeaders.isEmpty) {
      return headers;
    } else {
      headers.addAll(extraHeaders);
      return headers;
    }
  }

  void _printWrapped(String text) {
    final pattern = RegExp('.{400}'); // 800 is the size of each chunk
    pattern
        .allMatches(text)
        .forEach((match) => developer.log(match.group(0) ?? ''));
  }
}
