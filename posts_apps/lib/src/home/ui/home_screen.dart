import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posts_apps/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: Text('Home Posts')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SizedBox(
              height: 85,
              child: FloatingActionButton(
                onPressed: () {
                  context.go(Routes.posts);
                },
                child: Column(
                  children: [
                    Icon(Icons.post_add_sharp),
                    Text('Ir a los Posts'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
