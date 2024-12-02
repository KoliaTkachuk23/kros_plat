import 'package:flutter/material.dart';
import './widgets/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _textController = TextEditingController();
  double _fontSize = 16.0;

  void _navigateToSecondScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(
          text: _textController.text,
          fontSize: _fontSize,
        ),
      ),
    );

    if (result == 'Cool!') {
      _showDialog('Cool!');
    } else if (result == 'Let’s try something else') {
      _showDialog('Let’s try something else');
    } else {
      _showDialog("Don't know what to say");
    }
  }
  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/Robot.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text(message),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Input Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter text',
                border:OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Text('Font size: ${_fontSize.toStringAsFixed(1)}'),
            Slider(
              value: _fontSize,
              min: 10.0,
              max: 70.0,
              onChanged: (value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToSecondScreen,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}