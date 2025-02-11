import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/pages/home_page.dart';
import 'package:voyage/pages/inscription_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
final ro = {
  '/inscription':(context)=>InscriptionPage(),
  '/home':(context)=> HomePage()
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
          bool connect = snapshot.data?.getBool("connect") ??false;
          if (connect)
            return HomePage();
        }
        return InscriptionPage();
          }),
    );
  }
}
