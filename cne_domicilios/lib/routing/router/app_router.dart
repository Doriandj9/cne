import 'package:cne_domicilios/routing/routes/app_routes.dart';
import 'package:cne_domicilios/ui/domicilio/widget/domicilio_screen.dart';
import 'package:cne_domicilios/ui/home/viewmodels/home_view_model.dart';
import 'package:cne_domicilios/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter get router {
  return GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    routes: appRoutes,
  );
}

List<RouteBase> appRoutesMicroApp = [
  GoRoute(
    path: AppRoutes.miroApp,
    builder: (context, state) =>
        HomeScreen(viewModel: HomeViewModel(couterRepository: context.read())),
    routes: _routesRelatives,
  ),
];

List<RouteBase> appRoutes = [
  GoRoute(
    path: AppRoutes.home,
    builder: (context, state) =>
        HomeScreen(viewModel: HomeViewModel(couterRepository: context.read())),
    routes: _routesRelatives,
  ),
];

List<RouteBase> _routesRelatives = [
  GoRoute(
    path: AppRoutes.relativeDomicilios,
    builder: (context, state) => DomicilioScreen(),
  ),
];
