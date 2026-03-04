import 'package:app_core/ui/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:posts_apps/src/posts/domain/models/PostModel.dart';
import 'package:posts_apps/src/posts/ui/viewmodels/post_view_model.dart';

class ListShowPosts extends StatefulWidget {
  const ListShowPosts({super.key, required this.viewModel});

  final PostViewModel viewModel;

  @override
  State<ListShowPosts> createState() => _ListShowPostsState();
}

class _ListShowPostsState extends State<ListShowPosts> {
  final Logger _log = Logger('ListShowPosts');

  @override
  void initState() {
    super.initState();
    widget.viewModel.load.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant ListShowPosts oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.viewModel.load.removeListener(_onResult);
    widget.viewModel.load.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.load.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel.load,
      builder: (context, child) {
        if (widget.viewModel.load.running) {
          return Center(child: CircularProgressIndicator());
        }

        if (widget.viewModel.load.error) {
          return Center(
            child: ErrorIndicator(
              title: 'Error de red',
              label: 'Error inesperado',
              onPressed: () {
                widget.viewModel.load.execute();
              },
            ),
          );
        }

        return child!;
      },
      child: Expanded(
        child: ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (context, _) {
            return ListView.separated(
              itemBuilder: (context, i) {
                final PostsModel(:title, :body) = widget.viewModel.posts[i];
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: .all(color: Colors.brown),
                        borderRadius: .circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(title),
                          Text(body, style: TextStyle(color: Colors.blueGrey)),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, _) {
                return Container(height: 15);
              },
              itemCount: widget.viewModel.posts.length,
            );
          },
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.load.completed) {
      widget.viewModel.load.clearResult();
      _log.info(
        'Termino de cargar los posts: ${widget.viewModel.posts.length}',
      );
    }

    if (widget.viewModel.load.error) {
      widget.viewModel.load.clearResult();
      _log.severe('Error al cargar los posts');
    }
  }
}
