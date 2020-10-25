import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrCoderReaderScreen extends StatefulWidget {
  TextEditingController _outputController;
  @override
  _QrCoderReaderScreenState createState() => _QrCoderReaderScreenState();
}

class _QrCoderReaderScreenState extends State<QrCoderReaderScreen> {
  Uint8List bytes = Uint8List(0);
  TextEditingController _inputController;

  @override
  initState() {
    super.initState();
    this._inputController = new TextEditingController();
    widget._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Container(
              //child: ,
              )),
    );
  }
}
