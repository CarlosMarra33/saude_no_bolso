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
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(27),
                            child: Image.network(
                              'https://cdn.pixabay.com/photo/2017/09/02/22/10/dolphin-2708695_960_720.png',
                              scale: 3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 60, right: 60),
                            child: Column(
                              children: [
                                Form(
                                  //onChanged: () => enabledLoginButton('email'),
                                  autovalidate: true,
                                  child: TextFormField(
                                    validator: (value) =>
                                        EmailValidator.validate(value)
                                            ? null
                                            : "Entre com um email válido",
                                    controller: _email,
                                    decoration: InputDecoration(
                                        //hintStyle: ,
                                        filled: true,
                                        fillColor: Colors.green[100],
                                        border: InputBorder.none,
                                        icon: Icon(Icons.email),
                                        hintText: 'Email'),
                                    //focusNode: focusNodeEmail,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
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
                                        fillColor: Colors.green[100],
                                        border: InputBorder.none,
                                        icon: Icon(Icons.lock),
                                        hintText: 'Senha'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          _buildRaisedButton(),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()),
                                );
                              },
                              child: Text(
                                'Cadastre-se!',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 17),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
      color: Colors.green,
      textColor: Colors.white,
      elevation: 10,
      child: Text(
        'Entrar',
        style: TextStyle(fontSize: 17),
      ),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 70, right: 70),
    );
  }
}
