import 'package:flutter/material.dart';

import '../Widgets/CoreWidgetsBody.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 1 – Core Widgets')),
      body: const CoreWidgetsBody(),
    );
  }
}
