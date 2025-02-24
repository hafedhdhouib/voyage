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
          child: Wrap(
        children: [
          InkWell(
            child: InkWell(
              child: Ink.image(
                image: AssetImage('image/meteo.png'),
                width: 180,
                height: 180,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/meteo');
              },
            ),
          ),
          InkWell(
            child: Ink.image(
              image: AssetImage('image/gallerie.png'),
              width: 180,
              height: 180,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/galery');
            },
          ),
          InkWell(
            child: Ink.image(
              image: AssetImage('image/pays.png'),
              width: 180,
              height: 180,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/pays');
            },
          ),

          InkWell(
            child: Ink.image(
              image: AssetImage('image/contact.png'),
              width: 180,
              height: 180,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
          InkWell(
            child: Ink.image(
              image: AssetImage('image/parametres.png'),
              width: 180,
              height: 180,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/parametres');
            },
          ),
          InkWell(
            child: Ink.image(
              image: AssetImage('image/deconnexion.png'),
              width: 180,
              height: 180,
            ),
            onTap: () {
              _Deconnexion(context);
            },
          ),
        ],
      )),
    );
  }

  Future<void> _Deconnexion(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.pushNamedAndRemoveUntil(
        context, '/inscription', (route) => false);
  }
}
