import 'package:flutter/material.dart';

import './page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentProfilePic = "http://i64.tinypic.com/bgr91z.png";
  String otherProfilePic =
      "https://www.vmsinc.com/wp-content/uploads/2015/05/VMS-P168-Put-Trash-in-Can.png";

  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Menu Principal"),
          backgroundColor: Colors.blueAccent,
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountEmail: new Text("cesarbaez100@gmail.com"),
                accountName: new Text("César"),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(currentProfilePic),
                  ),
                  onTap: () => print("Esta es tu cuenta Actual."),
                ),
                otherAccountsPictures: <Widget>[
                  new GestureDetector(
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(otherProfilePic),
                    ),
                    onTap: () => switchAccounts(),
                  ),
                ],
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage(
                            "https://pbs.twimg.com/profile_banners/26569475/1515246269/1500x500"),
                        fit: BoxFit.fill)),
              ),
              new ListTile(
                  title: new Text("Crear Reportes"),
                  trailing: new Icon(Icons.create_new_folder),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new Page("Crear Reportes")));
                  }),
              new ListTile(
                  title: new Text("Ver mis Reportes"),
                  trailing: new Icon(Icons.library_books),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new Page("Reportes")));
                  }),
              new ListTile(
                  title: new Text("Cuenta"),
                  trailing: new Icon(Icons.person_outline),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Page("Cuenta")));
                  }),
              new ListTile(
                title: new Text("Configuración"),
                trailing: new Icon(Icons.settings),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new Page("Configuración")));
                },
              ),
              new ListTile(
                title: new Text("Contactos"),
                trailing: new Icon(Icons.call),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new Page("Contactos")));
                },
              ),
              new ListTile(
                title: new Text("Cerrar Sesión"),
                trailing: new Icon(Icons.subdirectory_arrow_left),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new Page("Cerrar Sesión")));
                },
              ),
              new Divider(),
              new ListTile(
                title: new Text("Cancelar"),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        body: new Center(
          child: new Text("Trash Report", style: new TextStyle(fontSize: 35.0)),
        ));
  }
}
