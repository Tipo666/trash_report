import 'package:flutter/material.dart';

class Reciclaje extends StatefulWidget {
  @override
  _ReciclajeState createState() => _ReciclajeState();
}

class _ReciclajeState extends State<Reciclaje> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Información de Reciclaje"),
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
                  "https://1.bp.blogspot.com/-gq1aaG2GVJo/Wj98OBVmKkI/AAAAAAAAGX8/yDmY_mRIHwE7jMDz-haNn0HDrexf6iNBwCLcBGAs/s1600/contenedores-reciclaje.jpg",
                  width: 390.0,
                  height: 200.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.all_inclusive,
                    color: Colors.blueAccent,
                  ),
                  title: const Text(
                    'Reciclaje\n',
                    style: const TextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: const Text(
                      'El reciclaje es un proceso cuyo objetivo es convertir desechos en nuevos productos o en materia prima para su posterior utilización.\n\n'
                      'Gracias al reciclaje se previene el desuso de materiales potencialmente útiles, se reduce el consumo de nueva materia prima, además de reducir el uso de energía, la contaminación del aire (a través de la incineración) y del agua (a través de los vertederos), así como también disminuir las emisiones de gases de efecto invernadero en comparación con la producción de plásticos.\n\n'
                      'El reciclaje es un componente clave en la reducción de desechos contemporáneos y es el tercer componente de las 3R («Reducir, Reutilizar, y Reciclar »).\n\n'
                      'Los materiales reciclables son muchos, e incluyen todo el papel y cartón, el vidrio, los metales ferrosos y no ferrosos, algunos plásticos, telas y textiles, maderas y componentes electrónicos. En otros casos no es posible llevar a cabo un reciclaje debido a la dificultad técnica o alto coste del proceso, de modo que suele reutilizarse el material o los productos para producir otros materiales y se destinan a otras finalidades, como el aprovechamiento energético.\n\n'
                      'También es posible realizar un salvamento de componentes de ciertos productos complejos, ya sea por su valor intrínseco o por su naturaleza peligrosa.\n\n'
                      ''),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.network(
                  "http://www.limasa3.es/sites/default/files/imagecache/imagen_destacada/cadena_reciclado_g.gif",
                  width: 390.0,
                  height: 200.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.all_inclusive,
                    color: Colors.blueAccent,
                  ),
                  title: const Text(
                    'Cadena de reciclaje\n',
                    style: const TextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: const Text(
                      'Recuperación o recogida: que puede ser realizada por empresas públicas o privadas. Consiste únicamente en la recolección y transporte de los residuos hacia el siguiente eslabón de la cadena. Se utilizan contenedores urbanos de recogida selectiva (contenedores amarillo, verde, azul, gris y marrón).\n\n'
                      'Plantas de transferencia: se trata de un eslabón o voluntario que no siempre se usa. Aquí se mezclan los residuos para realizar transportes mayores a menor costo (usando contenedores más grandes o compactadores más potentes).\n\n'
                      'Plantas de clasificación (o separación): donde se clasifican los residuos y se separan los valorizables. Residuos que sí pueden reciclarse de los que no. La fracción que no puede reciclarse se lleva a aprovechamiento energético o a vertederos.\n\n'
                      'Reciclador final (o planta de valoración): donde finalmente los residuos se reciclan (papeleras, plastiqueros, etc.), se almacenan (vertederos) o se usan para producción de energía (cementeras, biogás, etc.).\n\n'),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.network(
                  "https://image.freepik.com/vector-gratis/coleccion-de-disenos-de-contaminacion_1284-868.jpg",
                  width: 390.0,
                  height: 200.0,
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                const ListTile(
                  leading: const Icon(
                    Icons.all_inclusive,
                    color: Colors.blueAccent,
                  ),
                  title: const Text(
                    'Vectores Contaminantes\n',
                    style: const TextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: const Text(
                      'Para hablar sobre el reciclaje es importante conocer sobre cuales son los vectores contaminantes en los cuales debemos tener conciencia para al igual cuidar y acabar con la contaminación mundial. De los cuales nos referimos:\n\n'
                      'Aire:\n\nEn donde se acumula todos los olores y los contaminantes de las fábricas, el tráfico y entre otras cosas.\n\n'
                      'Agua:\n\nEn donde la sociedad contamina con más frecuencia ya que ahí, la sociedad es causante por tirar sus residuos, tirar productos contaminantes y hacer sus trabajos de industria..\n\n'
                      'Utilización de la energía:\n\nEn los cuales conforme va creciendo la sociedad se van generando fabricaciones de cualquier tipo de los cuales contaminan el medio ambiente.\n\n'),
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
