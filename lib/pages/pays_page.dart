import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer_widget.dart';

class PaysPage extends StatelessWidget {
  const PaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDeawer(),
      appBar: AppBar(
        title: Text("Page Pays"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
            "Page Pays",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
