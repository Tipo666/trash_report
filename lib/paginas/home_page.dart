import 'package:flutter/material.dart';
import 'package:trash_report/paginas/auth.dart';

import 'package:trash_report/paginas/crear_reportes.dart';
import 'package:trash_report/paginas/cuenta.dart';
import 'package:trash_report/paginas/ver_reportes.dart';

import './page.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;

  String currentProfilePic = "http://i64.tinypic.com/bgr91z.png";
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    void _signOut() async {
      try {
        await auth.signOut();
        onSignOut();
      } catch (e) {
        print(e);
      }
    }

    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Menu"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountEmail: new Text("cesarbaez100@gmail.com"),
              accountName: new Text("César"),
              currentAccountPicture: new GestureDetector(

                  // onTap: () => print("Esta es tu cuenta Actual."),
                  ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          "https://pbs.twimg.com/profile_banners/26569475/1515246269/1500x500"),
                      fit: BoxFit.fill)),
            ),
            new ListTile(
                title: new Text("Crear Reportes"),
                //subtitle: new Text("En construcción"),
                trailing:
                    new Icon(Icons.create_new_folder, color: Colors.blueAccent),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new CrearReportes()));
                }),
            new ListTile(
                title: new Text("Ver mis Reportes"),
                //subtitle: new Text("En construcción"),
                trailing:
                    new Icon(Icons.library_books, color: Colors.blueAccent),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new VerReportes()));
                }),
            new ListTile(
                title: new Text("Métricas"),
                subtitle: new Text("En construcción"),
                trailing:
                    new Icon(Icons.insert_chart, color: Colors.blueAccent),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Page("Métricas")));
                }),
            new ListTile(
                title: new Text("Noticias"),
                subtitle: new Text("En construcción"),
                //isThreeLine: true,
                //dense: true,
                // leading: const Icon(Icons.feedback),
                trailing: new Icon(Icons.feedback, color: Colors.blueAccent),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Page("Noticias")));
                }),
            new ListTile(
                title: new Text("Cuenta"),
                subtitle: new Text("En construcción"),
                trailing:
                    new Icon(Icons.person_outline, color: Colors.blueAccent),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Page('Cuenta')));
                }),
            new ListTile(
              title: new Text("Configuración"),
              subtitle: new Text("En construcción"),
              trailing: new Icon(Icons.settings, color: Colors.blueAccent),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new Page("Configuración")));
              },
            ),
            new ListTile(
              title: new Text("Contactos"),
              subtitle: new Text("En construcción"),
              trailing: new Icon(Icons.contact_phone, color: Colors.blueAccent),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Page("Contactos")));
              },
            ),
            new ListTile(
              title: new Text("Cerrar Sesión"),
              //  subtitle: new Text("En construcción"),
              trailing: new Icon(
                Icons.subdirectory_arrow_left,
                color: Colors.blueAccent,
              ),
              onTap: _signOut,
            ),
            new Divider(),
            new ListTile(
              title: new Text("Cancelar"),
              trailing: new Icon(Icons.cancel, color: Colors.blueAccent),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.asset(
                  'imagenes/baden.jpg',
                  width: 350.0,
                  height: 50.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.featured_video,
                    color: Colors.blueAccent,
                  ),
                  title: const Text('Alcaldía Vegana nuevo Baden'),
                  subtitle: const Text(
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.asset(
                  'imagenes/baden.jpg',
                  width: 350.0,
                  height: 50.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.featured_video,
                    color: Colors.blueAccent,
                  ),
                  title: const Text('Alcaldía Vegana nuevo Baden'),
                  subtitle: const Text(
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.asset(
                  'imagenes/baden.jpg',
                  width: 350.0,
                  height: 50.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.featured_video,
                    color: Colors.blueAccent,
                  ),
                  title: const Text('Alcaldía Vegana nuevo Baden'),
                  subtitle: const Text(
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.asset(
                  'imagenes/baden.jpg',
                  width: 350.0,
                  height: 50.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.featured_video,
                    color: Colors.blueAccent,
                  ),
                  title: const Text('Alcaldía Vegana nuevo Baden'),
                  subtitle: const Text(
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.asset(
                  'imagenes/baden.jpg',
                  width: 350.0,
                  height: 50.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.featured_video,
                    color: Colors.blueAccent,
                  ),
                  title: const Text('Alcaldía Vegana nuevo Baden'),
                  subtitle: const Text(
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.asset(
                  'imagenes/baden.jpg',
                  width: 350.0,
                  height: 50.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.featured_video,
                    color: Colors.blueAccent,
                  ),
                  title: const Text('Alcaldía Vegana nuevo Baden'),
                  subtitle: const Text(
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.asset(
                  'imagenes/baden.jpg',
                  width: 350.0,
                  height: 50.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.featured_video,
                    color: Colors.blueAccent,
                  ),
                  title: const Text('Alcaldía Vegana nuevo Baden'),
                  subtitle: const Text(
                      'Ya se encuentra en funcionamiento el nuevo baden en el sector Altos de Chavón '),
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
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
        child: new Icon(Icons.arrow_forward),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
