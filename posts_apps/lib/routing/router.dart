import 'package:go_router/go_router.dart';
import 'package:posts_apps/routing/routes.dart';
import 'package:posts_apps/src/home/ui/home_screen.dart';
import 'package:posts_apps/src/posts/ui/viewmodels/post_view_model.dart';
import 'package:posts_apps/src/posts/ui/widgets/posts_screen.dart';
import 'package:provider/provider.dart';

GoRouter get router {
  return GoRouter(initialLocation: Routes.home, routes: _localRoutes);
}

List<RouteBase> microAppRoutes = [
  GoRoute(
    path: Routes.relativeMicroApp,
    builder: (context, state) => HomeScreen(),
    routes: _localRoutes,
  ),
];

List<RouteBase> _localRoutes = [
  GoRoute(
    path: Routes.relativePosts,
    builder: (context, state) =>
        PostsScreen(viewModel: PostViewModel(postRepository: context.read())),
  ),
];
