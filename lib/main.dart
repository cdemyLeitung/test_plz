import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bla'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxX = constraints.maxWidth / 3;
          final maxY = constraints.maxHeight / 4;
          final max = maxX > maxY ? maxY : maxX;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.black,
                width: double.infinity,
                height: maxY,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Taste(
                    max: max,
                    color: Colors.yellowAccent,
                  ),
                  Taste(
                    max: max,
                    color: Colors.brown,
                  ),
                  Taste(
                    max: max,
                    color: Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Taste(
                    max: max,
                    color: Colors.brown,
                  ),
                  Taste(
                    max: max,
                    color: Colors.green,
                  ),
                  Taste(
                    max: max,
                    color: Colors.yellowAccent,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Taste(
                    max: max,
                    color: Colors.green,
                  ),
                  Taste(
                    max: max,
                    color: Colors.yellowAccent,
                  ),
                  Taste(
                    max: max,
                    color: Colors.brown,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class Taste extends StatelessWidget {
  const Taste({
    Key? key,
    required this.color,
    required this.max,
  }) : super(key: key);

  final double max;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: max,
      height: max,
    );
  }
}
