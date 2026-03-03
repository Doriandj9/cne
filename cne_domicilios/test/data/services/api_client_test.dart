import 'package:cne_domicilios/data/services/api/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../testing/fakes/mocks.dart';
import '../../../testing/fakes/models/fake_post_api_model.dart';
import '../../../testing/utils/result.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late ApiClient apiClient;

  setUp(() {
    registerFallbackValue(Uri());
    mockHttpClient = MockHttpClient();
    apiClient = ApiClient(clientFactory: () => mockHttpClient);
  });

  group('Pruebas de ApiClient: ', () {
    test('Debe regresar los post por el metodo get', () async {
      final fakePostsApi = [fPostApiModel];
      mockHttpClient.mockGet('/posts', fakePostsApi);
      final result = await apiClient.getPosts();
      expect(result.asOk.value, fakePostsApi);
    });
  });
}
