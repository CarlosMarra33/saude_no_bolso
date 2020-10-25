import 'package:cloud_firestore/cloud_firestore.dart';

class Patient {
  String firstName;
  String lastName;
  String bloodType;
  String cpf;
  String gender;
  String phone;
  String emergencyPhone;
  String address;
  String email;
  String birthdate;

  Patient(
      String firstName,
      String lastName,
      String bloodType,
      String cpf,
      String gender,
      String phone,
      String emergencyPhone,
      String address,
      String email,
      String birthdate) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.bloodType = bloodType;
    this.cpf = cpf;
    this.gender = gender;
    this.phone = phone;
    this.emergencyPhone = emergencyPhone;
    this.address = address;
    this.email = email;
    this.birthdate = birthdate;
  }

  Patient.fromSnapshot(DocumentSnapshot snapshot)
      : email = snapshot['email'],
        firstName = snapshot['firstName'],
        lastName = snapshot['lastName'],
        bloodType = snapshot['bloodType'],
        cpf = snapshot['cpf'],
        gender = snapshot['gender'],
        phone = snapshot['phone'],
        emergencyPhone = snapshot['emergencyPhone'],
        address = snapshot['address'],
        birthdate = snapshot['birthdate'];
}
