import 'package:flutter/material.dart';
import 'package:aplikasi_login/halaman_utama.dart';

class HalamanLogin extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<HalamanLogin> {
  final EmailController = TextEditingController();
  final PassController = TextEditingController();
  late String uuser, ppass;

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: Container(
          margin: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              logo,
              SizedBox(height: 18.0),
              TextFormField(
                  controller: EmailController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tolong masukan email anda";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(height: 8.0),
              TextFormField(
                  controller: PassController,
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tolong masukan password anda";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(height: 24.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.lightBlueAccent.shade100,
                  elevation: 5.0,
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 50.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0),
                    ),
                    onPressed: () {
                      uuser = EmailController.text;
                      ppass = PassController.text;

                      if (formkey.currentState!.validate()) {
                        if (uuser != 'pengguna@gmail.com') {
                          // print("Email yang anda masukan salah");
                          setState(() {
                            Widget okButton = FlatButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            );

                            AlertDialog alert = AlertDialog(
                              title: Text("Email yang anda masukan salah"),
                              actions: [
                                okButton,
                              ],
                            );

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          });
                        } else if (ppass != 'pengguna123') {
                          // print("Password yang anda masukan salah");
                          setState(() {
                            Widget okButton = FlatButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            );

                            AlertDialog alert = AlertDialog(
                              title: Text("password yang anda masukan salah"),
                              actions: [
                                okButton,
                              ],
                            );

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          });
                        } else {
                          Navigator.of(context).pushNamed(HalamanUtama.tag);
                        }
                      }
                    },
                    color: Colors.lightBlueAccent,
                    child:
                        Text('Log In', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              FlatButton(
                child: Text('Forgot password?',
                    style: TextStyle(color: Colors.black54)),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
