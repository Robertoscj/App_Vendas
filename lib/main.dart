import 'dart:js';

import 'package:app_vendas/src/componetes/pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Homepage.tag: (context) => Homepage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de Vendas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Homepage(),
      routes: routes,
    );
  }
}
