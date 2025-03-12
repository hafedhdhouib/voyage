import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer_widget.dart';

class GalleriePage extends StatelessWidget {
  const GalleriePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDeawer(),
      appBar: AppBar(
        title: Text("Page Gallerie"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
            "Page Gallerie",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
