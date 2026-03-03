import 'package:app_core/utils/result.dart';
import 'package:cne_domicilios/data/repositories/posts/post_repository.dart';
import 'package:cne_domicilios/data/services/api/api_client.dart';
import 'package:cne_domicilios/data/services/api/models/posts_api_model.dart';
import 'package:cne_domicilios/domain/models/posts/post_model.dart';

class PostRepositoryImpl extends PostRepository {
  PostRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;
  List<PostsModel>? _postCahe;

  @override
  Future<Result<List<PostsModel>>> getPosts() async {
    await Future.delayed(Duration(seconds: 3));
    if (_postCahe == null) {
      final result = await _apiClient.getPosts();

      switch (result) {
        case Error<List<PostsApiModel>>():
          return Result.error(result.error);
        case Ok<List<PostsApiModel>>():
      }
      final dataList = result.value
          .map(
            (item) =>
                PostsModel(item.id, item.userId, item.title, item.body, 1.2),
          )
          .toList();
      _postCahe = dataList;
      return Result.ok(dataList);
    } else {
      return Result.ok(_postCahe!);
    }
  }
}
