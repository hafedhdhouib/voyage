import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer_widget.dart';

class GaleryPage extends StatelessWidget {
  const GaleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Page galery'),
      ),
      body: Center(child: Text('galery', style: TextStyle(fontSize: 22),),),
    );
  }
}
