import 'package:posts_apps/config/env/env.dart';

class Routes {
  Routes._();

  static const String _prefix = Env.environment == 'production' ? microApp : '';

  static const String home = '/';
  static const String posts = '$_prefix/$relativePosts';
  static const String relativePosts = 'posts';

  static const microApp = '/$relativeMicroApp';
  static const relativeMicroApp = 'micro_app_posts';
}
