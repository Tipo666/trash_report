import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CrearReportes extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CrearReportes> {
  Caso casoSeleccionado;
  List<Caso> casos = <Caso>[
    const Caso('Venta ilegal'),
    const Caso('Cúmulo de basura'),
    const Caso('Tala ilegal de árboles'),
    const Caso('Escombros de construcción'),
    const Caso('Obstrucción de Vías'),
    const Caso('Valla ilegal')
  ];
  File image;

//  To use Gallery or File Manager to pick Image
//  Comment Line No. 19 and uncomment Line number 20
  picker() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);

    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  pickerGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Crear Reportes'),
        centerTitle: true,
      ),
      body: new Container(
        child: ListView(
          children: <Widget>[
            new DropdownButton<Caso>(
              hint: new Text("Selecciona el tipo de caso"),
              value: casoSeleccionado,
              onChanged: (Caso nuevoValor) {
                setState(() {
                  casoSeleccionado = nuevoValor;
                });
              },
              items: casos.map((Caso caso) {
                return new DropdownMenuItem<Caso>(
                  value: caso,
                  child: new Text(
                    caso.nombre,
                    style: new TextStyle(color: Colors.black87),
                  ),
                );
              }).toList(),
            ),
            new TextField(
              autocorrect: true,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Por favor introduzca la información del reporte.'),
            ),
            new Container(
              child: new Center(
                child: image == null
                    ? new Text('Presione el botón para tomar la foto')
                    : new Image.file(image),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: picker,
        tooltip: "Abrir cámara",
        child: new Icon(Icons.camera_alt),
      ),
    );
  }
}

class Caso {
  const Caso(this.nombre);

  final String nombre;
}
