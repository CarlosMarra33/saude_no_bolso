import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saude_no_bolso/models/patient.dart';
import 'package:saude_no_bolso/screen/profile_screen.dart';
import 'package:saude_no_bolso/screen/signup_screen.dart';
import 'package:toast/toast.dart';
import 'package:saude_no_bolso/globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  bool isLoginEnabled;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool emailValidator = false;
  bool passwordValidator = false;

  showToast(String phrase) {
    Toast.show(phrase, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
  }

  loginButton() {
    if (widget.isLoginEnabled == true) {
      loginUser();
    } else {}
  }

  loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text,
              password: _password
                  .text); //email: _email.text, password: _password.text);
      print(userCredential.user.email);

      var patient = await FirebaseFirestore.instance
          .collection('patients')
          .where('email', isEqualTo: userCredential.user.email)
          .get()
          .then((value) => {
                // value.docs.forEach((result) {
                //   print(result.data());

                // })

                globals.patient = Patient.fromSnapshot(value.docs.first)
              });
      //print(patient.toString());
      //globals.patient.email = userCredential.user.email;
      print(globals.patient.email);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    } on FirebaseAuthException catch (e) {
      showToast('Conta não encontrada');
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: bottom),
          reverse: true,
          child: Material(
            child: Column(
              children: [
                Container(
                  color: Color(0xFF1A8474),
                  height: MediaQuery.of(context).size.height * 5 / 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Positioned(
                        top: MediaQuery.of(context).size.height * 3 / 10,
                        left: MediaQuery.of(context).size.width * 2.7 / 10,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 3.5 / 10,
                          child: Image.asset('assets/com nome.png'),
                        ),
                      )
                      // Text(
                      //   'LOGO',
                      //   style: TextStyle(
                      //     fontSize: 40,
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // )
                    ],
                  ),
                ),
                Container(
                  color: Color(0xFFFFFFA),
                  height: MediaQuery.of(context).size.height * 5 / 10,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Fazer login',
                                style: TextStyle(
                                  color: Color(0xFF6A6180),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(4, 4),
                                      blurRadius: 4.0,
                                      color: Color.fromARGB(80, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                                child: Text(
                                  'Criar uma conta',
                                  style: TextStyle(
                                    color: Color(0xFF1A8474),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(4, 4.5),
                                        blurRadius: 4.0,
                                        color: Color.fromARGB(80, 0, 0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 15, left: 60, right: 60),
                                child: Column(
                                  children: [
                                    Form(
                                      autovalidate: true,
                                      child: TextFormField(
                                        validator: (value) =>
                                            EmailValidator.validate(value)
                                                ? null
                                                : "Entre com um email válido",
                                        controller: _email,
                                        decoration: InputDecoration(
                                          //hintStyle:
                                          filled: true,
                                          fillColor: Color(0xFFE6E6F0),
                                          border: InputBorder.none,
                                          hintText: 'E-mail',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Form(
                                      onChanged: () {
                                        _password.text.toString().length > 5
                                            ? passwordValidator = true
                                            : null;
                                      },
                                      autovalidate: true,
                                      child: TextFormField(
                                        validator: (value) => value
                                                        .toString()
                                                        .length >
                                                    5 &&
                                                value.toString().length < 16
                                            ? null
                                            : "Necessária senha entre 6 e 15 dígitos",
                                        controller: _password,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xFFE6E6F0),
                                            border: InputBorder.none,
                                            hintText: 'Senha'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: _buildRaisedButton(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildRaisedButton() {
    bool isEnabled;
    if (widget.isLoginEnabled == null || widget.isLoginEnabled == false) {
      isEnabled = false;
    } else {
      isEnabled = widget.isLoginEnabled;
    }

    return RaisedButton(
      onPressed: () {
        if (isEnabled != null) {
          print(isEnabled == true);
          if (EmailValidator.validate(_email.text) &&
              passwordValidator == true) {
            loginUser();
          }
        }
      },
      color: Color(0xFF1A8474),
      textColor: Colors.white,
      elevation: 10,
      child: Text(
        'Entrar',
        style: TextStyle(fontSize: 17),
      ),
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 110, right: 110),
    );
  }
}
