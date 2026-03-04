import 'package:app_core/utils/result.dart';
import 'package:posts_apps/src/posts/data/repositories/post_repository.dart';
import 'package:posts_apps/src/posts/data/services/api_client_posts.dart';
import 'package:posts_apps/src/posts/domain/models/PostModel.dart';

class PostRepositoryImp implements PostRepository {
  PostRepositoryImp({required ApiClientPosts apiClientPosts})
    : _apiClientPosts = apiClientPosts;

  final ApiClientPosts _apiClientPosts;

  List<PostsModel>? _cache;

  @override
  Future<Result<List<PostsModel>>> getPosts() async {
    if (_cache == null) {
      final list = await _apiClientPosts.getPosts();

      if (list is Ok<List<PostsModel>>) {
        _cache = list.value;
      }

      return list;
    }

    return Result.ok(_cache!);
  }
}
