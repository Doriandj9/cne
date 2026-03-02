import 'package:cne_domicilios/routing/routes/app_routes.dart';
import 'package:cne_domicilios/ui/home/viewmodels/home_view_model.dart';
import 'package:cne_domicilios/ui/home/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_core/widgets/app_bar_shell.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBarShell(title: 'Domicilios'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text('El contador es: '),
              CounterWidget(viewModel: viewModel),
              TextButton(
                onPressed: () => context.go(AppRoutes.domicilios),
                child: Text('Ir a Domicilios'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.increment.execute,
        child: Icon(Icons.add),
      ),
    );
  }
}
