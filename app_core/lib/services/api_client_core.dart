import 'package:http/http.dart' as http;

abstract class ApiClientCore {
  ApiClientCore({Uri? uri, http.Client Function()? clientFactory})
    : uri = uri ?? Uri.parse('http://localhost:8080'),
      clientFactory = clientFactory ?? (() => http.Client());

  final Uri uri;
  final http.Client Function() clientFactory;
}
