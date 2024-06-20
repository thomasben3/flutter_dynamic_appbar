import 'package:dynamic_appbar/dynamic_appbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic AppBar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const double _appBarHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DynamicAppBarView(
        title: const Text(
          'Dynamic AppBar',
          style: TextStyle(color: Colors.white, fontSize: 23)
        ),
        appBarHeight: _appBarHeight,
        appBarColor: Colors.blue,
        leftButton: const Icon(
          Icons.star,
          color: Colors.white
        ),
        rightButton: IconButton(
          onPressed: () {/* Triggers function */},
          icon: const Icon(
            Icons.menu,
            color: Colors.white
          )
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: _appBarHeight),
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        ),
      ),
    );
  }
}
