import 'package:app_core/infrastructure/micro_app.dart';
import 'package:cne_app_shell/routing/router/shell_router.dart';
import 'package:cne_domicilios/infrastructure/domicilios_microapp.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/single_child_widget.dart';

List<MicroApp> get _microapps {
  return [DomiciliosMicroapp()];
}

class AppShell {
  AppShell._();

  static GoRouter get router {
    return shellRouter;
  }

  static List<SingleChildWidget> providers =
      _routesAndProviders['providers'] as List<SingleChildWidget>;

  static List<RouteBase> routesAll =
      _routesAndProviders['routes'] as List<RouteBase>;
}

Map<String, Object> get _routesAndProviders {
  final routes = _microapps.map((microapp) => microapp.routes).reduce((
    list,
    listRoute,
  ) {
    for (RouteBase route in listRoute) {
      list.add(route);
    }

    return list;
  }).toList();

  final providers = _microapps.map((miroapp) => miroapp.providers).reduce((
    list,
    listProviders,
  ) {
    for (SingleChildWidget provider in listProviders) {
      list.add(provider);
    }
    return list;
  });

  return {'providers': providers, 'routes': routes};
}
