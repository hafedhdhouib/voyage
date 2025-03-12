import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer_widget.dart';
import 'package:voyage/pages/meteo_details_page.dart';

class MeteoPage extends StatelessWidget {
  TextEditingController txt_ville = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDeawer(),
      appBar: AppBar(
        title: Text("Page Meteo"),
        backgroundColor: Colors.blue,
      ),
      body: Column(

        children:[TextFormField(
          controller: txt_ville,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.pageview),
              hintText: "ville",
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10)
              )
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  _onGetMeteoDetails(context);
                },
                child: Text("Rechercher",
                  style: TextStyle(color: Colors.white, fontSize: 22),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size.fromHeight(50)
                )
            ),
          ),
        ]

      ),
    );

  }
  void _onGetMeteoDetails(BuildContext context)
  {
    String v=txt_ville.text;
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context)=>MeteoPageDetails(v)));
    txt_ville.text="";
  }
}
