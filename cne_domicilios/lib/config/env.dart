import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_URL')
  static const String apiUrl = _Env.apiUrl;

  @EnviedField(varName: 'API_KEY')
  static const String apiKey = _Env.apiKey;

  @EnviedField(varName: 'SECRET_TOKEN')
  static const String secretToken = _Env.secretToken;

  @EnviedField(varName: 'ENVIRONMENT')
  static const String environment = _Env.environment;
}
