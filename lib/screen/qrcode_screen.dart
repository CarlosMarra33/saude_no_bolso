import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';
import 'package:saude_no_bolso/globals.dart' as globals;

class QrCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QrImage(
      data: 'This is a simple QR code',
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    );
    return Scaffold(
      extendBodyBehindAppBar: false,
      drawer: CustomDrawer(),
      appBar: AppBar(
        titleSpacing: MediaQuery.of(context).size.width * 2.8 / 10,
        backgroundColor: Color.fromRGBO(26, 132, 116, 1),
        elevation: 0,
        title: Text("QR Code"),
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
              top: MediaQuery.of(context).size.height / 13.5,
              height: MediaQuery.of(context).size.height * 7 / 10,
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
                          'Escanear código',
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
                      Text(
                        'Peça ao médico para apontar a câmera do celular para o QR Code',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width / 1,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: QrImage(
                            data: globals.patient.email.toString(),
                            gapless: true,
                            size: 250,
                            errorCorrectionLevel: QrErrorCorrectLevel.H,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
