import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:saude_no_bolso/screen/base_screen.dart';
import 'package:saude_no_bolso/screen/qr_code_reader.dart';
import 'package:saude_no_bolso/screen/splash_screen.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp();

  FirebaseFirestore.instance.collection('usuarios').add({'teste': 'teste'});
  // FirebaseFirestore.instance
  //     .collection('teste')
  //     .where('TdLQO7IAGRcA82TLAf8w')
  //     .get()
  //     .then((doc) => print(doc.toString()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saúde no Bolso',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        secondaryHeaderColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenPage(),
    );
  }
}
