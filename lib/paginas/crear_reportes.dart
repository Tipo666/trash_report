import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';
import 'dart:typed_data';

import 'package:trash_report/paginas/dialogs.dart';

class CrearReportes extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

/*
* Future<String>photoOption() async {
try {
  DateTime now = new DateTime.now();
  var datestamp = new DateFormat("yyyyMMdd'T'HHmmss");
  String currentdate = datestamp.format(now);
  File imageFile = await ImagePicker.pickImage();


  StorageReference ref = FirebaseStorage.instance
      .ref()
      .child("images")
      .child("$currentdate.jpg");
  StorageUploadTask uploadTask = ref.put(imageFile);

  Uri downloadUrl = (await uploadTask.future).downloadUrl;
  addUser.downloadablelink = downloadUrl.toString();

    downloadableUrl = downloadUrl.toString();

 print(downloadableUrl);
} catch (error) {print(error);}
 return downloadableUrl;

}
*
* */

class _CameraAppState extends State<CrearReportes> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String caso, mensaje = 'Mensaje';
  Dialogs dialogs = new Dialogs();

  List<DropdownMenuItem<String>> items = [
    new DropdownMenuItem(
      child: new Text('Escombro y Obstrucción en la vía pública'),
      value: 'Escombro y Obstrucción en la vía pública',
    ),
    new DropdownMenuItem(
      child: new Text('Corte irregular de Arboles'),
      value: 'Corte irregular de Arboles',
    ),
    new DropdownMenuItem(
      child: new Text('Construcción Ilegal'),
      value: 'Construcción Ilegal',
    ),
    new DropdownMenuItem(
      child: new Text('Rotura ilegal de calle, aceras y contenes'),
      value: 'Rotura ilegal de calle, aceras y contenes',
    ),
    new DropdownMenuItem(
      child: new Text('Negocios informales'),
      value: 'Negocios informales',
    ),
    new DropdownMenuItem(
      child: new Text('Publicidad Ilegal'),
      value: 'Publicidad Ilegal',
    ),
    new DropdownMenuItem(
      child: new Text('Cierre de Calles'),
      value: 'Cierre de Calles',
    ),
    new DropdownMenuItem(
      child: new Text('Residuo Sólidos y Vertedero Improvisados'),
      value: 'Residuo Sólidos y Vertedero Improvisados',
    ),
  ];

  Map<String, double> _startLocation;
  Map<String, double> _currentLocation;

  StreamSubscription<Map<String, double>> _locationSubscription;
  bool currentWidget = true;

  Image image1;

  Location _location = new Location();
  String error;

  @override
  void initState() {
    super.initState();

    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged.listen((Map<String, double> result) {
      setState(() {
        _currentLocation = result;
      });
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      location = await _location.getLocation;

      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
      _startLocation = location;
    });
  }

  File image;

