import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/border_radius_mode.dart';
import 'custom_slider.dart';

class SliderSection extends StatelessWidget {
  const SliderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BorderRadiusModel>(context);

    return Center(
      child: Column(
        children: [
          Row(
            children: [
              CustomSlider(
                label: "Top Left",
                value: model.topLeft,
                onChanged: model.updateTopLeft,
              ),
              CustomSlider(
                label: "Top Right",
                value: model.topRight,
                onChanged: model.updateTopRight,
              ),
            ],
          ),
          Row(children: [
            CustomSlider(
              label: "Bottom Left",
              value: model.bottomLeft,
              onChanged: model.updateBottomLeft,
            ),
            CustomSlider(
              label: "Bottom Right",
              value: model.bottomRight,
              onChanged: model.updateBottomRight,
            ),
          ],)
        ],
      ),
    );
  }
}