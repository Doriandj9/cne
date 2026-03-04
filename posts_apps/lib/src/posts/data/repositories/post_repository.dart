import 'package:app_core/utils/result.dart';
import 'package:posts_apps/src/posts/domain/models/PostModel.dart';

abstract class PostRepository {
  Future<Result<List<PostsModel>>> getPosts();
}
