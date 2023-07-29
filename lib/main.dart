import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de Vendas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplicativo de Vendas'),
        ),
        body: Center(
          child: Text('Bem vindo(a)'),
        ),
      ),
    );
  }
}
