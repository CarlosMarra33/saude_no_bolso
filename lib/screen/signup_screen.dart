import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saude_no_bolso/screen/first_access1_screen.dart';
import 'package:saude_no_bolso/screen/profile_screen.dart';
import 'package:saude_no_bolso/models/user.dart';
import 'package:toast/toast.dart';
import 'package:saude_no_bolso/globals.dart' as globals;

import 'login_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  int _value = 1;
  bool isSignUpEnabled;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirmation = TextEditingController();
  String accountType;

  AnimationController _controller;
  Animation _animation;

  bool passwordValidator = false;
  bool passwordConfirmationValidator = false;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  Future signUp(email, password) async {
    // if (_password == _passwordConfirmation) {

    // }
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: _email.text, password: _password.text);
      final user = result.user;
      print(user);
      FirebaseFirestore.instance
          .collection('users')
          .add({'email': user.email, 'accountType': accountType});

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirstAccess1()),
      );

      assert(user != null);
      assert(await user.getIdToken() != null);
      return user;
    } on FirebaseAuthException catch (e) {
      Toast.show('Conta não encontrada', context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xFF1A8474),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  });
            },
          ),
          titleSpacing: MediaQuery.of(context).size.width * 2.3 / 10,
          backgroundColor: Color(0xFFF0F0F7),
          elevation: 0,
          title: Text(
            "Cadastro",
            style: TextStyle(
              color: Color(0xFF1A8474),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: bottom),
          reverse: true,
          child: Material(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 9 / 10,
                      width: MediaQuery.of(context).size.height * 9 / 10,
                      color: Color(0xFFF0F0F7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Crie sua \n conta gratuíta',
                                  style: TextStyle(
                                    color: Color(0xFF32264D),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    'Basta preencher esses dados e você estará dando um grande passo na sua vida.',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Color(0xFF6A6180),
                                      fontSize: 15.6,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey[600],
                                  thickness: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 25,
                                    left: 100,
                                  ),
                                  child: GestureDetector(
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: globals.user.photo != ''
                                                  ? FileImage(
                                                      File(globals.user.photo))
                                                  : AssetImage(
                                                      "assets/person.png"))),
                                    ),
                                    onTap: () {
                                      ImagePicker.pickImage(
                                              source: ImageSource.camera)
                                          .then((file) {
                                        if (file == null) return;
                                        setState(() {
                                          globals.user.photo = file.path;
                                        });
                                      });
                                    },
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 60, right: 60),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 22),
                                            child: Form(
                                              autovalidate: true,
                                              child: TextFormField(
                                                controller: _email,
                                                validator: (value) =>
                                                    EmailValidator.validate(
                                                            value)
                                                        ? null
                                                        : "Entre com um email válido",
                                                decoration: InputDecoration(
                                                  //hintStyle:
                                                  filled: true,
                                                  fillColor: Color(0xFFE6E6F0),
                                                  border: InputBorder.none,
                                                  hintText: 'E-mail',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Form(
                                            onChanged: () {
                                              _password.text.toString().length >
                                                          5 &&
                                                      _password.text
                                                              .toString()
                                                              .length <
                                                          16
                                                  ? passwordValidator = true
                                                  : passwordValidator = false;
                                            },
                                            autovalidate: true,
                                            child: TextFormField(
                                              validator: (value) => value
                                                              .toString()
                                                              .length >
                                                          5 &&
                                                      value.toString().length <
                                                          16
                                                  ? null
                                                  : "Necessária senha entre 6 e 15 dígitos",
                                              controller: _password,
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Color(0xFFE6E6F0),
                                                  border: InputBorder.none,
                                                  hintText: 'Senha'),
                                              //focusNode: _focusNode,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                8 /
                                                10,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.7 /
                                                10,
                                            color: Color(0xFFE6E6F0),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: DropdownButton(
                                                  value: widget._value,
                                                  items: [
                                                    DropdownMenuItem(
                                                      child: Text("Paciente"),
                                                      value: 1,
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text("Médico"),
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
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    _buildSignUpButton()
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

 
  Widget _buildSignUpButton() {
    bool isEnabled;
    if (widget.isSignUpEnabled == null || widget.isSignUpEnabled == false) {
      isEnabled = false;
    } else {
      isEnabled = widget.isSignUpEnabled;
    }
    return RaisedButton(
      onPressed: () {
        if (isEnabled != null) {
          print(isEnabled == true);
          print(EmailValidator.validate(_email.text));
          print(passwordValidator == true);
          if (EmailValidator.validate(_email.text) &&
              (passwordValidator == true)) {
            signUp(_email, _password);
          } else {
            Toast.show('Email Inválido ou as senhas não batem', context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
          }
        }

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => LoginScreen()),
        // );
      },
      disabledColor: Colors.grey[200],
      color: Color(0xFF1A8474),
      textColor: Colors.white,
      disabledTextColor: Colors.grey[350],
      elevation: 10,
      child: Text(
        'Cadastrar-se',
        style: TextStyle(fontSize: 17),
      ),
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
    );
  }
}
