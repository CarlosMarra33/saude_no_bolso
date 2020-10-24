import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';

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
      extendBodyBehindAppBar: true,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
        title: Text("QR Code"),
      ),
      
body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            QrImage(
              data: '1234455',
              gapless: true,
              size: 250,
              errorCorrectionLevel: QrErrorCorrectLevel.H,
            )
          ],
        ),
      ),
    );    
  }
}
