import 'package:app_core/infrastructure/micro_app.dart';
import 'package:go_router/go_router.dart';
import 'package:posts_apps/config/dependencies.dart';
import 'package:posts_apps/routing/router.dart';
import 'package:posts_apps/routing/routes.dart';
import 'package:provider/single_child_widget.dart';

final class PostsMicroapp implements MicroApp {
  @override
  String get entryPath => Routes.relativeMicroApp;

  @override
  String get path => Routes.microApp;

  @override
  List<SingleChildWidget> get providers => appProviders;

  @override
  List<RouteBase> get routes => microAppRoutes;
}
