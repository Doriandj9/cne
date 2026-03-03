import 'package:app_core/utils/command.dart';
import 'package:app_core/utils/result.dart';
import 'package:cne_domicilios/data/repositories/posts/post_repository.dart';
import 'package:cne_domicilios/domain/models/posts/post_model.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class DomicilioHomeViewmodel extends ChangeNotifier {
  DomicilioHomeViewmodel({required PostRepository postRepository})
    : _postRepository = postRepository {
    load = Command0(_load)..execute();
  }

  final PostRepository _postRepository;
  late Command0 load;
  final Logger log = Logger('DomicilioHomeViewmodel');
  List<PostsModel> posts = [];

  Future<Result<void>> _load() async {
    final data = await _postRepository.getPosts();
    if (data is Ok<List<PostsModel>>) {
      posts = data.value;
    }

    if (data is Error<List<PostsModel>>) {
      log.warning('ErrorApi: ${data.error}');
    }

    return data;
  }
}
