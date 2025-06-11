import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/gender_selector.dart';
import 'package:flutter_application_2/components/height_selector.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [GenderSelector(), HeightSelector()]);
  }
}
