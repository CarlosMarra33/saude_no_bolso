import 'package:flutter/material.dart';
import 'package:saude_no_bolso/common/custom_drawer/custom_drawer.dart';
import 'package:saude_no_bolso/screen/appointments_screen.dart';
import 'package:saude_no_bolso/screen/exam_screen.dart';
import 'package:saude_no_bolso/screen/profile_screen.dart';
import 'package:saude_no_bolso/screen/qrcode_screen.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ProfileScreen(),
        ExamScreen(),
        QrCodeScreen(),
        AppointmentsScreen()
      ],
    );
  }
}
