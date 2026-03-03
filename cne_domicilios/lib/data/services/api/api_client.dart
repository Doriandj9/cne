import 'dart:convert';
import 'dart:io';
import 'package:app_core/utils/result.dart';
import 'package:cne_domicilios/data/services/api/models/posts_api_model.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;

typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({Uri? uri, http.Client Function()? clientFactory})
    : _uri = uri ?? Uri.http('localhost'),
      _clientFactory = clientFactory ?? (() => http.Client());

  final Uri _uri;
  final http.Client Function() _clientFactory;
  final Logger _log = Logger('Api');

  AuthHeaderProvider? _authHeaderProvider;

  set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
    _authHeaderProvider = authHeaderProvider;
  }

  Future<void> _authHeader(Map<String, String> headers) async {
    final header = _authHeaderProvider?.call();
    if (header != null) {
      headers[HttpHeaders.authorizationHeader] = header;
    }
  }

  Future<Result<List<PostsApiModel>>> getPosts() async {
    final client = _clientFactory();
    final url = _uri.replace(path: '/posts');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    try {
      _log.info('La uri: $url');
      await _authHeader(headers);
      final response = await client.get(url, headers: headers);
      _log.info('Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final stringData = utf8.decode(response.bodyBytes);
        final json = jsonDecode(stringData) as List<dynamic>;

        return Result.ok(
          json.map((element) => PostsApiModel.fromJson(element)).toList(),
        );
      } else {
        return Result.error(Exception('Request Invalid'));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }
}
