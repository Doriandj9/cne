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
    // TODO: implement initState
    super.initState();
    widget.viewModel.load.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant ShowPostsWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    widget.viewModel.load.removeListener(_onResult);
    widget.viewModel.load.addListener(_onResult);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.viewModel.load.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListenableBuilder(
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

          return child!;
        },
        child: ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (context, state) {
            return ListView.separated(
              scrollDirection: .horizontal,
              itemCount: widget.viewModel.posts.length,
              padding: Dimens.of(context).edgeInsetsScreenHorizontal,
              itemBuilder: (context, index) {
                final post = widget.viewModel.posts[index];

                return ViewCardPostWidget(title: post.title, body: post.body);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 8);
              },
            );
          },
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.load.running) {
      print('Esta cargando...');
      widget.viewModel.load.clearResult();
    }
  }
}
