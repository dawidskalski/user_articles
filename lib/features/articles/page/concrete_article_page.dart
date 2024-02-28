import 'package:flutter/material.dart';

class ConcreteArticlePage extends StatelessWidget {
  const ConcreteArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          Text('Concrete article'),
        ],
      ),
    );
  }
}
