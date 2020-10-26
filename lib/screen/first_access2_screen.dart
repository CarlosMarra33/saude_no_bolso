import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';
import 'package:saude_no_bolso/screen/profile_screen.dart';
import 'package:saude_no_bolso/screen/singUp_confirmation_screen.dart';

class FirstAccess2 extends StatefulWidget {
  int _value = 1;
  int blood = 0;
  @override
  _FirstAccess2State createState() => _FirstAccess2State();
}

class _FirstAccess2State extends State<FirstAccess2> {
  bool isDoctor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      // drawer:  SvgPicture.asset('assets/Voltar.svg'),
      appBar: AppBar(
        titleSpacing: MediaQuery.of(context).size.width * 2.6 / 10,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF1A8474),
                ),
                onPressed: () {
                  Navigator.pop(context);
                });
          },
        ),
        backgroundColor: Color(0xFFF0F0F7),
        elevation: 0,
        title: Text(
          "Olá, Cayo",
          style: TextStyle(color: Color(0xFF1A8474)),
        ),
      ),
      body: Container(
        color: Color(0xFFF0F0F7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                'Continue \no seu cadastro',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 40),
              width: MediaQuery.of(context).size.width * 5.6 / 10,
              child: Text('Matheus, prescisamos saber um pouco mais de voçê :)',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]
                      // fontWeight: FontWeight.bold,
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, left: 40, right: 40),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'entre com um dado válido' : null,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(10)
                        // ),
                        //hintStyle: ,
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Endereço'),
                    //focusNode: focusNodeEmail,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) => value.isEmpty && value.length != 11
                        ? 'entre com um dado válido'
                        : null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Número de Emergência'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isDoctor ? crmInput() : bloodType(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 8 / 10,
                    height: MediaQuery.of(context).size.height * 0.7 / 10,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: DropdownButton(
                          value: widget._value,
                          items: [
                            DropdownMenuItem(
                              child: Text("Feminino"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("Masculino"),
                              value: 2,
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
                    height: 55,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 8 / 10,
                    height: MediaQuery.of(context).size.height * 0.8 / 10,
                    // alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpConfirmation()));
                      },
                      color: Color(0xFF1A8474),
                      child: Text(
                        'Finalizar Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bloodType() {
    return Container(
      width: MediaQuery.of(context).size.width * 8 / 10,
      height: MediaQuery.of(context).size.height * 0.7 / 10,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 130),
        child: DropdownButton(
            value: widget._value,
            items: [
              DropdownMenuItem(
                child: Text("A+"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("A-"),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text("B+"),
                value: 3,
              ),
              DropdownMenuItem(
                child: Text("B-"),
                value: 4,
              ),
              DropdownMenuItem(
                child: Text("AB+"),
                value: 5,
              ),
              DropdownMenuItem(
                child: Text("AB-"),
                value: 6,
              ),
              DropdownMenuItem(
                child: Text("O+"),
                value: 7,
              ),
              DropdownMenuItem(
                child: Text("O-"),
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
    );
  }

  Widget crmInput() {
    return TextFormField(
      validator: (value) => value.isEmpty ? 'entre com um dado válido' : null,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          hintText: 'CRM'),
    );
  }
}
