import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer_widget.dart';

class ParametresPage extends StatelessWidget {
  const ParametresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Page contact'),
      ),
      body: Center(child: Text('parametre', style: TextStyle(fontSize: 22),),),
    );
  }
}
