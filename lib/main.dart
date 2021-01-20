import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Color color = Colors.lightGreen;
  List<Color> colors = [Colors.red, Colors.blue];

  colorGenerator() {
    Color colorG = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    List<Color> colorsG = [
      Colors.primaries[Random().nextInt(Colors.primaries.length)],
      Colors.primaries[Random().nextInt(Colors.primaries.length)]
    ];

    setState(() {
      color = colorG;
      colors = colorsG;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: color,
        child: Center(
          child: Text(
            "HEY THERE!",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = ui.Gradient.linear(
                  const Offset(0, 20),
                  const Offset(200, 20),
                  colors,
                ),
            ),
          ),
        ),
      ),
      onTap: () => colorGenerator(),
    );
  }
}
