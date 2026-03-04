import 'package:go_router/go_router.dart';
import 'package:provider/single_child_widget.dart';

abstract class MicroApp {
  List<SingleChildWidget> get providers;
  List<RouteBase> get routes;

  /// Ruta base donde esta microapp se registra dentro del router principal debe ser relativa.
  ///
  /// Ejemplo:
  /// Si la microapp es de posts, podría ser: `micro_app_posts`
  ///
  /// Esta ruta se usa como punto de montaje dentro del GoRouter principal.
  String get entryPath;

  /// Ruta interna inicial de la microapp.
  ///
  /// Siempre es la ruta absoluta de la microapp es igual a :/[entryPath]
  ///
  /// Ejemplo:
  /// entryPath: `micro_app_posts`
  /// path: `/micro_app_posts`
  ///
  /// Se usa para definir el GoRoute raíz dentro de la microapp.
  String get path;
}
