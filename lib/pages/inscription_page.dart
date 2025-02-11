import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page d'inscription"),
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
            child: ElevatedButton(onPressed: (){
              _onIscrit(context);
            }

            , child: Text('data',style: TextStyle(fontSize: 24),),style:ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size.fromHeight(50)
            ) ,),
          )
        ],
      ),
    );
  }

  Future<void> _onIscrit(BuildContext context) async{
     prefs=await SharedPreferences.getInstance();
     if(!txt_login.text.isEmpty && !txt_password.text.isEmpty){
       prefs.setString("login", txt_login.text);
       prefs.setString("password", txt_password.text);
       prefs.setBool("connect", true);
       Navigator.pop(context);
       Navigator.pushNamed(context, '/home');
     }
     else
       {
         const snackbar = SnackBar(content: Text("Id ou mot de passe incorreect"));

       }
  }
}
