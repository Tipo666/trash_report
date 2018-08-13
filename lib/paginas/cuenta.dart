import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String _userId;

class Cuenta extends StatefulWidget {
  @override
  _CuentaState createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Cuenta del usuario"),
      ),
      body: new FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return new Card(
              child: new Column(

                mainAxisSize: MainAxisSize.min,

                children: <Widget>[

                  new ListTile(
                    leading: new Icon(Icons.account_box, color: Colors.blue, size: 26.0,),
                    title: new Text('Correo Electrónico: '+ snapshot.data.email,
                      style: new TextStyle(fontWeight: FontWeight.w400),),


                  ),

                  new Divider(color: Colors.blue, indent: 16.0,),

                  new ListTile(
                    leading: new Icon(Icons.code, color: Colors.blue, size: 26.0,),
                    title: new Text("Código Hash de Usuario: " + snapshot.data.hashCode.toString()
                      ,style: new TextStyle(fontWeight: FontWeight.w400),),
                  ),

                  new Divider(color: Colors.blue, indent: 16.0,),

                  new ListTile(
                    leading: new Icon(Icons.perm_identity, color: Colors.blue, size: 26.0,),
                    title: new Text("ID de Usuario:\n" + snapshot.data.uid
                      ,style: new TextStyle(fontWeight: FontWeight.w400),),
                  ),

                  new Divider(color: Colors.blue, indent: 16.0,),

                  new ListTile(
                    leading: new Icon(Icons.verified_user, color: Colors.blue, size: 26.0,),
                    title: new Text("Correo verificado:\n" + snapshot.data.isEmailVerified.toString()
                      ,style: new TextStyle(fontWeight: FontWeight.w400),),
                  ),

                  new ListTile(
                    leading: new Icon(Icons.photo, color: Colors.blue, size: 26.0,),
                    title: new Text("Foto:\n" + snapshot.data.photoUrl.toString()
                      ,style: new TextStyle(fontWeight: FontWeight.w400),),
                  )

                ],
              ),
            );
          } else {
            return new Text('Loading...');
          }
        },
      ),
    );
  }
}
//Text('Bienvenido: '+ snapshot.data.email);