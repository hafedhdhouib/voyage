import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer_widget.dart';

class MeteoPage extends StatelessWidget {
  const MeteoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Page meteo'),
      ),
      body: Center(child: Text('meteo', style: TextStyle(fontSize: 22),),),
    );
  }
}
