import 'package:flutter/material.dart';

class VerReportes extends StatefulWidget {
  @override
  _VerReportesState createState() => _VerReportesState();
}

class _VerReportesState extends State<VerReportes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Ver Reportes"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: new ListView(
          children: <Widget>[
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: const Icon(
                      Icons.album,
                      color: Colors.yellowAccent,
                    ),
                    title: const Text('Cúmulo de basura'),
                    subtitle: const Text('En proceso'),
                  ),
                  new ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: new ButtonBar(
                      children: <Widget>[
                        new FlatButton(
                          child: const Text('DETALLE'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {/* ... */},
                        ),
                        new FlatButton(
                          child: const Text('ARCHIVAR'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: const Icon(
                      Icons.album,
                      color: Colors.greenAccent,
                    ),
                    title: const Text('Valla ilegal'),
                    subtitle: const Text('Terminada'),
                  ),
                  new ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: new ButtonBar(
                      children: <Widget>[
                        new FlatButton(
                          child: const Text('DETALLE'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {/* ... */},
                        ),
                        new FlatButton(
                          child: const Text('ARCHIVAR'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: const Icon(
                      Icons.album,
                      color: Colors.redAccent,
                    ),
                    title: const Text('Construcción ilegal'),
                    subtitle: const Text('No vista'),
                  ),
                  new ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: new ButtonBar(
                      children: <Widget>[
                        new FlatButton(
                          child: const Text('DETALLE'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {/* ... */},
                        ),
                        new FlatButton(
                          child: const Text('ARCHIVAR'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
