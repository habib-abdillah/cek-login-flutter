import 'package:aplikasi_login/halaman_login.dart';
import 'package:aplikasi_login/halaman_utama.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    HalamanLogin.tag: (context) => HalamanLogin(),
    HalamanUtama.tag: (context) => HalamanUtama(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      home: HalamanLogin(),
      routes: routes,
    );
  }
}
