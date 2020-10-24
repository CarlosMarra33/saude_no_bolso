class Patient {
  String firstName;
  String lastName;
  String bloodType;
  String cpf;
  String gender;
  String phone;
  String emergencyPhone;
  String address;

  Patient(String firstName, String lastName, String bloodType, String cpf, String gender, String phone, String emergencyPhone, String address) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.bloodType = bloodType;
    this.cpf = cpf;
    this.gender = gender;
    this.phone = phone;
    this.emergencyPhone = emergencyPhone;
    this.address = address;
  }
}