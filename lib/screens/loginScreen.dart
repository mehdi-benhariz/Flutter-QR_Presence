import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.isLogged, this.isAdmin, this.name})
      : super(key: key);
  bool isAdmin;
  Function toggleAuth;
  bool isLogged;
  String name;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final AuthService _auth = AuthService();

  bool loading = false;
  String error = "";
  String _psd = "";
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blueGrey, Colors.lightBlueAccent]),
          ),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'A world of possibility in an app',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 40, right: 40, bottom: 30),
                          child: widget.isAdmin
                              ? TextFormField(
                                  validator: (val) => val.length < 6
                                      ? "Enter your password "
                                      : null,
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => _psd = val);
                                  },
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.lightBlueAccent,
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                )
                              : TextFormField(
                                  validator: (val) => val.length < 6
                                      ? "Enter your name "
                                      : null,
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(() => widget.name = val);
                                  },
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.lightBlueAccent,
                                    labelText: "name",
                                    labelStyle: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 120,
                          child: FlatButton(
                            shape: StadiumBorder(),
                            color: _psd != "" || widget.name != ""
                                ? Colors.white
                                : null,
                            onPressed: () async {
                              widget.toggleAuth();
                              setState(() => loading = true);
                              if (_formKey.currentState.validate()) {
                                if (!widget.isAdmin) {
                                  print("valid");
                                  dynamic result;
                                  // = await _auth.signInAnon()
                                  if (result == null) {
                                    print(result);
                                    setState(() => {
                                          loading = false,
                                          error = "error signing in"
                                        });
                                  }
                                } else {
                                  setState(() =>
                                      widget.isLogged = _psd == "testest");
                                  print("is logged ${widget.isLogged}");
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.lightBlueAccent,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 240,
                          height: 40,
                          child: new RaisedButton(
                            shape: StadiumBorder(),
                            onPressed: () {
                              setState(() {
                                widget.isAdmin = !widget.isAdmin;
                              });
                            },
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  widget.isAdmin ? 'Admin' : 'Worker',
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.person,
                                  color: Colors.lightBlueAccent,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
