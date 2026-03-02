import 'package:app_core/utils/result.dart';
import 'package:cne_domicilios/domain/models/posts/post_model.dart';

abstract class PostRepository {
  Future<Result<List<PostsModel>>> getPosts();
}
