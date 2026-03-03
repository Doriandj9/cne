import 'package:app_core/utils/result.dart';
import 'package:cne_domicilios/data/services/api/api_client.dart';
import 'package:cne_domicilios/data/services/api/models/posts_api_model.dart';
import '../models/fake_post_api_model.dart';

class FakeApiClient implements ApiClient {
  @override
  AuthHeaderProvider? authHeaderProvider;

  int requestCount = 0;

  @override
  Future<Result<List<PostsApiModel>>> getPosts() async {
    ++requestCount;
    final posts = [fPostApiModel];
    return Result.ok(posts);
  }
}
