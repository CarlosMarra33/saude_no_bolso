class Doctor {
  String firstName;
  String lastName;
  String especialization;
  String crm;
  String gender;
  String phone;
  String emergencyPhone;
  String address;
  String birthdate;

  Doctor(String firstName, String lastName, String especialization, String crm,
      String gender, String phone, String emergencyPhone, String address,String birthdate) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.especialization = especialization;
    this.crm = crm;
    this.gender = gender;
    this.phone = phone;
    this.emergencyPhone = emergencyPhone;
    this.address = address;
    this.birthdate = birthdate;
  }
}
