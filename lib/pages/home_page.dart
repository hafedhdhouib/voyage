import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/menu/drawer_widget.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              _Deconnexion(context);
            },
            child: Text(
              "Deconnexion",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size.fromHeight(50),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _Deconnexion(BuildContext context) async {
    prefs=await SharedPreferences.getInstance();
    prefs.setBool("connecte",false);
    Navigator.pushNamedAndRemoveUntil(context, '/inscription', (route) => false);
  }
}
