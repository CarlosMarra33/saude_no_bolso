import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saude_no_bolso/models/doctor.dart';
import 'package:saude_no_bolso/models/patient.dart';
import 'package:saude_no_bolso/models/user.dart';
import 'package:logger/logger.dart';

class FirebaseService {

  final CollectionReference _doctors = FirebaseFirestore.instance.collection('doctors');
  final CollectionReference _patients = FirebaseFirestore.instance.collection('patients');
  
  final Logger _logger = new Logger();

  static final FirebaseService _firebaseService = FirebaseService._internal();

  factory FirebaseService() {
    return _firebaseService;
  }

  FirebaseService._internal();

  Future<Map<String, dynamic>> getUserData(User user) async {
    
    Map<String, dynamic> data = new Map();

    if (User is Doctor) {
    
      await _doctors
        .doc(user.cpf)
        .get()
        .then((DocumentSnapshot documentSnapshot) => {
          if (documentSnapshot.exists) {
            data = documentSnapshot.data(),
            _logger.i("Doutor de CPF ${user.cpf} foi recuperado do banco com sucesso.")
          } else {
            _logger.e("Erro de recuperação de um Doutor no Firebase: Doutor de CPF ${user.cpf} não existe no banco!")
          }
        })
        .catchError((e) => {
          _logger.e("Erro de recuperação de um Doutor no Firebase: " + e.error)
        });
    
      return data;
    
    } else if (User is Patient){
    
      await _patients
        .doc(user.cpf)
        .get()
        .then((DocumentSnapshot documentSnapshot) => {
          if (documentSnapshot.exists) {
            data = documentSnapshot.data(),
            _logger.i("Paciente de CPF ${user.cpf} foi recuperado do banco com sucesso.")
          } else {
            _logger.e("Erro de recuperação de um Paciente no Firebase: Paciente de CPF ${user.cpf} não existe no banco!")
          }
        })
        .catchError((e) => {
          _logger.e("Erro de recuperação de um Paciente no Firebase: " + e.error)
        });
    
      return data;
    
    }
  
  }

}