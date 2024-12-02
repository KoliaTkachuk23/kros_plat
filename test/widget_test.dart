import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lab15/functions.dart';
import 'package:lab15/main.dart';


void main() {
  group('FunctionCalculator', () {
    test('calculates y = (x^2 + x) - 100 correctly', () {
      final calculator = FunctionCalculator();
      expect(calculator.calculateFunction(0), -100);
      expect(calculator.calculateFunction(10), 10);
      expect(calculator.calculateFunction(-10), -110);
    });

    test('should throw error when x is 0', () {
      final calculator = FunctionCalculator();
      expect(() => calculator.calculateFunction(0), throwsArgumentError);
    });
  });

  group('UI tests', () {
    testWidgets('should display correct text for app title', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text('IPZ-31: Tkachuk\'s last Flutter App'), findsOneWidget);
    });

    testWidgets('should have FloatingActionButton with correct icon', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);

      final fabIcon = find.descendant(of: fab, matching: find.byIcon(Icons.pets));
      expect(fabIcon, findsOneWidget); // Перевірка на іконку для варіанту 23
    });

    testWidgets('should display the result of calculation', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Переміщаємо слайдер і перевіряємо результат
      await tester.drag(find.byType(Slider), const Offset(100.0, 0));
      await tester.pump();

      expect(find.textContaining('y ='), findsOneWidget);
    });
  });
}
