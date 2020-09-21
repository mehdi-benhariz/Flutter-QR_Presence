import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:QR_Presence/services/database.dart';

class WorkerScreen extends StatefulWidget {
  WorkerScreen({Key key,this.name}) : super(key: key);
  String name;

  @override
  _WorkerScreenState createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
  // final AuthService _auth = AuthService();
  String QRes = "";
  @override
  void initState() {
    super.initState();
    // WidgetsFlutterBinding.ensureInitialized();
    // Firebase.initializeApp();
  }

  void _scan() async {
    String res = await FlutterBarcodeScanner.scanBarcode(
        '#000000', 'Cancel', true, ScanMode.QR);
    await DatabaseService().updateUserData(widget.name);
    QRes = res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () async {
                // await _auth.signOut();
              },
            ),
          ],
        ),
        body: Center(
          child: QRes == ""
              ? FlatButton(
                  child: Text(
                    "click to Scan",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: _scan)
              : Text("Done !, thanks for coming ${widget.name}❤ "),
        ),
        );
  }
}
