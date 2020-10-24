
import 'package:flutter/material.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';

class AppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      drawer: CustomDrawer(),
      appBar: AppBar(
        titleSpacing: MediaQuery.of(context).size.width * 2.8/10,
        backgroundColor:Color.fromRGBO(26, 132, 116, 1),
        elevation: 0,
        title: Text("Médico"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 23, right: 20),
            child: GestureDetector(
              onTap: () {
                
              },
              child: Text('Chat',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
        color: Colors.white,
        child: Column(
          
          children: [            
            Container(   
              padding: const EdgeInsets.only(top: 0.0, left:30,),
              alignment: Alignment.topLeft,        
              height: MediaQuery.of(context).size.height / 3.9,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF1A8474),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: (42),                
                    backgroundColor: Colors.transparent,
                    child: ClipRRect( 
                      borderRadius:BorderRadius.circular(50),
                      child: Image.network(
                      'https://media-exp1.licdn.com/dms/image/C4E03AQFilx6AuyC21g/profile-displayphoto-shrink_200_200/0?e=1608768000&v=beta&t=1Ml1vbPq6tgtndGlOxVxpBIAhH4bjFrJyIF1MC9Mnns',
                      height: 170,
                      ),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cayo Cesar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('Ortopedista',
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(              
              color: Colors.white,
            )
          ],
        ),
      ),
      Positioned(
        left:MediaQuery.of(context).size.width / 30,
        top: MediaQuery.of(context).size.height / 7,
        height: MediaQuery.of(context).size.height * 7/10,
        width: MediaQuery.of(context).size.width * 9.35/10,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,              
              children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text('Informações do médico',
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
              Text('Email',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5/10,
                width: MediaQuery.of(context).size.width * 6/10,
                child: Card(
                  elevation: 2,
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Matheus@gmail.com',
                      style: TextStyle(
                          color: Color(0xFF6A6180),
                          fontWeight: FontWeight.bold
                        ),
                    ),
                  ),
                ),
              ),
              Text('CRM',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5/10,
                width: MediaQuery.of(context).size.width * 6/10,
                child: Card(
                  elevation: 2,
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('111111111',
                      style: TextStyle(
                          color: Color(0xFF6A6180),
                          fontWeight: FontWeight.bold
                        ),
                    ),
                  ),
                ),
              ),
              Text('Celular',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5/10,
                width: MediaQuery.of(context).size.width * 6/10,
                child: Card(
                  elevation: 2,
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('2222222',
                      style: TextStyle(
                          color: Color(0xFF6A6180),
                          fontWeight: FontWeight.bold
                        ),
                    ),
                  ),
                ),
              ),
              Text('Número de Emergência',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5/10,
                width: MediaQuery.of(context).size.width * 6/10,
                child: Card(
                  elevation: 2,
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('22222222',
                      style: TextStyle(
                          color: Color(0xFF6A6180),
                          fontWeight: FontWeight.bold
                        ),
                    ),
                  ),
                ),
              ),
              Text('Prescrição',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 2/10,
                width: MediaQuery.of(context).size.width * 6/10,
                child: Card(
                  
                  elevation: 2,
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('zkldfjgbsljvlsbsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',
                        style: TextStyle(
                          color: Color(0xFF6A6180),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),),
                ),
              ),
            ],
          ),
          ),
        ))
        ],
      ),
    );
  }
}