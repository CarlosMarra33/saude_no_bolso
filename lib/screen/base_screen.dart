import 'package:flutter/material.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';
import 'package:saude_no_bolso/screen/appointments_screen.dart';
import 'package:saude_no_bolso/screen/doctor_profile_screen.dart';
import 'package:saude_no_bolso/screen/exams_screen.dart';
import 'package:saude_no_bolso/screen/profile_screen.dart';
import 'package:saude_no_bolso/screen/qr_code_reader.dart';
import 'package:saude_no_bolso/screen/qrcode_screen.dart';
import 'package:saude_no_bolso/globals.dart' as globals;

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        globals.user.accountType == 'doctor'
            ? DoctorProfileScreen()
            : ProfileScreen(),
        globals.user.accountType == 'patient' ? ExamsScreen() : null,
        globals.user.accountType == 'patient'
            ? QrCodeScreen()
            : QrCodeReaderScreen(),
        AppointmentsScreen()
      ],
    );
  }
}
