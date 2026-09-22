import 'package:flutter/material.dart';

class CoreWidgetsBody extends StatelessWidget {
  const CoreWidgetsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Welcome to Flutter UI',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        const Icon(Icons.movie, color: Colors.blue, size: 80),
        const SizedBox(height: 24),
        Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox(
              height: 200,
              child: Center(
                child: Text('Không tải được ảnh. Hãy kiểm tra mạng.'),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        const Card(
          child: ListTile(
            leading: Icon(Icons.star),
            title: Text('Movie Item'),
            subtitle: Text('This is a sample ListTile inside a Card.'),
          ),
        ),
      ],
    );
  }
}
