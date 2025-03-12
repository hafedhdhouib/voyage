
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDeawer extends StatelessWidget{

  const MyDeawer({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    late SharedPreferences prefs;
    return Drawer(

      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.white,Colors.blue])
            ),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("image/user5.png"),
                radius: 80,
              ),
            ),
          ),

          ListTile(

            title: Text('Acceuil',style: TextStyle(fontSize: 22),),
            leading: Icon(Icons.home,color: Colors.blue,),
            trailing: Icon(Icons.arrow_right,color: Colors.blue,),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },



          ),
          Divider(height: 4,color: Colors.blue),

          ListTile(
            title: Text('Meteo',style: TextStyle(fontSize: 22),),
            leading: Icon(Icons.sunny,color: Colors.blue,),
            trailing: Icon(Icons.arrow_right,color: Colors.blue,),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/meteo');
            },



          ),
          Divider(height: 4,color: Colors.blue),
          ListTile(
            title: Text('Gallerie',style: TextStyle(fontSize: 22),),
            leading: Icon(Icons.browse_gallery,color: Colors.blue,),
            trailing: Icon(Icons.arrow_right,color: Colors.blue,),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/gallerie');
            },



          ),
          Divider(height: 4,color: Colors.blue),
          ListTile(
            title: Text('Pays',style: TextStyle(fontSize: 22),),
            leading: Icon(Icons.add_chart,color: Colors.blue,),
            trailing: Icon(Icons.arrow_right,color: Colors.blue,),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pays');
            },



          ),
          Divider(height: 4,color: Colors.blue),
          ListTile(
            title: Text('Contact',style: TextStyle(fontSize: 22),),
            leading: Icon(Icons.contact_mail,color: Colors.blue,),
            trailing: Icon(Icons.arrow_right,color: Colors.blue,),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact');
            },



          ),
          Divider(height: 4,color: Colors.blue),
          ListTile(
            title: Text('parametre',style: TextStyle(fontSize: 22),),
            leading: Icon(Icons.settings,color: Colors.blue,),
            trailing: Icon(Icons.arrow_right,color: Colors.blue,),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/parametres');
            },



          ),
          Divider(height: 4,color: Colors.blue),
          ListTile(
            title: Text('Deconnexion',style: TextStyle(fontSize: 22),),
            leading: Icon(Icons.logout,color: Colors.blue,),
            trailing: Icon(Icons.arrow_right,color: Colors.blue,),
            onTap: () async{
              prefs=await SharedPreferences.getInstance();
              prefs.setBool("connecte", false);
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/authentification',
                  (route)=>false);
            },



          ),

        ],
      ),
    );
  }
}