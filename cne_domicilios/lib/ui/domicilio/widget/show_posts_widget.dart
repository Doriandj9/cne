import 'package:app_core/themes/dimens.dart';
import 'package:app_core/ui/error_indicator.dart';
import 'package:cne_domicilios/ui/domicilio/viewmodels/domicilio_home_viewmodel.dart';
import 'package:cne_domicilios/ui/domicilio/widget/view_card_post_widget.dart';
import 'package:flutter/material.dart';

class ShowPostsWidget extends StatefulWidget {
  const ShowPostsWidget({super.key, required this.viewModel});

  final DomicilioHomeViewmodel viewModel;

  @override
  State<ShowPostsWidget> createState() => _ShowPostsWidget();
}

class _ShowPostsWidget extends State<ShowPostsWidget> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.load.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant ShowPostsWidget oldWidget) {
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
        if (widget.viewModel.load.error) {
          return Center(
            child: ErrorIndicator(
              title: 'Error fetch',
              label: 'Error al cargar los datos',
              onPressed: () {},
            ),
          );
        }

        if (widget.viewModel.load.running) {
          return Center(child: CircularProgressIndicator());
        }

        return child!;
      },
      child: Expanded(
        child: ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (context, state) {
            return ListView.separated(
              scrollDirection: .vertical,
              itemCount: widget.viewModel.posts.length,
              padding: Dimens.of(context).edgeInsetsScreenHorizontal,
              itemBuilder: (context, index) {
                final post = widget.viewModel.posts[index];

                return ViewCardPostWidget(title: post.title, body: post.body);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 12);
              },
            );
          },
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.load.completed) {
      widget.viewModel.load.clearResult();
    }
    if (widget.viewModel.load.error) {
      widget.viewModel.load.clearResult();
    }
  }
}
