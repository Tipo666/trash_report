import 'package:flutter/material.dart';

class SobreAplicacion extends StatefulWidget {
  @override
  _SobreAplicacionState createState() => _SobreAplicacionState();
}

class _SobreAplicacionState extends State<SobreAplicacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Sobre la Aplicación"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  leading: new Icon(
                    Icons.account_box,
                    color: Colors.blue,
                    size: 26.0,
                  ),
                  title: new Text(
                    "Anlly Polonia",
                    style: new TextStyle(fontWeight: FontWeight.w400),
                  ),
                  subtitle: new Text("Ingeniera en  Sistemas y Computación"),
                ),
                new Divider(
                  color: Colors.blue,
                  indent: 16.0,
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.email,
                    color: Colors.blue,
                    size: 26.0,
                  ),
                  title: new Text(
                    "anllypolonializ@gmail.com",
                    style: new TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                new Divider(
                  color: Colors.blue,
                  indent: 16.0,
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.phone,
                    color: Colors.blue,
                    size: 26.0,
                  ),
                  title: new Text(
                    "829-497-1061",
                    style: new TextStyle(fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  leading: new Icon(
                    Icons.account_box,
                    color: Colors.blue,
                    size: 26.0,
                  ),
                  title: new Text(
                    "César Báez",
                    style: new TextStyle(fontWeight: FontWeight.w400),
                  ),
                  subtitle: new Text("Ingeniero en  Sistemas y Computación"),
                ),
                new Divider(
                  color: Colors.blue,
                  indent: 16.0,
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.email,
                    color: Colors.blue,
                    size: 26.0,
                  ),
                  title: new Text(
                    "cesarbaez100@gmail.com",
                    style: new TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                new Divider(
                  color: Colors.blue,
                  indent: 16.0,
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.phone,
                    color: Colors.blue,
                    size: 26.0,
                  ),
                  title: new Text(
                    "809-873-3340",
                    style: new TextStyle(fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),

          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
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
                new Divider(
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
