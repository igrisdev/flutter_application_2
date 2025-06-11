import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_colors.dart';
import 'package:flutter_application_2/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double) onHeightChange;

  const HeightSelector({
    super.key,
    required this.selectedHeight,
    required this.onHeightChange,
  });

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text("Altura".toUpperCase(), style: TextStyles.bodyText),
            Text(
              "${widget.selectedHeight.toStringAsFixed(0)} cm",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: widget.selectedHeight,
              onChanged: (value) {
                widget.onHeightChange(value);
              },
              min: 150,
              max: 220,
              label: "${widget.selectedHeight}",
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
