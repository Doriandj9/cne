import 'package:app_core/widgets/app_bar_shell.dart';
import 'package:app_core/widgets/app_section_title.dart';
import 'package:cne_domicilios/core/widgets/app_image.dart';
import 'package:cne_domicilios/ui/domicilio/viewmodels/domicilio_home_viewmodel.dart';
import 'package:cne_domicilios/ui/domicilio/widget/show_posts_widget.dart';
import 'package:flutter/material.dart';

class DomicilioScreen extends StatelessWidget {
  const DomicilioScreen({super.key, required this.viewmodel});

  final DomicilioHomeViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarShell(title: 'Otra pantalla interna'),
      body: Center(
        child: Column(
          children: [
            AppImage.assets('assets/img/domicilios.png'),
            Text('Pantalla de Domicilios'),
            AppSectionTitle(title: 'Datos'),
            ShowPostsWidget(viewModel: viewmodel),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewmodel.load.execute();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
