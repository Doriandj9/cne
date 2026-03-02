import 'package:cne_domicilios/core/widgets/app_image.dart';
import 'package:flutter/material.dart';

class DomicilioScreen extends StatelessWidget {
  const DomicilioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Theme.of(context).colorScheme.primary,
          child: Text('Domicilios'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            AppImage.assets('assets/img/domicilios.png'),
            Text('Pantalla de Domicilios'),
          ],
        ),
      ),
    );
  }
}
