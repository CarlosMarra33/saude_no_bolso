import 'package:flutter/material.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';

import 'doctor_profile_screen.dart';

class PatientsScreen extends StatefulWidget {
  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      drawer: CustomDrawer(),
      appBar: AppBar(
        titleSpacing: MediaQuery.of(context).size.width * 2.6 / 10,
        backgroundColor: Color.fromRGBO(26, 132, 116, 1),
        elevation: 0,
        title: Text(
          "Chats",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Limpar',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF0F0F7),
        child: ListView.builder(
          //itemCount: list.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                color: Color(0xFFF0F0F7),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 3.0, bottom: 3.0, left: 5.0, right: 5.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 10,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: CircleAvatar(
                                          radius: (47),
                                          backgroundColor: Colors.transparent,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              'https://media-exp1.licdn.com/dms/image/C4E03AQFilx6AuyC21g/profile-displayphoto-shrink_200_200/0?e=1608768000&v=beta&t=1Ml1vbPq6tgtndGlOxVxpBIAhH4bjFrJyIF1MC9Mnns',
                                              height: 170,
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Cayo Cesar',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Text(
                                              'Ultima mensagem',
                                              style: TextStyle(
                                                color: Color(0xFF6A6180),
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
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
                        )
                        // Text(
                        //   //list[index].toString(),
                        //   'Note Title',
                        //   style: TextStyle(
                        //       fontSize: 22, fontWeight: FontWeight.bold),
                        // ),
                      ]),
                ),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoctorProfileScreen()),
                )
              },
            );
          },
        ),
      ),
    );
  }
}
