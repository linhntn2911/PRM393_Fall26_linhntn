import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_exercises/main.dart';

void main() {
  testWidgets('Exercise 3 opens from menu and lists movies', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Exercise 3 – Layout\nDemo'));
    await tester.pumpAndSettle();
    for (final movie in ['Avatar', 'Inception', 'Interstellar', 'Joker']) {
      expect(find.text(movie), findsOneWidget);
    }
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Lab 4 – Flutter UI Fundamentals'), findsOneWidget);
  });

  testWidgets('Exercise 4 switches theme, increments and returns', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Exercise 4 – App Structure\nDemo'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(find.text('Current theme: Dark'), findsOneWidget);
    expect(
      Theme.of(tester.element(find.byType(Switch))).brightness,
      Brightness.dark,
    );
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.text('Button pressed: 1'), findsOneWidget);
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(
      Theme.of(tester.element(find.byType(Switch))).brightness,
      Brightness.light,
    );
    expect(find.text('Button pressed: 1'), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Lab 4 – Flutter UI Fundamentals'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Exercise 5 scrolls on small screen and updates state and date', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MyApp());
    final menu = find.text('Exercise 5 – Common UI Errors\nDemo');
    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pumpAndSettle();
    await tester.tap(menu);
    await tester.pumpAndSettle();
    expect(find.text('Movie A'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.ensureVisible(find.text('Increase count'));
    await tester.tap(find.text('Increase count'));
    await tester.pumpAndSettle();
    expect(find.text('Current count: 1'), findsOneWidget);
    await tester.ensureVisible(find.text('Open Date Picker'));
    await tester.tap(find.text('Open Date Picker'));
    await tester.pumpAndSettle();
    expect(find.byType(DatePickerDialog), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    final today = DateTime.now();
    final label = 'Selected date: ${today.day}/${today.month}/${today.year}';
    expect(find.text(label), findsOneWidget);
    await tester.tap(find.text('Open Date Picker'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(find.text(label), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