//  To use Gallery or File Manager to pick Image
//  Comment Line No. 19 and uncomment Line number 20
  picker() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);

    if (img != null) {
      //uploadFile();
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

    print(_path);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets;

    if (_currentLocation == null) {
      widgets = new List();
    } else {
      widgets = [
        new Image.network(
            "https://maps.googleapis.com/maps/api/staticmap?center=${_currentLocation["latitude"]},${_currentLocation["longitude"]}&zoom=18&size=640x400&key=AIzaSyAoTRyS1b_LwabmrXvWzdBZ0S1H5jFnS6U")
      ];
    }

    widgets.add(new Center(
        child: new Text(_startLocation != null
            ? 'Localización Inicial: $_startLocation\n'
            : 'Error: $error\n')));

    widgets.add(new Center(
        child: new Text(_currentLocation != null
            ? 'Localización continua: $_currentLocation\n'
            : 'Error: $error\n')));

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Crear Reportes'),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Form(
            key: _key,
            autovalidate: _autovalidate,
            child: formUI(),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: picker,
        tooltip: "Abrir cámara",
        child: new Icon(Icons.camera_alt),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Widget formUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Row(
          children: <Widget>[
            new SizedBox(width: 10.0),
            new DropdownButtonHideUnderline(
                child: new DropdownButton(
              items: items,
              hint: new Text('Tipo de caso'),
              value: caso,
              onChanged: (String val) {
                setState(() {
                  caso = val;
                });
              },
            ))
          ],
        ),
        new TextFormField(
          decoration: new InputDecoration(
              hintText: 'Por favor introduzca la información del reporte'),
          onSaved: (val) {
            mensaje = val + ' ';
          },
          validator: validateMessage,
          maxLines: 5,
          maxLength: 256,
        ),
        new Container(
          child: new Center(
            child: image == null
                ? new Image.asset('imagenes/placeholder.png',
                    width: 350.0, height: 350.0)
                : new Image.file(image),
          ),
        ),
        new Center(
          child: new FlatButton(
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

            child: new Text('Enviar'),
            color: Colors.blueAccent,
            textColor: Colors.white,
            splashColor: Colors.redAccent,
            padding: EdgeInsets.all(20.0),
          ),
        ),
        new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              new ListTile(
                leading: new Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: new Text(
                  "Escombro y Obstrucción en la vía pública",
                  style: new TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: new Text(
                    "Consiste en denuncias realizadas por ciudadanos cuando en la vía pública existe escombro de construcciones y limpieza de propiedades que obstruye el paso del peatón."),
              ),
              new Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              new ListTile(
                leading: new Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: new Text(
                  "Corte irregular de Arboles",
                  style: new TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: new Text(
                    'Denuncias de Ciudadanos sobre corte de arboles en patios de residencias o Edenorte, puede ser también arboles tumbado por el viento y que obstruyen la vía publica. Cortar árboles y sacarlo a las calzadas sin autorización está prohibido.'),
              ),
              new Divider(
                color: Colors.blue,
                indent: 16.0,
              ),

              new ListTile(
                leading: new Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: new Text(
                  "Construcción Ilegal",
                  style: new TextStyle(fontWeight: FontWeight.w400),

                ),
                subtitle: new Text('Consiste en construcciones que se levantan en zonas urbanas y rurales y que no han realizado los trámites correspondientes en el departamento de planeamiento urbano.'),
              ),
              new Divider(
                color: Colors.blue,
                indent: 16.0,
              ),

              new ListTile(
                leading: new Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: new Text(
                  "Rotura ilegal de calle, aceras y contenes",
                  style: new TextStyle(fontWeight: FontWeight.w400),

                ),
                subtitle: new Text('Denuncias sobre rotura de calles, aceras y contenes no autorizada por el departamento de planeamiento urbano para realizar conexiones ilegales de agua y cloacas.'),
              ),
              new Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              new ListTile(
                leading: new Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: new Text(
                  "Negocios informales",
                  style: new TextStyle(fontWeight: FontWeight.w400),

                ),
                subtitle: new Text('Instalación de negocios irregulares, instalaciones de tarantines, carros para venta de comida rápida no autorizada por el ayuntamiento de La Vega. '),
              ),
              new Divider(
                color: Colors.blue,
                indent: 16.0,
              ),
              new ListTile(
                leading: new Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: new Text(
                  "Publicidad Ilegal",
                  style: new TextStyle(fontWeight: FontWeight.w400),

                ),
                subtitle: new Text('Instalación de publicidad no autorizada, publicidad móvil, instalación de Vallas.'),
              ),
              
              new Divider(
                color: Colors.blue,
                indent: 16.0,
              ),

              new ListTile(
                leading: new Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: new Text(
                  "Cierre de Calles",
                  style: new TextStyle(fontWeight: FontWeight.w400),

                ),
                subtitle: new Text('Denuncias de cierre de calles no autorizadas para el vaciado de plato, actividades recreativas.'),
              ),

              new Divider(
                color: Colors.blue,
                indent: 16.0,
              ),


              new ListTile(
                leading: new Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 26.0,
                ),
                title: new Text(
                  "Residuo Sólidos y Vertedero Improvisados",
                  style: new TextStyle(fontWeight: FontWeight.w400),

                ),
                subtitle: new Text('Consiste en sacar los desechos sólidos en horarios no establecidos y Permitir Vertedero Improvisados. Sacar la basura en horarios fuera de lugar y ser sorprendidos realizando vertederos improvisados serán sometidos al tribunal municipal.'),
              ),

              new Divider(
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
        "localizacion": _startLocation,
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
