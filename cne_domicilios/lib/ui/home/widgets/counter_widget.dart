import 'package:cne_domicilios/ui/home/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<StatefulWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.increment.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.viewModel.increment.removeListener(_onResult);
    widget.viewModel.increment.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.increment.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel.increment,
      builder: (context, _) => Text('${widget.viewModel.count}'),
    );
  }

  void _onResult() {
    //widget.viewModel.increment.clearResult();
  }
}
