import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saude_no_bolso/screen/profile_screen.dart';
import 'package:saude_no_bolso/screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  AnimationController _controller;
  AnimationController controllerEmail;
  AnimationController controllerPassword;

  Animation _animation;
  Animation animationEmail;
  Animation animationPassword;

  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 200.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  //   controllerEmail =
  //       AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  //   animationEmail = Tween(begin: 200.0, end: 0.0).animate(controllerEmail)
  //     ..addListener(() {
  //       setState(() {});
  //     });

  //   focusNodeEmail.addListener(() {
  //     if (focusNodeEmail.hasFocus) {
  //       controllerEmail.forward();
  //     } else {
  //       controllerEmail.reverse();
  //     }
  //   });

  //   controllerPassword =
  //       AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  //   animationPassword =
  //       Tween(begin: 150.0, end: 0.0).animate(controllerPassword)
  //         ..addListener(() {
  //           setState(() {});
  //         });

  //   focusNodePassword.addListener(() {
  //     if (focusNodePassword.hasFocus) {
  //       controllerPassword.forward();
  //     } else {
  //       controllerPassword.reverse();
  //     }
  //   });
  //

  loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "teste@gmail.com", password: "123456");
      print('LEONCIO');
      print(userCredential.user.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void dispose() {
    // controllerPassword.dispose();
    // controllerEmail.dispose();
    _controller.dispose();
    // focusNodePassword.dispose();
    // focusNodeEmail.dispose();
    _focusNode.dispose();

    super.dispose();
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
                    // to dismiss the keyboard when the user tabs out of the TextField
                    splashColor: Colors.transparent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Container(
                      //padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: _animation.value),
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
                                TextFormField(
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
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: _password,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.green[100],
                                      border: InputBorder.none,
                                      icon: Icon(Icons.lock),
                                      hintText: 'Senha'),
                                  focusNode: _focusNode,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          RaisedButton(
                            onPressed: () {
                              loginUser();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()),
                              );
                            },
                            disabledColor: Colors.grey[200],
                            color: Colors.green,
                            textColor: Colors.white,
                            disabledTextColor: Colors.grey[350],
                            elevation: 10,
                            child: Text(
                              'Entrar',
                              style: TextStyle(fontSize: 17),
                            ),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 70, right: 70),
                          ),
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
}
