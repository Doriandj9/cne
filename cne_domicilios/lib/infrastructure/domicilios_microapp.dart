import 'package:app_core/infrastructure/micro_app.dart';
import 'package:cne_domicilios/config/dependencies.dart';
import 'package:cne_domicilios/routing/router/app_router.dart';
import 'package:cne_domicilios/routing/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/single_child_widget.dart';

final class DomiciliosMicroapp implements MicroApp {
  @override
  List<SingleChildWidget> providers = appProviders;
  @override
  // TODO: implement appRoutes
  List<RouteBase> get routes => appRoutesMicroApp;

  @override
  final entryPath = AppRoutes.relativeMicroApp;

  @override
  final path = AppRoutes.miroApp;
}
