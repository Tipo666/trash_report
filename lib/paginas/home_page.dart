import 'package:flutter/material.dart';
import 'package:trash_report/paginas/auth.dart';
import 'package:trash_report/paginas/contactos.dart';
import 'package:trash_report/paginas/crear_reportes.dart';
import 'package:trash_report/paginas/cuenta.dart';
import 'package:trash_report/paginas/noticias.dart';
import 'package:trash_report/paginas/reciclaje.dart';
import 'package:trash_report/paginas/sobre_aplicacion.dart';
import 'package:trash_report/paginas/ver_reportes.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;
  double _width = 350.0;
  double _height = 150.0;

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

    Card metodoCard(
      Text title,
      Icon icon,
      String source,
      double width,
      double height,
      BoxFit boxFit,
      Alignment alignment,
    ) {
      return Card(
        child: Column(
          children: <Widget>[
            Image.network(
              source,
              width: width,
              height: height,
              fit: boxFit,
              alignment: alignment,
            ),
            ListTile(
              leading: icon,
              title: title,
            ),
          ],
        ),
      );
    }

    Column columnMetodo() {
      return Column();
    }

    ListTile metodoListile(Text titulo, Icon icon, navegacion) {
      return ListTile(
        title: titulo,
        trailing: icon,
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => navegacion));
        },
      );
    }

    return Scaffold(

      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(
                  "http://ayuntamientolavega.gob.do/wp-content/uploads/slider1/slider-dominicana-limpia-700x394.png",
                  width: 350.0,
                  height: 150.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.new_releases,
                    color: Colors.blueAccent,
                  ),
                  title: const Text('Dominicana Limpia'),

                ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(
                  "http://ayuntamientolavega.gob.do/wp-content/uploads/2018/07/37030222_2097234860499589_9053247506086887424_n.jpg",
                  width: 350.0,
                  height: 150.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.new_releases,
                    color: Colors.blueAccent,
                  ),
                  title: const Text(
                      'ALCALDE VEGANO ING. KELVIN CRUZ DEJA INAUGURADA LAS 2DA OLIMPIADAS INFANTILES MUNICIPALES'),
                   ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(
                  "http://ayuntamientolavega.gob.do/wp-content/uploads/2018/07/36840926_2093764114179997_449473593156304896_n.jpg",
                  width: 350.0,
                  height: 150.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.new_releases,
                    color: Colors.blueAccent,
                  ),
                  title: const Text(
                      'ALCALDE ING. KELVIN CRUZ ENTREGA MODERNO CLUB COMUNITARIO EN GUACO LOS FRÍAS.'),
                  ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(
                  "http://ayuntamientolavega.gob.do/wp-content/uploads/2018/07/36367623_2083134678576274_5138438958140620800_n.jpg",
                  width: 350.0,
                  height: 150.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.new_releases,
                    color: Colors.blueAccent,
                  ),
                  title: const Text(
                      'ALCALDÍA DE LA VEGA RECONOCE A MAESTROS MERITORIOS.\n\n'),
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
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(""),
              accountName: Text(""),
              currentAccountPicture: GestureDetector(

                  // onTap: () => print("Esta es tu cuenta Actual."),
                  ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://pbs.twimg.com/profile_banners/26569475/1515246269/1500x500"),
                      fit: BoxFit.fill)),
            ),

            //////////////////////////////////////////////

            metodoListile(
                Text("Crear Reportes"),
                Icon(
                  Icons.create_new_folder,
                  color: Colors.blueAccent,
                ),
                CrearReportes()),
            metodoListile(
                Text("Ver mis Reportes"),
                Icon(
                  Icons.view_list,
                  color: Colors.blueAccent,
                ),
                VerReportes()),
            metodoListile(
                Text("Noticias"),
                Icon(
                  Icons.feedback,
                  color: Colors.blueAccent,
                ),
                Noticias()),
            metodoListile(
                Text("Cuenta"),
                Icon(
                  Icons.person_outline,
                  color: Colors.blueAccent,
                ),
                Cuenta()),
            metodoListile(
                Text("Reciclaje"),
                Icon(
                  Icons.all_inclusive,
                  color: Colors.blueAccent,
                ),
                Reciclaje()),
            metodoListile(
                Text("Contactos"),
                Icon(
                  Icons.contact_phone,
                  color: Colors.blueAccent,
                ),
                Contactos()),

            Divider(),

            metodoListile(
                Text("Sobre la aplicación"),
                Icon(
                  Icons.perm_device_information,
                  color: Colors.blueAccent,
                ),
                SobreAplicacion()),

            ListTile(
              title: new Text("Cerrar Sesión"),
              //  subtitle: new Text("En construcción"),
              trailing: new Icon(
                Icons.subdirectory_arrow_left,
                color: Colors.blueAccent,
              ),
              onTap: _signOut,
            ),

            ListTile(
              title: Text("Cancelar"),
              trailing: Icon(Icons.cancel, color: Colors.blueAccent),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
        child: Icon(Icons.arrow_forward),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
  /*
  void irANoticias(){
    Navigator.of(context).pop();
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new VerReportes()));

  }*/
}
