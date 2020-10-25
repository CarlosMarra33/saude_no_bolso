import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';

import 'first_access2_screen.dart';

class FirstAccess1 extends StatelessWidget {
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
                'Complete \no seu cadastro',
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
              padding: EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Column(
                children: [
                  TextFormField(
                    autovalidate: true,
                    validator: (value) {
                      Pattern pattern =
                          r'/^\(?(\d{2})\)?(\d{5})[- ]?(\d{4})$/';
                      RegExp regex = new RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'Enter Valid Phone Number';
                      } else {
                        return null;
                      }
                    },

                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(10)
                        // ),
                        //hintStyle: ,
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Primeiro Nome'),
                    //focusNode: focusNodeEmail,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidate: true,
                    validator: (value) =>
                        value.isEmpty && value.contains(new RegExp(r'[0-9]'))
                            ? 'entre com um dado válido'
                            : null,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(10)
                        // ),
                        //hintStyle: ,
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Sobrenome'),
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
                        hintText: 'CPF'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'entre com um dado válido' : null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Data de Nascimeto'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) => value.isEmpty &&
                            value.contains(RegExp(r'^[a-zA-Z]+$')) &&
                            value.length != 11
                        ? 'entre com um dado válido'
                        : null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Celular'),
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
                                builder: (context) => FirstAccess2()));
                      },
                      color: Color(0xFF1A8474),
                      child: Text(
                        'Próximo',
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
}
