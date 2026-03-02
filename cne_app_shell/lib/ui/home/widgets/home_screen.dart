import 'package:cne_app_shell/ui/core/widgets/app_banner_shell.dart';
import 'package:cne_app_shell/ui/core/widgets/app_bar_shell.dart';
import 'package:cne_app_shell/ui/core/widgets/app_grid_menu_shell.dart';
import 'package:cne_app_shell/ui/core/widgets/app_section_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBarShell(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBannerShell(),
            SizedBox(height: 18),
            AppSectionTitle(title: 'Servicios'),
            SizedBox(height: 20),
            AppGridMenuShell(),
          ],
        ),
      ),
    );
  }
}
