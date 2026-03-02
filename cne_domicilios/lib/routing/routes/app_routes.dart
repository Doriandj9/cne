import 'package:cne_domicilios/config/env.dart';

class AppRoutes {
  static const prefix = Env.environment == 'production' ? miroApp : '';
  static const home = '/';
  static const domicilios = '$prefix/$relativeDomicilios';
  static const relativeDomicilios = 'domicilios';

  static const miroApp = '/$relativeMicroApp';
  static const relativeMicroApp = 'micro_app_domicilios';
}
