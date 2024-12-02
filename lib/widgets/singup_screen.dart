import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Вирівнюємо по центру вертикально
          crossAxisAlignment: CrossAxisAlignment.stretch, // Розтягуємо колонки на всю ширину
          children: <Widget>[
            Center(child: Image.asset(
              "images/ava2.jpg",
                width: 200,
              ),
            ),
            const SizedBox(height: 10),

            Center(
              child: Text("Sing up", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
            ),
            const SizedBox(height: 20),

            const Text("Name:"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            const Text("Email:"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            Text("Password:"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Кнопка Reset на всю ширину з padding
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return const AlertDialog(
                      title: Text('Message'),
                      content: Text("Need to implement"),
                    );
                  },
                );
              },
              child: const Text('Sing up'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Задаємо ширину на всю доступну
                padding: const EdgeInsets.all(25), // Відступи всередині кнопки
              ),
            ),

            const SizedBox(height: 20),

            // Кнопка Back з рамкою
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue, // Колір рамки
                  width: 1.0, // Товщина рамки
                ),
                borderRadius: BorderRadius.circular(4.0), // Закруглені краї
              ),
              child: TextButton(
                onPressed: () => {
                  Navigator.pop(context),
                },
                child: const Text('Back'),
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Задаємо ширину на всю доступну
                  padding: const EdgeInsets.all(20), // Відступи всередині кнопки
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}