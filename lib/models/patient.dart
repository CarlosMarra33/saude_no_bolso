import 'package:saude_no_bolso/models/user.dart';
import 'package:saude_no_bolso/services/firebase_service.dart';

class Patient extends User {

  String bloodType;

  Patient(
    String firstName, 
    String lastName,
    String cpf, 
    String gender, 
    String phone, 
    String emergencyPhone, 
    String address,
    FirebaseService service,
    this.bloodType
  ) : super(
    address,
    cpf,
    emergencyPhone,
    firstName,
    gender,
    lastName,
    phone,
    service
  );

}