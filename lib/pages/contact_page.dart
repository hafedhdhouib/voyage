import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Page contact'),
      ),
      body: Center(child: Text('contact', style: TextStyle(fontSize: 22),),),
    );
  }
}
