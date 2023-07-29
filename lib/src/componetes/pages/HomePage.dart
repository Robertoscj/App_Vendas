import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final content = Center(
      child.Text('Pagina Home'),
    );
  }
}
