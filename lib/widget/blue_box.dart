import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/border_radius_mode.dart';

class BlueBox extends StatelessWidget {
  const BlueBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = Provider.of<BorderRadiusModel>(context);
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius.topLeft),
          topRight: Radius.circular(borderRadius.topRight),
          bottomLeft: Radius.circular(borderRadius.bottomLeft),
          bottomRight: Radius.circular(borderRadius.bottomRight),
        ),
      ),
    );
  }
}