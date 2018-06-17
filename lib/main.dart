import 'package:flutter/material.dart';
import 'package:trash_report/paginas/auth.dart';
import 'package:trash_report/paginas/login_page.dart';
import 'package:trash_report/paginas/root_page.dart';
import 'package:trash_report/paginas/splash_screen.dart';
import './paginas/home_page.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomePage(),
  "/login": (BuildContext context) => LoginPage()
};

/*
Ventanas:
1. Splash Screen
2. Login
3. Crear Usuario
4. Ventana Principal
5. Ver Mis Reportes
6. Cuenta (Usuario)
7. Configuración (Aplicacion)
8. Contacto
9. Crear Reporte

 */
void main() => runApp(new MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueAccent, accentColor: Colors.redAccent),
      debugShowCheckedModeBanner: false,
      home: new RootPage(auth: new Auth()),
      routes: routes,
    ));
