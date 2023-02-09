import 'package:flutter/material.dart';

class Feature extends StatefulWidget {
  String text;

  double number;

  Feature({Key? key, required this.text, required this.number})
      : super(key: key);

  @override
  State<Feature> createState() => _FeatureState();
}

class _FeatureState extends State<Feature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
