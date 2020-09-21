import 'package:QR_Presence/screens/adminScreen.dart';
import 'package:QR_Presence/screens/loginScreen.dart';
import 'package:QR_Presence/screens/workerScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Home()),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLogged = false;
  void toggleAuth() => isLogged = !isLogged;
  bool isAdmin = false;
  void toggleAdmin() {
    isAdmin = !isAdmin;
    print(isAdmin);
  }

  String name = "";

  @override
  Widget build(BuildContext context) {
     if( isLogged && isAdmin){
       return AdminScreen(
          isLogged: isLogged,
          toggleAuth: toggleAuth,
        );
        }else if(isLogged ){
          return WorkerScreen(name: name);
        }
  return LoginScreen(isLogged: isLogged, isAdmin: isAdmin, name: name);
     
  }
}
