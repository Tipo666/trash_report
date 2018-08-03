import 'package:flutter/material.dart';

class Contactos extends StatefulWidget {
  @override
  _ContactosState createState() => _ContactosState();
}

class _ContactosState extends State<Contactos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Contactos"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.asset(
                  'imagenes/Alcaldia.png',
                  width: 400.0,
                  height: 250.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.contacts,
                    color: Colors.blueAccent,
                  ),
                  title: const Text(
                    'Dirección y Contactos',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  subtitle: const Text(
                    '\nC/ Don Antonio Guzmán # 419, Frente al Parque Duarte, Concepción de La Vega, La Vega, R.D.\n'
                        '\nTel.: (809) 242-2000\n'
                        '\nContacto: alcaldiadelavega@gmail.com',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          new Image.asset(
            'imagenes/localizacion.png',
            width: 300.0,
            height: 350.0,
            fit: BoxFit.fill,
            alignment: Alignment.topLeft,
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
