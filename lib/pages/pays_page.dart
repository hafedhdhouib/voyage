import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer_widget.dart';

class PaysPage extends StatelessWidget {
  const PaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Page contact'),
      ),
      body: Center(
        child: Text(
          'pays',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
