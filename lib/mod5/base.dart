import 'package:flutter/material.dart';
import 'demo1.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Demo Layout",
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)),
        home: HomePageRef(title: "Démo widget de contenu"));
  }
}

class HomePageRef extends StatelessWidget {
  String title;

  HomePageRef({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
