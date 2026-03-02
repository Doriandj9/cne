import 'package:go_router/go_router.dart';
import 'package:provider/single_child_widget.dart';

abstract class MicroApp {
  List<SingleChildWidget> get providers;
  List<RouteBase> get routes;

  /// punto de entrada de la microapp
  final String entryPath = '';

  /// path para direccion la ruta go_route
  final String path = '';
}
