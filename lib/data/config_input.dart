import 'dart:ui';
import 'package:flutter/material.dart';

class InputConfig {
  final String label;
  final Color textColor;
  final double textSize;
  final List<int> values;
  final Map<int, String> valueLabels;

  InputConfig({
    required this.label,
    required this.textColor,
    required this.textSize,
    required this.values,
    required this.valueLabels,
  });
}

InputConfig interestInputConfig = InputConfig(
  label: 'Rate of Interest:',
  textColor: Colors.black,
  textSize: 16.0,
  values: List.generate(15, (index) => index + 1),
  valueLabels: {
    1: '1%',
    2: '2%',
  },
);
