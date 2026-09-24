import 'package:flutter/material.dart';

class CommonUiErrorsDemo extends StatefulWidget {
  const CommonUiErrorsDemo({super.key});

  @override
  State<CommonUiErrorsDemo> createState() => _CommonUiErrorsDemoState();
}

class _CommonUiErrorsDemoState extends State<CommonUiErrorsDemo> {
  final List<String> movies = ['Movie A', 'Movie B', 'Movie C', 'Movie D'];
  int count = 0;
  DateTime? selectedDate;

  Future<void> selectDate() async {
    // context của State nằm dưới MaterialApp nên DatePicker có đủ theme
    // và MaterialLocalizations. Chỉ mở lịch khi người dùng bấm nút.
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100, 12, 31),
    );
    if (date != null && mounted) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 5 – Common UI Errors')),
      // Cho phép toàn bộ nội dung cuộn khi màn hình nhỏ, tránh overflow.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox cấp chiều cao hữu hạn cho Column chứa Expanded.
            SizedBox(
              height: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Correct ListView inside Column using Expanded',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      primary: false,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.movie),
                          title: Text(movies[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Small screen: SingleChildScrollView',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Scroll to see all controls on a small screen.'),
            const SizedBox(height: 16),
            const Text(
              'State update: setState()',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Current count: $count'),
            ElevatedButton(
              onPressed: () {
                // setState báo Flutter build lại để hiển thị giá trị mới.
                setState(() {
                  count++;
                });
              },
              child: const Text('Increase count'),
            ),
            const SizedBox(height: 16),
            const Text(
              'DatePicker: valid build context',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: selectDate,
              child: const Text('Open Date Picker'),
            ),
            const SizedBox(height: 8),
            Text(
              selectedDate == null
                  ? 'Selected date: None'
                  : 'Selected date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
            ),
          ],
        ),
      ),
    );
  }
}
