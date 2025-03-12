import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/drawer_widget.dart';

class homePage extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDeawer(),
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blue,
      ),

      body: Center(

        child: Wrap(
          children: [
            InkWell(
              child: Ink.image(
                  height: 180,
                  width: 180,
                  image: AssetImage('image/meteo.png'),),
              onTap: (){
                Navigator.pushNamed(context, '/meteo');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('image/gallerie.png'),),
              onTap: (){
                Navigator.pushNamed(context, '/gallerie');
              },
            ),

            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('image/pays.png'),),
              onTap: (){
                Navigator.pushNamed(context, '/pays');
              },
            ),

            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('image/contact.png'),),
              onTap: (){
                Navigator.pushNamed(context, '/contact');
              },
            ),

            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('image/parametres.png'),),
              onTap: (){
                Navigator.pushNamed(context, '/parametres');
              },
            ),

            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('image/deconnexion.png'),),
              onTap: () async{
                prefs=await SharedPreferences.getInstance();
                prefs.setBool("connecte", false);
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/authentification',
                        (route)=>false);
              },
            )
          ],
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
