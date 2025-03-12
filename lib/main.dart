import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/pages/authentification_page.dart';
import 'package:voyage/pages/contact_page.dart';
import 'package:voyage/pages/gallerie_page.dart';
import 'package:voyage/pages/home_page.dart';
import 'package:voyage/pages/inscription_page.dart';
import 'package:voyage/pages/meteo_page.dart';
import 'package:voyage/pages/parametre_page.dart';
import 'package:voyage/pages/pays_page.dart';
void main()=>runApp(MyApp());
    class MyApp extends StatelessWidget {

  final routes={
    '/inscription':(context)=>InscriptionPage(),
    '/home':(contexte)=>homePage(),
    '/authentification':(contexte)=>AuthentificationPage(),
    '/meteo':(contexte)=>MeteoPage(),
    '/gallerie':(context)=>GalleriePage(),
    '/parametres':(context)=>ParametrePage(),
    '/pays':(context)=>PaysPage(),
    '/contact':(context)=>ContactPage()
  };
      @override
      Widget build(BuildContext context) {
        return  MaterialApp(
          routes: routes,
          debugShowCheckedModeBanner: false,
          home: FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (context,snapshot)
          {
            if(snapshot.hasData)
              {
                bool conn=snapshot.data?.getBool('connecte')??false;
                if(conn)
                  return homePage();
              }
            return InscriptionPage();
          })
        );
      }
    }
