import 'dart:convert';
import 'dart:io';
import 'package:app_core/services/api_client_core.dart';
import 'package:app_core/utils/result.dart';
import 'package:posts_apps/src/posts/domain/models/PostModel.dart';

typedef AuthorizationProvider = String? Function();

class ApiClientPosts extends ApiClientCore {
  ApiClientPosts({
    super.uri,
    super.clientFactory,
    AuthorizationProvider? authorizationProvider,
  }) : _authorizationProvider = authorizationProvider;

  AuthorizationProvider? _authorizationProvider;

  set setAuthorizationProvider(AuthorizationProvider autorizationProvider) {
    _authorizationProvider = autorizationProvider;
  }

  void _setAuthHeader(Map<String, String> headers) {
    final authToken = _authorizationProvider?.call();
    if (authToken != null) {
      headers[HttpHeaders.authorizationHeader] = authToken;
    }
  }

  Future<Result<List<PostsModel>>> getPosts() async {
    final client = clientFactory();
    final url = uri.replace(path: '/posts');
    final headers = {HttpHeaders.contentTypeHeader: 'aplication/json'};
    try {
      _setAuthHeader(headers);
      final response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        final json =
            jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
        return Result.ok(
          json.map((post) => PostsModel.fromJson(post)).toList(),
        );
      } else {
        return Result.error(
          Exception('Error en Api code: ${response.statusCode}'),
        );
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }
}
