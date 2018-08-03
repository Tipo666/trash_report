import 'package:flutter/material.dart';

class Noticias extends StatefulWidget {
  @override
  _NoticiasState createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Noticias"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.network(
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
                  subtitle: const Text(
                      '¿Qué es el Programa Dominicana Limpia?\n'
                      '\nEs la política nacional de manejo integral de los residuos sólidos en los municipios de la República Dominicana en cuanto a la recolección, manejo y destino final de los mismos.\n'
                      '\nComponentes\n'
                      '\nEl Programa Dominicana Limpia incluye 5 principales componentes:\n'
                      '\n1. Recolección de residuos sólidos separados en fuente.\n'
                      '\n2. Entrega de Equipamiento.\n'
                      '\n3. Promoción de la Educación ciudadana.\n'
                      '\n4. Capacitación del personal de los ayuntamientos.\n'
                      '\n5. Puntos limpios y Reciclaje.\n'),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.network(
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
                  subtitle: const Text(
                      '\n\nLa Vega.- Con el desfile de niños iniciando desde la parte frontal de la plaza Duarte con 6,000 niños y niñas el alcalde Vegano Ing. Kelvin Cruz dejó inaugurado la segunda Olimpiadas Infantiles Municipales que durante 10 días accionarán en 90 comunidades dividido en 19 núcleos.'),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.network(
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
                  subtitle: const Text(
                      '\n\nGUACO LOS FRÍAS, LA VEGA:\n\n Cumpliendo con las obras consignadas en el Presupuesto Participativo, el Alcalde Ing. Kelvin Cruz, entregó una moderna Casa Club en La Comunidad de Guaco Los Frías en este municipio, obra soñada por los moradores de aquí desde hace muchos años, en la noche de este Lunes abarrotaron por completo lo que será su nuevo espacio para reuniones y eventos.'),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.network(
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
                  subtitle: const Text(
                      '\nEl Ayuntamiento del Municipio de La Vega reconoció el mérito educativo de onces destacados profesores, durante un acto efectuado en la Sala de Sesiones Don Mario Concepción y que fue presidido por el alcalde Kelvin Cruz.\n'
                      '\nLos educadores con más de 40 años cada uno en el Magisterio Nacional, fueron elegidos a unanimidad por el concejo de Regidores que preside el arquitecto Vladimir Viloria quien pronuncio las palabras de bienvenidas del acto.\n'
                      '\nLa felicitación a los reconocidos estuvo a cargo del licenciado Pablo Rosario, presidente de la Asociación Dominicana de Profesores filial La Vega.\n'),
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
    );
  }
}
