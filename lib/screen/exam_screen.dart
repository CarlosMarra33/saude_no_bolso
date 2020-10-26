import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';
import 'package:saude_no_bolso/screen/profile_screen.dart';
import 'package:saude_no_bolso/globals.dart' as globals;

class ExamScreen extends StatefulWidget {
  String type = '';
  int _value = 1;
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  TextEditingController _examValue = TextEditingController();

  sendExam() async {
    var result = await FirebaseFirestore.instance.collection('exams').add({
      'date': '25 de outubro de 2020 11:11:11 UTC-3',
      'email': globals.patient.email,
      'type': widget.type,
      'value': _examValue.text
    });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      extendBodyBehindAppBar: false,
      drawer: CustomDrawer(),
      appBar: AppBar(
        titleSpacing: MediaQuery.of(context).size.width * 2.3 / 10,
        backgroundColor: Color.fromRGBO(26, 132, 116, 1),
        elevation: 0,
        title: Text(
          "Novo Exame",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFF1A8474),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 0.0,
                    left: 30,
                  ),
                  alignment: Alignment.topLeft,
                  color: Color(0xFF1A8474),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width / 30,
              top: MediaQuery.of(context).size.height / 63.5,
              height: MediaQuery.of(context).size.height * 7.5 / 10,
              width: MediaQuery.of(context).size.width * 9.35 / 10,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 90, top: 50),
                        height: MediaQuery.of(context).size.height * 3 / 10,
                        child: Image.asset('assets/sem nome.png'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Entre com as informações',
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        height: MediaQuery.of(context).size.height * 0.7 / 10,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: DropdownButton(
                              value: widget._value,
                              items: [
                                DropdownMenuItem(
                                  child: Text(globals.examTypeList[0]),
                                  onTap: () {
                                    widget.type = globals.examTypeList[0];
                                  },
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text(globals.examTypeList[1]),
                                  onTap: () {
                                    widget.type = globals.examTypeList[1];
                                  },
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Text(globals.examTypeList[2]),
                                  onTap: () {
                                    widget.type = globals.examTypeList[2];
                                  },
                                  value: 3,
                                ),
                                DropdownMenuItem(
                                  child: Text(globals.examTypeList[3]),
                                  onTap: () {
                                    widget.type = globals.examTypeList[3];
                                  },
                                  value: 4,
                                ),
                                DropdownMenuItem(
                                  child: Text(globals.examTypeList[4]),
                                  onTap: () {
                                    widget.type = globals.examTypeList[4];
                                  },
                                  value: 5,
                                ),
                                DropdownMenuItem(
                                  child: Text(globals.examTypeList[5]),
                                  onTap: () {
                                    widget.type = globals.examTypeList[5];
                                  },
                                  value: 6,
                                ),
                                DropdownMenuItem(
                                  child: Text(globals.examTypeList[6]),
                                  onTap: () {
                                    widget.type = globals.examTypeList[6];
                                  },
                                  value: 7,
                                ),
                                DropdownMenuItem(
                                  child: Text(globals.examTypeList[7]),
                                  onTap: () {
                                    widget.type = globals.examTypeList[7];
                                  },
                                  value: 8,
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  widget._value = value;
                                  print(widget._value);
                                });
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: TextFormField(
                          controller: _examValue,
                          decoration: InputDecoration(
                              labelText: 'Valor',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: Color(0xFFE6E6F0),
                              border: InputBorder.none,
                              hintText: 'Valor'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2 / 10,
              left: MediaQuery.of(context).size.width * 1.7 / 10,
              width: MediaQuery.of(context).size.width * 6.5 / 10,
              height: MediaQuery.of(context).size.height * 0.7 / 10,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  sendExam();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                color: Colors.white,
                child: Text(
                  'Adicionar',
                  style: TextStyle(
                    color: Color(0xFF1A8474),
                    fontSize: 18,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
