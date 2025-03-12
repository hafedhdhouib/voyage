import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDeawer(),
      appBar: AppBar(
        title: Text("Page Contact"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
            "Page Contact",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
