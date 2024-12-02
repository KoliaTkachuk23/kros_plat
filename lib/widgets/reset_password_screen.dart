import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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



class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

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
                child: Image.asset('images/hado99.jpg', width: 200),
              ),
              const Text("Reset Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center),
              const SizedBox(height: 20),
              TextFormField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()), validator: _validateEmail),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendData('reset-password', {
                      'email': _emailController.text,
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) => const AlertDialog(
                        title: Text('Message'),
                        content: Text("Reset link sent to your email"),
                      ),
                    );
                  }
                },
                child: const Text("Reset Password"),
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