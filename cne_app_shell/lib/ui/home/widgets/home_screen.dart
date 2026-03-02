import 'package:cne_domicilios/infrastructure/domicilios_microapp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          color: Theme.of(context).colorScheme.primary,
          child: Text('App shell'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('App principal'),
            TextButton(
              onPressed: () {
                context.go(DomiciliosMicroapp().path);
              },
              child: Text('Domicilios'),
            ),
          ],
        ),
      ),
    );
  }
}
