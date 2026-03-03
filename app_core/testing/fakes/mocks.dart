import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockGoRouter extends Mock implements GoRouter {}

class MockHttpClient extends Mock implements http.Client {}

class MockHttpClientResponse extends Mock implements http.Response {}

extension HttpMethodMocks on MockHttpClient {
  void mockGet(String path, Object object) {
    when(
      () => get(
        any(that: isA<Uri>().having((u) => u.path, 'path', path)),
        headers: any(named: 'headers'),
      ),
    ).thenAnswer((invocation) async {
      final response = MockHttpClientResponse();
      when(() => response.statusCode).thenReturn(200);
      when(
        () => response.bodyBytes,
      ).thenReturn(Uint8List.fromList(utf8.encode(jsonEncode(object))));

      return response;
    });
  }
}
