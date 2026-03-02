import 'package:cne_app_shell/infrastructure/app.dart';
import 'package:cne_app_shell/routing/routes/shell_routes.dart';
import 'package:cne_app_shell/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter get shellRouter {
  return GoRouter(
    initialLocation: ShellRoutes.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: ShellRoutes.home,
        builder: (context, state) => HomeScreen(),
        routes: AppShell.routesAll,
      ),
    ],
  );
}
