import 'package:app_core/utils/result.dart';
import 'package:cne_domicilios/data/repositories/posts/post_repository.dart';
import 'package:cne_domicilios/domain/models/posts/post_model.dart';
import 'package:flutter/foundation.dart';

class FakePostRepositoryImpl implements PostRepository {
  @override
  Future<Result<List<PostsModel>>> getPosts() {
    return SynchronousFuture(
      Result.ok([
        PostsModel(1, 1, 'uno', 'descripcion uno', 1),
        PostsModel(2, 2, 'dos', 'descripcion dos', 2),
        PostsModel(3, 3, 'tres', 'descripcion tres', 3),
      ]),
    );
  }
}
