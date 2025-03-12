import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthentificationPage extends StatelessWidget {
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();
  late SharedPreferences prefs;
  late String login;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Authentification Page"),
          backgroundColor: Colors.blue,
        ),

        body: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_login,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Identifiant",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              obscureText: true,
              controller: txt_password,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Mot de Passe",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  _onAuthentificate(context);
                },
                child: Text("Connexion",
                  style: TextStyle(color: Colors.white, fontSize: 22),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size.fromHeight(50)
                )
            ),
          ),
          TextButton(
              onPressed:(){ Navigator.pushNamed(context,'/inscription');}, child: Text("nouveau compte"))
        ],)
    );
  }


  Future<void> _onAuthentificate(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if (!txt_login.text.isEmpty && !txt_password.text.isEmpty) {
      String ?login=prefs.getString("login");
      String ?password=prefs.getString("password");
      prefs.setBool("connecte", true);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    }

    else {
      const snackBar = SnackBar(

        content: Text('Id ou mot de passe vides'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    if (txt_login==login && txt_password==password)
    {
      prefs.setBool("connecte", true);
      Navigator.pop(context);
    }
    else
      {
        const snackBar = SnackBar(
          content: Text('Identifiant ou mot de passe incorrect'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

  }
  
}
