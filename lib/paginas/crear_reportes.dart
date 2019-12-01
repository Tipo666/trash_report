import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:location/location.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';

import 'package:trash_report/paginas/dialogs.dart';

class CrearReportes extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CrearReportes> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String caso, mensaje = 'Mensaje';
  Dialogs dialogs = new Dialogs();
  File image;

  List<DropdownMenuItem<String>> items = [

    DropdownMenuItem(
      child: Text('Escombro y Obstrucción en la vía pública'),
      value: 'Escombro y Obstrucción en la vía pública',
    ),
    DropdownMenuItem(
      child: Text('Corte irregular de Arboles'),
      value: 'Corte irregular de Arboles',
    ),
    DropdownMenuItem(
      child: Text('Construcción Ilegal'),
      value: 'Construcción Ilegal',
    ),
    DropdownMenuItem(
      child: Text('Rotura ilegal de calle, aceras y contenes'),
      value: 'Rotura ilegal de calle, aceras y contenes',
    ),
    DropdownMenuItem(
      child: Text('Negocios informales'),
      value: 'Negocios informales',
    ),
    DropdownMenuItem(
      child: Text('Publicidad Ilegal'),
      value: 'Publicidad Ilegal',
    ),
    DropdownMenuItem(
      child: Text('Cierre de Calles'),
      value: 'Cierre de Calles',
    ),
    DropdownMenuItem(
      child: Text('Residuo Sólidos y Vertedero Improvisados'),
      value: 'Residuo Sólidos y Vertedero Improvisados',
    ),
  ];



  picker() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      //uploadFile();

      setState(() {
        image = img;
        print(image);
      });
    }
  }

  pickerGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  String _path;
  File _cachedFile;

  Future<Null> uploadFile() async {
    //final ByteData bytes = await rootBundle.load(filepath); //Ojo

    final Directory tempDir = Directory.systemTemp;

    final String fileName = "${Random().nextInt(10000)}.jpg";

    final File file = image; //File('${tempDir.path}/$fileName');

    //file.writeAsBytes(bytes.buffer.asInt8List(), mode: FileMode.write);

    final StorageReference ref = FirebaseStorage.instance.ref().child(fileName);

    final StorageUploadTask task = ref.putFile(file);

    final Uri downloadUrl = (await task.future).downloadUrl;

    _path = downloadUrl.toString();

    //print(_path);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Reportes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: _key,
            autovalidate: _autovalidate,
            child: formUI(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: picker,
        tooltip: "Abrir cámara",
        child: Icon(Icons.camera_alt),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Widget formUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 10.0),
            DropdownButtonHideUnderline(
                child: DropdownButton(
              items: items,
              hint: Text('Tipo de caso'),
              value: caso,
              onChanged: (String val) {
                setState(() {
                  caso = val;
                });
              },
            ))
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: 'Por favor introduzca la información del reporte'),
          onSaved: (val) {
            mensaje = val + ' ';
          },
          validator: validateMessage,
          maxLines: 5,
          maxLength: 256,
        ),
        Container(
          child: Center(
            child: image == null
                ? Image.asset('imagenes/placeholder.png',
                    width: 350.0, height: 350.0)
                : Image.file(image),
          ),
        ),
        Center(
          child: FlatButton(
            onPressed: () {
              String cas = 'Caso', foto = 'Foto';

              if (caso != null && image != null) {
                confirm(context, 'Confirmación',
                    'Desea enviar el reporte? Recuerde siempre escribir la información del reporte para ser atendido más rápidamente.');
              } else {
                if (caso != null) {
                  cas = '';
                }
                if (image != null) {
                  foto = '';
                }

                information(context, 'Advertencia',
                    'Le falta elegir: \n\n$cas\n $foto');
              }
            },

            //_sendToServer,

            child: Text('Enviar'),
            color: Colors.blueAccent,
            textColor: Colors.white,
            splashColor: Colors.redAccent,
            padding: EdgeInsets.all(20.0),
          ),
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: Text(
                  "Escombro y Obstrucción en la vía pública",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                    "Consiste en denuncias realizadas por ciudadanos cuando en la vía pública existe escombro de construcciones y limpieza de propiedades que obstruye el paso del peatón."),
              ),
              Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: Text(
                  "Corte irregular de Arboles",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                    'Denuncias de Ciudadanos sobre corte de arboles en patios de residencias o Edenorte, puede ser también arboles tumbado por el viento y que obstruyen la vía publica. Cortar árboles y sacarlo a las calzadas sin autorización está prohibido.'),
              ),
              Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: Text(
                  "Construcción Ilegal",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                    'Consiste en construcciones que se levantan en zonas urbanas y rurales y que no han realizado los trámites correspondientes en el departamento de planeamiento urbano.'),
              ),
              Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: Text(
                  "Rotura ilegal de calle, aceras y contenes",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                    'Denuncias sobre rotura de calles, aceras y contenes no autorizada por el departamento de planeamiento urbano para realizar conexiones ilegales de agua y cloacas.'),
              ),
              Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: Text(
                  "Negocios informales",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                    'Instalación de negocios irregulares, instalaciones de tarantines, carros para venta de comida rápida no autorizada por el ayuntamiento de La Vega. '),
              ),
              Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: Text(
                  "Publicidad Ilegal",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                    'Instalación de publicidad no autorizada, publicidad móvil, instalación de Vallas.'),
              ),
              Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: Text(
                  "Cierre de Calles",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                    'Denuncias de cierre de calles no autorizadas para el vaciado de plato, actividades recreativas.'),
              ),
              Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: Text(
                  "Residuo Sólidos y Vertedero Improvisados",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                    'Consiste en sacar los desechos sólidos en horarios no establecidos y Permitir Vertedero Improvisados. Sacar la basura en horarios fuera de lugar y ser sorprendidos realizando vertederos improvisados serán sometidos al tribunal municipal.'),
              ),
              Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  confirmResult(bool isYes, BuildContext context) {
    if (isYes) {
      print('Yes action');
      Navigator.pop(context);
      _sendToServer();
    } else {
      print('Cancel action');
      Navigator.pop(context);
    }
  }

  confirm(BuildContext context, String title, String description) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text(description)],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => confirmResult(false, context),
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () => confirmResult(true, context),
                child: Text('Si'),
              )
            ],
          );
        });
  }

  information(BuildContext context, String title, String description) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text(description)],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              )
            ],
          );
        });
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      DatabaseReference ref = FirebaseDatabase.instance.reference();

      var data = {
        "caso": caso,
        "mensaje": mensaje,
      };

      ref.child('Casos').push().set(data).then((v) {
        _key.currentState.reset();
      });

      if (image != null) uploadFile();
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
    Navigator.of(context).pop();
    information(
        context, 'Enviado', 'Su reporte ha sido enviado correctamente.');
  }

  String validateName(String val) {
    return val.length == 0 ? "Elige el Caso primero" : null;
  }

  String validateMessage(String val) {
    return val.length == 0 ? "Ingresa el mensaje primero" : null;
  }
}
