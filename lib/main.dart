import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/pages/authentification_page.dart';
import 'package:voyage/pages/contact_page.dart';
import 'package:voyage/pages/galery_page.dart';
import 'package:voyage/pages/home_page.dart';
import 'package:voyage/pages/inscription_page.dart';
import 'package:voyage/pages/meteo_page.dart';
import 'package:voyage/pages/parametres_page.dart';
import 'package:voyage/pages/pays_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
final ro = {
  '/inscription':(context)=>InscriptionPage(),
  '/authentitfication':(context)=>AuthentificationPage(),
  '/home':(context)=> HomePage(),
  '/meteo':(context)=>MeteoPage(),
  '/galery':(context)=>GaleryPage(),
  '/pays':(context)=>PaysPage(),
  '/contact':(context)=>ContactPage(),
  '/parametres':(context)=>ParametresPage()
};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: ro,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(future:
          SharedPreferences.getInstance()
          , builder: (context,snapshot){
        if(snapshot.hasData){
          bool connect = snapshot.data?.getBool("connecte") ??false;
          if (connect)
            return HomePage();
        }
        return AuthentificationPage();
          }),
    );
  }
}
