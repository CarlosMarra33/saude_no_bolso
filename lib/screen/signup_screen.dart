import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saude_no_bolso/screen/profile_screen.dart';

import 'login_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  AnimationController _controller;
  Animation _animation;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 20.0, end: 0.0).animate(_controller)
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

  Future signUp(email, password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: 'teste@gmail.com', password: '123456');
    final user = result.user;
    print(user);

    assert(user != null);
    assert(await user.getIdToken() != null);
    return user;
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Material(
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
                          signUp(_email, _password);
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
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 70, right: 70),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
