import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/border_radius_mode.dart';
import './widget/slicer_section.dart';
import './widget/blue_box.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BorderRadiusModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Demo Home Page"),
          backgroundColor: Colors.purple[200],
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        BlueBox(),
        SizedBox(height: 20),
        SliderSection(),
      ],
    );
  }
}