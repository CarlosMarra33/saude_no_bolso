import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saude_no_bolso/screen/first_access1_screen.dart';
import 'package:saude_no_bolso/screen/profile_screen.dart';
import 'package:toast/toast.dart';

import 'login_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  bool isSignUpEnabled;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirmation = TextEditingController();

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
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: _email.text, password: _password.text);
    final user = result.user;
    print(user);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FirstAccess1()),
    );

    assert(user != null);
    assert(await user.getIdToken() != null);
    return user;
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
            color: Colors.white,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  InkWell(
                    // to dismiss the keyboard when the user tabs out of the TextField
                    splashColor: Colors.transparent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xFF1A8474),
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2017/09/02/22/10/dolphin-2708695_960_720.png',
                            scale: 3,
                          ),
                        ),
                        Container(
                          height: 300,
                          color: Colors.grey[50],
                          child: Container(
                            color: Colors.grey[50],
                            //padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 60, right: 60),
                                  child: Column(
                                    children: [
                                      Form(
                                        autovalidate: true,
                                        child: TextFormField(
                                          controller: _email,
                                          validator: (value) =>
                                              EmailValidator.validate(value)
                                                  ? null
                                                  : "Entre com um email válido",
                                          decoration: InputDecoration(
                                              //hintStyle: ,
                                              filled: true,
                                              fillColor: Colors.green[100],
                                              border: InputBorder.none,
                                              icon: Icon(Icons.email),
                                              hintText: 'Email'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
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
                                          //focusNode: _focusNode,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                _buildSignUpButton()
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
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
      color: Colors.green,
      textColor: Colors.white,
      disabledTextColor: Colors.grey[350],
      elevation: 10,
      child: Text(
        'Cadastrar-se',
        style: TextStyle(fontSize: 17),
      ),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 70, right: 70),
    );
  }
}
