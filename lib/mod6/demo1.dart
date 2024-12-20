import 'package:flutter/material.dart';

void main() {
  runApp(PasswordInput());
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isVisible = false;

  void changeVisibility(bool value) {
    setState(() {
      isVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Démo state",
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  obscureText: !isVisible,
                  decoration: InputDecoration(labelText: "Mot de passe"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(isVisible ? Icons.lock_open : Icons.lock),
                    Switch(value: isVisible, onChanged: changeVisibility)
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
