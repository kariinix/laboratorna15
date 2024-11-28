import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab15/main.dart';

void main() {
  group('FunctionCalculator tests', () {
    test('Correct calculation of y = x^3 - x^2 - x', () {
      final calculator = FunctionCalculator();
      expect(calculator.calculate(2), 2);
      expect(calculator.calculate(0), 0);
      expect(calculator.calculate(-1), -1);
    });
  });

  testWidgets('Check title format in the AppBar', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text("KN32: Karina's last Flutter App"), findsOneWidget);
  });

  testWidgets('Check FloatingActionButton with icon Icons.pets', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final fab = find.byType(FloatingActionButton);
    expect(fab, findsOneWidget);

    final icon = find.descendant(of: fab, matching: find.byWidgetPredicate(
          (widget) => widget is Icon && widget.icon == Icons.pets,
      description: 'Icon with pets icon',
    ));
    expect(icon, findsOneWidget);
  });

  testWidgets('Check counter increments correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });
}
