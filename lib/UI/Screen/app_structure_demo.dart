import 'package:flutter/material.dart';

class AppStructureDemo extends StatefulWidget {
  const AppStructureDemo({super.key});

  @override
  State<AppStructureDemo> createState() => _AppStructureDemoState();
}

class _AppStructureDemoState extends State<AppStructureDemo> {
  bool darkMode = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // MaterialApp riêng giúp bài 4 tự đổi themeMode khi bật Dark Mode.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFBF8FF),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => Navigator.pop(context)),
          title: const Text('Exercise 4 – App Structure'),
          actions: [
            const Text('Dark'),
            Switch(
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('This is a simple screen with theme toggle.'),
                const SizedBox(height: 16),
                Text('Current theme: ${darkMode ? "Dark" : "Light"}'),
                const SizedBox(height: 16),
                Text('Button pressed: $count'),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increase count',
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
