import 'package:flutter/material.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';

import 'appointment_screen.dart';
import 'exam_screen.dart';

class ExamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      drawer: CustomDrawer(),
      appBar: AppBar(
        titleSpacing: MediaQuery.of(context).size.width * 2.3 / 10,
        backgroundColor: Color.fromRGBO(26, 132, 116, 1),
        elevation: 0,
        title: Text(
          "Exames",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        color: Color(0xFF1A8474),
        child: ListView.builder(
          //itemCount: list.length,
          itemBuilder: (context, index) {
            return Card(
              color: Color(0xFF1A8474),
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 10,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Glicemia Jejum',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF1A8474),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Color(0xFF1A8474),
                                  thickness: 3,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '80 mg/dL',
                                            style: TextStyle(
                                              color: Color(0xFF1A8474),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Text(
                                              '24/10/2020',
                                              style: TextStyle(
                                                color: Color(0xFF6A6180),
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Text(
                                              'Saudável',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF005080)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        6 /
                                        10,
                                    height: MediaQuery.of(context).size.height *
                                        0.67 /
                                        10,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ExamScreen()));
                                      },
                                      color: Color(0xFF1A8474),
                                      child: Text(
                                        'Editar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Text(
                        //   //list[index].toString(),
                        //   'Note Title',
                        //   style: TextStyle(
                        //       fontSize: 22, fontWeight: FontWeight.bold),
                        // ),
                        Container()
                      ]),
                ),
                onTap: () => {},
              ),
            );
          },
        ),
      ),
    );
  }
}
