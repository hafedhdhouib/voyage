import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:voyage/menu/drawer_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

class MeteoPageDetails extends StatefulWidget {
  final String ville;
  MeteoPageDetails(this.ville);

  @override
  State<MeteoPageDetails> createState() => _MeteoPageDetailsState();
}

class _MeteoPageDetailsState extends State<MeteoPageDetails> {
  var meteoData;

  @override
  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  Future<void> getMeteoData(String ville) async {
    String url = "https://api.openweathermap.org/data/2.5/forecast?q=${ville}&appid=c109c07bc4df77a88c923e6407aef864";

    try {
      final res = await http.get(Uri.parse(url));
      setState(() {
        meteoData = json.decode(res.body);
      });
    } catch (err) {
      print("Error fetching meteo data: $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDeawer(),
      appBar: AppBar(
        title: Text('Météo - ${widget.ville}', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: meteoData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: meteoData['list'].length,
          itemBuilder: (context, index) {
            var weather = meteoData['list'][index]['weather'][0];
            var temp = meteoData['list'][index]['main']['temp'] - 273.15;
            var date = DateTime.fromMillisecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000);

            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                            "image/${meteoData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png"
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            DateFormat('E dd/MM/yyyy').format(date),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            DateFormat('HH:mm').format(date),
                            style: TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                          SizedBox(height: 10),
                          Text(
                            weather['description'],
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),

                      Text(
                        "${temp.toStringAsFixed(1)} °C",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}