import 'package:flutter/material.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';
import 'package:saude_no_bolso/globals.dart' as globals;
import 'package:saude_no_bolso/screen/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      drawer: CustomDrawer(),
      appBar: AppBar(
        titleSpacing: MediaQuery.of(context).size.width * 1.9 / 10,
        backgroundColor: Color.fromRGBO(26, 132, 116, 1),
        elevation: 0,
        title: Text("Configurações",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Seus dados',
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
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                        filled: true,
                        fillColor: Color(0xFFE6E6F0),
                        border: InputBorder.none,                        
                        hintText: '${globals.patient.firstName}'),
                  ),
                      SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Sobrenome',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                        filled: true,
                        fillColor: Color(0xFFE6E6F0),
                        border: InputBorder.none,                        
                        hintText: '${globals.patient.lastName}'),
                  ),
                      SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                        filled: true,
                        fillColor: Color(0xFFE6E6F0),
                        border: InputBorder.none,                        
                        hintText: '${globals.patient.email}'),
                  ),
                      SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Celular',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                        filled: true,
                        fillColor: Color(0xFFE6E6F0),
                        border: InputBorder.none,                        
                        hintText: '${globals.patient.phone}'),
                  ),
                      SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Número de emergência',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                        filled: true,
                        fillColor: Color(0xFFE6E6F0),
                        border: InputBorder.none,                        
                        hintText: '${globals.patient.emergencyPhone}'),
                  ),
                      SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                        filled: true,
                        fillColor: Color(0xFFE6E6F0),
                        border: InputBorder.none,                        
                        hintText: '************'),
                  ), 
                    ],
                  ),
                ),
              )
              ),
              Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2 / 10,
            left: MediaQuery.of(context).size.width * 1.7 / 10,
            width: MediaQuery.of(context).size.width * 6.5 / 10,
            height: MediaQuery.of(context).size.height * 0.7 / 10,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              onPressed: () { 
                Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              color: Color(0xFF04D361),
              child: Text('Salvar Alteração',
                style: TextStyle(  
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
