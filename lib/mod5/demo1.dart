import 'package:flutter/material.dart';

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
      home: AppHomePage(),
    );
  }
}

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text AppBar"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlueAccent,
          child: Column(
            children: [
              Text("Colone 1 - Ligne 1",
                  style: TextStyle(color: Colors.yellowAccent, fontSize: 36)),
              SizedBox(height: 2500),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text("Colone 1 - Ligne 2",
                    style: TextStyle(color: Colors.yellowAccent, fontSize: 36)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Colonne 1 - Ligne 3"),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Colonne 1 - Ligne 4"),
                  )
                ],
              ),
              FlexMachin()
            ],
          ),
        ),
      ),
    );
  }
}

class FlexMachin extends StatelessWidget {
  const FlexMachin({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [Text("Text du Flex")],
    );
  }
}
