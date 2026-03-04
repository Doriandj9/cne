import 'package:app_core/utils/command.dart';
import 'package:app_core/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:posts_apps/src/posts/data/repositories/post_repository.dart';
import 'package:posts_apps/src/posts/domain/models/PostModel.dart';

class PostViewModel extends ChangeNotifier {
  PostViewModel({required PostRepository postRepository})
    : _postRepository = postRepository {
    load = Command0(_load)..execute();
  }

  final PostRepository _postRepository;
  late Command0 load;
  final Logger log = Logger('PostViewModel');
  List<PostsModel> posts = [];

  Future<Result<void>> _load() async {
    final listPosts = await _postRepository.getPosts();

    switch (listPosts) {
      case Ok<List<PostsModel>>():
        posts = listPosts.value;
        notifyListeners();
      case Error<List<PostsModel>>():
        log.warning('Error: ${listPosts.error}');
    }

    return listPosts;
  }
}
