import 'dart:convert';
import 'dart:io';
import 'package:app_core/utils/result.dart';
import 'package:cne_domicilios/data/services/api/models/posts_api_model.dart';
import 'package:logging/logging.dart';

typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({String? host, int? port, HttpClient Function()? clientFactory})
    : _host = host ?? 'localhost',
      _port = port ?? 8080,
      _clientFactory = clientFactory ?? HttpClient.new {
    uri = Uri(
      scheme: _port == 443 ? 'https' : 'http',
      host: _host,
      port: _port,
      path: '/posts',
    );
  }

  final String _host;
  final int _port;
  final HttpClient Function() _clientFactory;
  final Logger log = Logger('Api');

  late Uri uri;

  AuthHeaderProvider? _authHeaderProvider;

  set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
    _authHeaderProvider = authHeaderProvider;
  }

  Future<void> _authHeader(HttpHeaders headers) async {
    final header = _authHeaderProvider?.call();
    if (header != null) {
      headers.add(HttpHeaders.authorizationHeader, header);
    }
  }

  Future<Result<List<PostsApiModel>>> getPosts() async {
    final client = _clientFactory();
    try {
      final request = await client.getUrl(uri);
      await _authHeader(request.headers);
      final response = await request.close();
      log.info('Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as List<dynamic>;

        return Result.ok(
          json.map((element) => PostsApiModel.fromJson(element)).toList(),
        );
      } else {
        return Result.error(Exception('Request Invalid'));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
