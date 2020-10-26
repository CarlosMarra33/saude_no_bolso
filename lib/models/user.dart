import 'package:saude_no_bolso/models/patient.dart';

class UserAccount {
  String email;
  String accountType;
  String photo;

  UserAccount(String email, String accountType, String photo) {
    this.email = email;
    this.accountType = accountType;
    this.photo = photo;
  }
}
