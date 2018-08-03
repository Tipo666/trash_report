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
  String caso, mensaje;

  List<DropdownMenuItem<String>> items = [
    new DropdownMenuItem(
      child: new Text('Venta ilegal'),
      value: 'Venta ilegal',
    ),
    new DropdownMenuItem(
      child: new Text('Cúmulo de Basura'),
      value: 'Cúmulo de Basura',
    ),
    new DropdownMenuItem(
      child: new Text('Tala ilegal de árboles'),
      value: 'Tala ilegal de árboles',
    ),
    new DropdownMenuItem(
      child: new Text('Escombros de construcción'),
      value: 'Escombros de construcción',
    ),
    new DropdownMenuItem(
      child: new Text('Obstrucción de vías'),
      value: 'Obstrucción de vías',
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
            mensaje = val;
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
        new FlatButton(
          onPressed: _sendToServer,
          child: new Text('Enviar'),
          color: Colors.blueAccent,
          textColor: Colors.white,
          splashColor: Colors.redAccent,
        ),
      ],
    );
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
  }

  String validateName(String val) {
    return val.length == 0 ? "Elige el Caso primeto" : null;
  }

  String validateMessage(String val) {
    return val.length == 0 ? "Ingresa el mensaje primero" : null;
  }
}
