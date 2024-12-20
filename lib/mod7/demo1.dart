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
      body: DemoForm(),
    );
  }
}

class DemoForm extends StatefulWidget {
  @override
  State<DemoForm> createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  bool isOk = false;
  String radioValue = "";
  var formKey = GlobalKey<FormState>();

  String name = "";
  int age = 0;
  String bouffe = "";

  void updateRadioValue(String? value) {
    setState(() {
      radioValue = value!;
    });
  }

  String? validateName(value) {
    if (value == null || value.trim().isEmpty) {
      return "Le nom est obligatoire";
    }
    if (value.length <= 2) {
      return "Le nom doit faire 3 charactère minimum";
    }
    return null;
  }

  String? validateAge(value) {
    if (value == null || value.trim().isEmpty) {
      return "Le nom est obligatoire";
    }
    if (int.parse(value) <= 0) {
      return "L'age ne peut etre négatif";
    }
    return null;
  }

  String? validateBouffe(value) {
    if (value == null) {
      return "Veuillez choisir un plat";
    }

    var values = ["Raclette", "Fricadelle", "Risotto"];

    if (!values.contains(value)) {
      return "Raté !";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) {
                  if (value != null) {
                    name = value;
                  }
                },
                validator: validateName,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Saisisez votre nom",
                ),
              ),
              TextFormField(
                onSaved: (value) {
                  if (value != null) {
                    age = int.parse(value);
                  }
                },
                validator: validateAge,
                decoration: InputDecoration(
                  labelText: "Age",
                  hintText: "Saisisez votre age",
                ),
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField(
                  onSaved: (value) {
                    if (value != null) {
                      bouffe = value;
                    }
                  },
                  validator: validateBouffe,
                  items: [
                    DropdownMenuItem<String>(
                      child: Text("-- Choisir un plat --"),
                      value: null,
                    ),
                    DropdownMenuItem<String>(
                      child: Text("-- Raclette --"),
                      value: "Raclette",
                    ),
                    DropdownMenuItem<String>(
                      child: Text("-- Fricadelle --"),
                      value: "Fricadelle",
                    ),
                    DropdownMenuItem<String>(
                      child: Text("-- Risotto --"),
                      value: "Risotto",
                    ),
                  ],
                  onChanged: (value) {}),
              Row(
                children: [
                  Text("La forme ?"),
                  Checkbox(
                      value: isOk,
                      onChanged: (isChecked) {
                        setState(() {
                          isOk = isChecked!;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                      value: "sucre",
                      groupValue: radioValue,
                      onChanged: updateRadioValue),
                  Text("Sucré ?"),
                  Radio<String>(
                      value: "sel",
                      groupValue: radioValue,
                      onChanged: updateRadioValue),
                  Text("Salé ?"),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      print(name);
                      print(age);
                      print(bouffe);
                    }
                  },
                  child: Text("Valider")),
            ],
          ),
        ));
  }
}
