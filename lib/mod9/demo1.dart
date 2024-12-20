import 'package:flutter/material.dart';
import 'package:flutter_demo_rcda32/mod9/cat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(DemoApi());
}

class CatView extends StatelessWidget {

  Cat cat;

  CatView(this.cat){}


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(cat.urlImage ?? ''),
        Row(
          children: [
            Text(
                "Nom = ${cat.id}, hauteur = ${cat.height}, largeur = ${cat
                    .width}")
          ],
        )
      ],
    );
  }
}

class DemoApi extends StatefulWidget {
  @override
  State<DemoApi> createState() => _DemoApiState();
}

class _DemoApiState extends State<DemoApi> {
  Cat? felix;
  List<Cat> cats = [];

  void getCat() async {
    var response =
    await http.get(Uri.parse("https://api.thecatapi.com/v1/images/search"));

    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      setState(() {
        felix = Cat.fromJson(json[0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(onPressed: getCat, child: Text("GET CAT")),
            if (felix != null)
              Column(
                children: [
                  Image.network(felix?.urlImage ?? ''),
                  Row(
                    children: [
                      Text(
                          "Nom = ${felix?.id}, hauteur = ${felix
                              ?.height}, largeur = ${felix?.width}")
                    ],
                  )
                ],
              ),
            FutureBuilder<http.Response>(
                future: http.get(Uri.parse(
                    "https://api.thecatapi.com/v1/images/search?limit=10")),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data?.body != null) {
                    var body = snapshot.data?.body;

                    var json = convert.jsonDecode(body!);

                    cats = List<Cat>.from(
                        json.map((jsonCat) => Cat.fromJson(jsonCat)));

                    return Expanded(child: ListView.builder(
                        itemCount: cats.length,
                        itemBuilder: (context, index) {
                          return CatView(cats[index]);
                        }
                    ));
                  }

                  return CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
