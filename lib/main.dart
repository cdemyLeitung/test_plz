// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
        child: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait
              ? Column(
                  children: [
                    RaumReihe(
                      children: [
                        RaumZwischen(),
                        RaumEingabe(flex: 32),
                        RaumZwischen(),
                      ],
                    ),
                    RaumZwischen(),
                    RaumReihe(
                      children: [
                        RaumZwischen(),
                        RaumTaste(title: '1'),
                        RaumZwischen(),
                        RaumTaste(title: '2'),
                        RaumZwischen(),
                        RaumTaste(title: '3'),
                        RaumZwischen(),
                      ],
                    ),
                    RaumZwischen(),
                    RaumReihe(
                      children: [
                        RaumZwischen(),
                        RaumTaste(title: '4'),
                        RaumZwischen(),
                        RaumTaste(title: '5'),
                        RaumZwischen(),
                        RaumTaste(title: '6'),
                        RaumZwischen(),
                      ],
                    ),
                    RaumZwischen(),
                    RaumReihe(
                      children: [
                        RaumZwischen(),
                        RaumTaste(title: '7'),
                        RaumZwischen(),
                        RaumTaste(title: '8'),
                        RaumZwischen(),
                        RaumTaste(title: '9'),
                        RaumZwischen(),
                      ],
                    ),
                    RaumZwischen(),
                    RaumReihe(
                      children: [
                        RaumZwischen(),
                        RaumTaste(title: 'DEL'),
                        RaumZwischen(),
                        RaumTaste(title: '0'),
                        RaumZwischen(),
                        RaumTaste(title: 'OK'),
                        RaumZwischen(),
                      ],
                    ),
                    RaumZwischen(),
                  ],
                )
              : Column(
                  children: [
                    RaumReihe(
                      children: [
                        RaumZwischen(),
                        RaumTaste(title: 'DEL'),
                        RaumZwischen(),
                        RaumEingabe(flex: 32),
                        RaumZwischen(),
                        RaumTaste(title: 'OK'),
                        RaumZwischen(),
                      ],
                    ),
                    RaumZwischen(),
                    RaumReihe(
                      children: [
                        RaumZwischen(),
                        RaumTaste(title: '1'),
                        RaumZwischen(),
                        RaumTaste(title: '2'),
                        RaumZwischen(),
                        RaumTaste(title: '3'),
                        RaumZwischen(),
                        RaumTaste(title: '4'),
                        RaumZwischen(),
                        RaumTaste(title: '5'),
                        RaumZwischen(),
                      ],
                    ),
                    RaumZwischen(),
                    RaumReihe(
                      children: [
                        RaumZwischen(),
                        RaumTaste(title: '6'),
                        RaumZwischen(),
                        RaumTaste(title: '7'),
                        RaumZwischen(),
                        RaumTaste(title: '8'),
                        RaumZwischen(),
                        RaumTaste(title: '9'),
                        RaumZwischen(),
                        RaumTaste(title: '0'),
                        RaumZwischen(),
                      ],
                    ),
                    RaumZwischen(),
                  ],
                ),
        ),
      ),
    );
  }
}

class RaumZwischen extends StatelessWidget {
  const RaumZwischen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: Colors.yellow));
  }
}

class RaumReihe extends StatelessWidget {
  final List<Widget> children;
  const RaumReihe({
    this.children = const <Widget>[],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(
        color: Colors.red,
        child: Row(
          children: [...children],
        ),
      ),
    );
  }
}

class RaumTaste extends StatelessWidget {
  final String title;
  const RaumTaste({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          color: Colors.blue,
          child: Text(title),
          height: (constraints.maxHeight > constraints.maxWidth) ? constraints.maxWidth : constraints.maxHeight,
          width: (constraints.maxHeight > constraints.maxWidth) ? constraints.maxWidth : constraints.maxHeight,
        ),
      ),
    );
  }
}

class RaumEingabe extends StatelessWidget {
  final int flex;
  const RaumEingabe({
    required this.flex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: LayoutBuilder(builder: (context, constraints) {
        final maxHeight = constraints.maxHeight > constraints.maxWidth / (flex / 10.0)
            ? constraints.maxWidth / (flex / 10.0)
            : constraints.maxHeight;
        final maxWidth = constraints.maxHeight > constraints.maxWidth / (flex / 10.0)
            ? constraints.maxWidth
            : constraints.maxHeight * (flex / 10.0);
        return Container(
          color: Colors.grey,
          child: const Text('Eingabe'),
          height: maxHeight,
          width: maxWidth,
        );
      }),
    );
  }
}
