import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

final Dio dio = Dio();

Future<void> sendData(String endpoint, Map<String, dynamic> data) async {
  final url = 'https://lab12_kolia.requestcatcher.com/$endpoint';
  try {
    final response = await dio.post(url, data: data);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateField(String? value) => value == null || value.isEmpty ? 'This field is required' : null;

  String? _validatePassword(String? value) => value != null && value.length < 7 ? 'Password must be at least 7 characters' : null;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(value) ? null : 'Enter a valid email';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Image.asset('images/ava2.jpg', width: 300),
              ),
              const Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center),
              const SizedBox(height: 20),
              TextFormField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name', border: OutlineInputBorder()), validator: _validateField),
              const SizedBox(height: 10),
              TextFormField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()), validator: _validateEmail),
              const SizedBox(height: 10),
              TextFormField(controller: _passwordController, obscureText: true, decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()), validator: _validatePassword),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendData('signup', {
                      'name': _nameController.text,
                      'email': _emailController.text,
                      'password': _passwordController.text,
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) => const AlertDialog(
                        title: Text('Message'),
                        content: Text("Registered successfully"),
                      ),
                    );
                  }
                },
                child: const Text("Sign Up"),
              ),

              const SizedBox(height: 10),
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("Back")),
            ],
          ),
        ),
      ),
    );
  }
}