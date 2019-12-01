import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:trash_report/paginas/myData.dart';

class VerReportes extends StatefulWidget {
  @override
  _VerReportesState createState() => _VerReportesState();
}

class _VerReportesState extends State<VerReportes> {
  List<MyData> allData = [];

  //Sobreescribimos initState para que inicie y cree la instancia de Firebase antes que la vista inicie
  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('Casos').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();


      //Recorre la listas de casos y mensajes para agregarlas
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
        appBar: AppBar(
          title: Text("Ver Reportes"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            child: allData.length == 0
            //Para presentar el indicador de progreso antes de mostrar los datos
                ? Center(child: CircularProgressIndicator(),)
            //Crea el listView en base a la cantidad de reportes que haya en Firebase
                : ListView.builder(
                    itemCount: allData.length,
                    itemBuilder: (_, index) {
                      return uI(
                        allData[index].caso,
                        allData[index].mensaje,
                      );
                    },
                  )));
  }

  //Meteodo que muestra los casos en un Card, alimenta al listView Builder
  Widget uI(String caso, String mensaje) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Caso : $caso',
              style: Theme.of(context).textTheme.title,
            ),
            Text('mensaje : $mensaje'),
            Row(children: <Widget>[
              Icon(Icons.brightness_1, color: Colors.red,),
              Icon(Icons.brightness_1, color: Colors.yellow,),
              Icon(Icons.brightness_1, color: Colors.green,)
            ],),
          ],
        ),
      ),
    );
  }
}
