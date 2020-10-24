import 'dart:convert';

import 'package:flutter/material.dart';
import '../screen/profile_screen.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';

class AppointmentsScreen extends StatelessWidget {
  List list = [0, 1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(26, 132, 116, 1),
        elevation: 0,
        title: Text("Consultas"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                color: Color.fromRGBO(255, 255, 255, 1),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, left: 16.0, right: 16.0
                    ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        list[index].toString(),
                        // 'Note Title',
                        style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Note Title',
                      )
                    ]
                  ),
                )
              ),
              // onTap: Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
            );
          },
        ),
      ),
    );
  }
}
