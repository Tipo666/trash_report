import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:trash_report/paginas/myData.dart';

class VerReportes extends StatefulWidget {
  @override
  _VerReportesState createState() => _VerReportesState();
}

class _VerReportesState extends State<VerReportes> {
  List<MyData> allData = [];

  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('Casos').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();

      for (var key in keys) {
        MyData d = new MyData(
          data[key]['caso'],
          data[key]['mensaje'],
        );
        allData.add(d);
      }
      setState(() {
        print('Length : ${allData.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Ver Reportes"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: new Container(
            child: allData.length == 0
                ? new Text('No hay datos disponibles')
                : new ListView.builder(
                    itemCount: allData.length,
                    itemBuilder: (_, index) {
                      return UI(
                        allData[index].caso,
                        allData[index].mensaje,
                      );
                    },
                  )));
  }

  Widget UI(String caso, String mensaje) {
    return new Card(
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              'Caso : $caso',
              style: Theme.of(context).textTheme.title,
            ),
            new Text('mensaje : $mensaje'),
          ],
        ),
      ),
    );
  }
}
