import 'package:saude_no_bolso/models/patient.dart';

class UserAccount {
  String email;
  String accountType;

  UserAccount(String email, String accountType) {
    this.email = email;
    this.accountType = accountType;
  }
}
