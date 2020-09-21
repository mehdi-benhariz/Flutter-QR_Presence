import 'package:QR_Presence/widgets/presence_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:QR_Presence/models/presences.dart';
import 'package:QR_Presence/services/database.dart';

class AdminScreen extends StatefulWidget {
  AdminScreen({Key key, this.isLogged, this.toggleAuth}) : super(key: key);
  bool isLogged;
  Function toggleAuth;
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Presence>>.value(
      value: DatabaseService().presences,      
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: widget.toggleAuth,
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
                PresenceList(),
          ],
        ),
      ),
    );
  }
}
