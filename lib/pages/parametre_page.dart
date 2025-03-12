import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer_widget.dart';

class ParametrePage extends StatelessWidget {
  const ParametrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDeawer(),
      appBar: AppBar(
        title: Text("Page Parametre"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
            "Page Parametre",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
