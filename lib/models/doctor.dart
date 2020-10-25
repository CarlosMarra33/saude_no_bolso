import 'package:qrscan/qrscan.dart' as scanner;
import 'package:saude_no_bolso/models/user.dart';
import 'package:saude_no_bolso/services/firebase_service.dart';
class Doctor extends User {
  
  String especialization;
  String crm;
  List<String> listaPacientes;

  Doctor(
    String firstName, 
    String lastName, 
    this.especialization, 
    this.crm, 
    String cpf, 
    String gender, 
    String phone, 
    String emergencyPhone, 
    String address,
    FirebaseService service
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