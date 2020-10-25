import 'package:flutter/material.dart';
import 'package:saude_no_bolso/screen/profile_screen.dart';

class SingUpConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        titleSpacing: MediaQuery.of(context).size.width * 2.8/10,
        backgroundColor:Color.fromRGBO(26, 132, 116, 1),
        elevation: 0,
          
      ),
      body: Stack(
        children: [
          Container(
        color: Color(0xFF1A8474),
        child: Column(          
          children: [ 
            Image.network(''),
            Text('CAFASCASCASCAS',
            ),
            Text('CAFASCASCASCAS'),

            RaisedButton(
              onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileScreen()));  
              },
              
              child: Text('Fazer login'),
            ),
            Container(   
              padding: const EdgeInsets.only(top: 0.0, left:30,),
              alignment: Alignment.topLeft, 
              color: Color(0xFF1A8474),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),            
          ],
        ),
      ),
      
        ],
      ),
    );
  }
}