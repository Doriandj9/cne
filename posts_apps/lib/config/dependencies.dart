import 'package:posts_apps/config/env/env.dart';
import 'package:posts_apps/src/posts/data/repositories/post_repository.dart';
import 'package:posts_apps/src/posts/data/repositories/post_repository_imp.dart';
import 'package:posts_apps/src/posts/data/services/api_client_posts.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  Provider(create: (context) => ApiClientPosts(uri: Uri.parse(Env.apiUrl))),
  Provider(
    create: (context) =>
        PostRepositoryImp(apiClientPosts: context.read()) as PostRepository,
  ),
];
