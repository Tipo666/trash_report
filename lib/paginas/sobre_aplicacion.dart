import 'package:flutter/material.dart';

class SobreAplicacion extends StatefulWidget {
  @override
  _SobreAplicacionState createState() => _SobreAplicacionState();
}

class _SobreAplicacionState extends State<SobreAplicacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre la Aplicación"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                 ListTile(
                  leading: Icon(
                    Icons.account_box,
                    color: Colors.blue,
                    size: 26.0,
                  ),
                  title: Text(
                    "César Báez\nErnesto Ledesma\nAlejandro Rojas",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text("Ingenieros en  Sistemas y Computación"),
                ),
                 Divider(
                  color: Colors.blue,
                  indent: 16.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.blue,
                    size: 26.0,
                  ),
                  title: Text(
                    "cesarbaez100@gmail.com",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                 Divider(
                  color: Colors.blue,
                  indent: 16.0,
                ),

              ],
            ),
          ),

          Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                 ListTile(
                  leading: new Icon(
                    Icons.account_box,
                    color: Colors.blue,
                    size: 26.0,
                  ),
                  title: new Text(
                    "Información",
                    style: new TextStyle(fontWeight: FontWeight.w400),
                  ),
                  subtitle: new Text("Esta aplicación fue desarrollada usando el Framework UI Flutter, el Lenguaje Dart, el IDE Visual Studio y el BackEnd Firebase. Todos pertenecientes a Google Inc. "),
                ),
                Divider(
                  color: Colors.blue,
                  indent: 16.0,
                ),
              ],
            ),
          ),


          /*new Image.asset(
            'imagenes/calle.jpg',
            width: 490.0,
            height: 1200.0,
            fit: BoxFit.fill,
          ),*/
        ],
      ),
    );
  }
}
