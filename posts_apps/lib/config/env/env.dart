import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
class Env {
  Env._();
  @EnviedField(varName: 'API_URL')
  static const String apiUrl = _Env.apiUrl;

  @EnviedField(varName: 'ENVIRONMENT')
  static const String environment = _Env.environment;
}
