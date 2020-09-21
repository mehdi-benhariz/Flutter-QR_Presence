import 'package:QR_Presence/models/presences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PresenceList extends StatefulWidget {
  PresenceList({Key key}) : super(key: key);

  @override
  _PresenceListState createState() => _PresenceListState();
}

class _PresenceListState extends State<PresenceList> {
  @override
  Widget build(BuildContext context) {
    final presences = Provider.of<List<Presence>>(context) ?? [];
    return Container(
      child: Column(
        children: <Widget>[
          ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: presences.length,
              itemBuilder: (BuildContext context,int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: null,
                    ),
                    title: Text("${presences[index].worker} "),
                    subtitle: Text('was present at ${presences[index].date}'),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
