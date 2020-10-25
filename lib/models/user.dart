import 'package:saude_no_bolso/services/firebase_service.dart';

class User {

  String firstName;
  String lastName;
  String gender;
  String phone;
  String emergencyPhone;
  String address;
  String cpf;
  FirebaseService service;

  User(
    this.address,
    this.cpf,
    this.emergencyPhone,
    this.firstName,
    this.gender,
    this.lastName,
    this.phone,
    this.service
  );

}