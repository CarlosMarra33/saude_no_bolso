import 'package:flutter/material.dart';
import 'package:saude_no_bolso/screen/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_screen.dart';

class SignUpConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1A8474),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 110),
              child: SvgPicture.asset(
                'assets/Feito.svg',
                height: 100,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Cadastro \n Salvo!',
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20.0, left: 17),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              'Tudo certo, o seu cadastro foi realizado com sucesso! Acogora é só aproveitar bastante o aplicativo :)',
              textAlign: TextAlign.start,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.grey[300],
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              width: MediaQuery.of(context).size.width * 8 / 10,
              height: MediaQuery.of(context).size.height * 0.8 / 10,
              // alignment: Alignment.bottomCenter,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                color: Color(0xFF04D361),
                child: Text(
                  'Fazer Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
