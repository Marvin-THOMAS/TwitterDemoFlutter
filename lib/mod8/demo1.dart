import 'package:flutter/material.dart';
import 'package:flutter_demo_rcda32/mod8/page-1.dart';
import 'package:flutter_demo_rcda32/mod8/page-2.dart';

void main() {
  runApp(const DemoRouting());
}


// Externalisation des routes
class Routes {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      "/page-1": (context) => PageOne(),
      "/page-2": (context) => PageTwo()
    };
  }
}

class DemoRouting extends StatelessWidget {
  const DemoRouting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.getRoutes(context),
      initialRoute: "/page-1",
    );
  }
}
