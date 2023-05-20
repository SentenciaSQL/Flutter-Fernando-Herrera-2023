import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
  : assert(selectedColor >= 0, 'Selected color mus be greater thna 0'),
    assert(selectedColor < colorList.length, 'Selected color mus be greater thna 0');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
    // textTheme: TextTheme(
    //   displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    //   titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: colorList[5]),
    //   bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    // )
  );

  
}

// child: Text('Hello World!', style: AppTheme(selectedColor: 0).getTheme().textTheme.titleLarge),