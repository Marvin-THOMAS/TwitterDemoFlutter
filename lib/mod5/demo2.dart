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
        home: HomePage(title: "Démo widget de contenu"));
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Text("Hello there",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              )),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.amberAccent)),
              child: Text("Cliquer ici")),
          OutlinedButton(onPressed: () {}, child: Text("Cliquer là")),
          FilledButton(onPressed: () {}, child: Text("Ou là")),
          Image.network(
              "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExNXRhMWNueDBoOHZzem11NXg1eTU5dWkyZnFoMnV5NnUwaXk3YTNqbCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/tDfClZn3KzGpSL2PXk/giphy.webp"),
          Image.asset(
              "images/dark_sign.png")
        ],
      ),
    );
  }
}
