import 'package:flutter/material.dart';
class Myappbar extends StatelessWidget {
  const Myappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      title: const Text('Homepage'),
      actions: [IconButton(onPressed: (){},
          icon: const Icon(Icons.search))],
    );
  }
}
