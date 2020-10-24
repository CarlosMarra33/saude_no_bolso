import 'package:flutter/material.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';

class ExamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
        title: Text("Exames"),
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
