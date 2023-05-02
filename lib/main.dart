import 'package:flutter/material.dart';
import 'package:flutter_theme_calculator/calculatorUi.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculatorUi(),
    theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.dark(primary: Colors.black)),
  ));
}
