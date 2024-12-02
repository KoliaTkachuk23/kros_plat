import 'package:flutter/material.dart';
import 'functions.dart'; // Імпортуємо клас для розрахунку функції

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IPZ-31: Tkachuk\'s last Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FunctionCalculator _calculator = FunctionCalculator();
  String _result = "Result will be shown here";

  double _xValue = 2; // Початкове значення x

  void _calculateResult() {
    try {
      setState(() {
        _result = 'y = ${_calculator.calculateFunction(_xValue)}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IPZ-31: Tkachuk\'s last Flutter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter value for x:'),
            Slider(
              min: -70,
              max: 70,
              divisions: 20, 
              value: _xValue,
              onChanged: (double value) {
                setState(() {
                  _xValue = (value / 7).roundToDouble() * 7; // Округлення до найближчого кроку
                });
              },
            ),
            Text(_result),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculateResult,
        tooltip: 'Calculate',
        child: const Icon(Icons.pets), // Іконка для варіанту 21
      ),
    );
  }
}
