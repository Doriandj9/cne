import 'package:app_core/utils/result.dart';
import 'package:cne_domicilios/data/repositories/posts/post_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../testing/fakes/services/fake_api_client.dart';
import '../../../testing/utils/result.dart';

void main() {
  late PostRepositoryImpl postRepository;
  late FakeApiClient fakeApiClient;

  setUp(() {
    fakeApiClient = FakeApiClient();
    postRepository = PostRepositoryImpl(apiClient: fakeApiClient);
  });

  group('Test del repository: ', () {
    test('Obtener los continentes', () async {
      final result = await postRepository.getPosts();
      expect(result, isA<Ok>());

      final list = result.asOk.value;
      expect(list.length, 1);

      final first = list.first;
      expect(first.title, 'Post');

      expect(fakeApiClient.requestCount, 1);
    });
  });
}
