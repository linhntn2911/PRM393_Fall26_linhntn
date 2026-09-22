import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double rating = 50;
  bool active = false;
  String? genre;
  DateTime? selectedDate;

  // Mở lịch và cập nhật ngày được chọn.
  Future<void> selectDate() async {
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
      appBar: AppBar(title: const Text('Exercise 2 – Input Controls')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Rating (Slider)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Slider(
            value: rating,
            min: 0,
            max: 100,
            divisions: 100,
            label: rating.round().toString(),
            onChanged: (value) {
              setState(() {
                rating = value;
              });
            },
          ),
          Text('Current value: ${rating.round()}'),
          const SizedBox(height: 24),
          const Text(
            'Active (Switch)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Is movie active?'),
              Switch(
                value: active,
                onChanged: (value) {
                  setState(() {
                    active = value;
                  });
                },
              ),
            ],
          ),
          Text('Current status: ${active ? "Active" : "Inactive"}'),
          const SizedBox(height: 24),
          const Text(
            'Genre (RadioListTile)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          RadioGroup<String>(
            groupValue: genre,
            onChanged: (value) {
              setState(() {
                genre = value;
              });
            },
            child: const Column(
              children: [
                RadioListTile<String>(title: Text('Action'), value: 'Action'),
                RadioListTile<String>(title: Text('Comedy'), value: 'Comedy'),
              ],
            ),
          ),
          Text('Selected genre: ${genre ?? "None"}'),
          const SizedBox(height: 24),
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
    );
  }
}
