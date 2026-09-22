import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_exercises/main.dart';

void main() {
  testWidgets('Open exercise 2 and update input values', (tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.text('Exercise 2 – Input Controls\nDemo'));
    await tester.pumpAndSettle();

    expect(find.text('Current value: 50'), findsOneWidget);
    await tester.drag(find.byType(Slider), const Offset(150, 0));
    await tester.pumpAndSettle();
    expect(find.text('Current value: 50'), findsNothing);

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(find.text('Current status: Active'), findsOneWidget);

    await tester.tap(find.text('Action'));
    await tester.pumpAndSettle();
    expect(find.text('Selected genre: Action'), findsOneWidget);
    await tester.tap(find.text('Comedy'));
    await tester.pumpAndSettle();
    expect(find.text('Selected genre: Comedy'), findsOneWidget);

    await tester.ensureVisible(find.text('Open Date Picker'));
    await tester.tap(find.text('Open Date Picker'));
    await tester.pumpAndSettle();
    expect(find.byType(DatePickerDialog), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    final date = DateTime.now();
    expect(
      find.text('Selected date: ${date.day}/${date.month}/${date.year}'),
      findsOneWidget,
    );

    await tester.tap(find.text('Open Date Picker'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(
      find.text('Selected date: ${date.day}/${date.month}/${date.year}'),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });
}
