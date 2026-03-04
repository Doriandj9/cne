import 'package:flutter/material.dart';
import 'package:posts_apps/src/posts/ui/viewmodels/post_view_model.dart';
import 'package:app_core/widgets/app_section_title.dart';
import 'package:posts_apps/src/posts/ui/widgets/list_show_posts.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key, required this.viewModel});

  final PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Theme.of(context).colorScheme.primary,
          child: Text('Posts'),
        ),
      ),
      body: Container(
        padding: .all(5),
        child: Column(
          children: [
            Row(children: [AppSectionTitle(title: 'Listado de Posts')]),
            Container(height: 15),
            ListShowPosts(viewModel: viewModel),
          ],
        ),
      ),
    );
  }
}
