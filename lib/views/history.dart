import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mps/views/visualizeparking.dart';

import 'mainpageuser.dart';

//Class to show list of favorite parkings
class HistoryList extends StatefulWidget {
  final List<DocumentSnapshot> lista;
  HistoryList({Key key, @required this.lista}) : super(key: key);
  @override
  _HistoryList createState() => _HistoryList(lista: lista);
}

class _HistoryList extends State<HistoryList> {
  String value;
  List<DocumentSnapshot> lista;
  _HistoryList({this.lista});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainPageUser())),
        ),
        backgroundColor: Colors.blue[900],
        title: Text("Visited Parkings"),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: [
            Container(
              color: Colors.blue[900],
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
              child: Text(
                "Parqueaderos Visitados",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            new GestureDetector(
              child: new ListView.builder(
                shrinkWrap: true,
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot course = lista[index];
                  return new ListTile(
                    leading: Image.network(course['imagen'][0]),
                    title: Text(course['nombre']),
                    subtitle: Text(course['direccion']),
                    onTap: () {
                      value = course.reference.id;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisualizeParking(value, course),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
