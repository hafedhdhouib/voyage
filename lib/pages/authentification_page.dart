import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page d'authentification"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Identifinat',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10))),
              controller: txt_login,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10))),
              controller: txt_password,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _onAuthentification(context);
              },
              child: Text(
                'connexion',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size.fromHeight(50)),
            ),
          ),
          TextButton(onPressed: ()=>{
            Navigator.pushNamed(context, '/inscription')

          }, child: Text("Nouvelle connection"))
        ],
      ),
    );
  }

  Future<void> _onAuthentification(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if (!txt_login.text.isEmpty && !txt_password.text.isEmpty) {
       String? login = prefs.getString("login");
       String? password = prefs.getString("password");

       if ( login == txt_login.text && password == txt_password.text ){
         prefs.setBool("connecte", true);
         Navigator.pop(context);
         Navigator.pushNamed(context, '/home');
       }
       else {
         print(password);
         const snackbar = SnackBar(content: Text("Id ou mot de passe incorreect"));
         ScaffoldMessenger.of(context).showSnackBar(snackbar);

       }
    }
    else
      {
        print('object');
        const snackbar = SnackBar(content: Text("Id ou mot de passe sont required"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);

      }
  }
}
