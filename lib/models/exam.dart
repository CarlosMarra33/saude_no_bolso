import 'package:cloud_firestore/cloud_firestore.dart';

class Exam {
  String type;
  String value;
  Timestamp date;

  Exam(String type, String value, DateTime date) {
    this.type = type;
    this.value = value;
    this.date;
  }

  Exam.fromSnapshot(DocumentSnapshot snapshot)
      : type = snapshot['type'],
        value = snapshot['value'],
        date = snapshot['date'];

  countValue(String value, String type) {
    double points = 0.0;

    var valueDouble = double.parse(value);
    if (type == "Glicemia Jejum") {
      if (valueDouble < 100) {
        points = 100;
      } else if (valueDouble > 100 && valueDouble < 126) {
        points = (125 - valueDouble) * 100 / 26;
      } else if (valueDouble >= 126) {
        points = 0;
      }
    } else if (type == "Glicemia Casual") {
      if (valueDouble >= 200) {
        points = 0;
      } else {
        points = 100;
      }
    } else if (type == "TTOG") {
      if (valueDouble < 140) {
        points = 100;
      } else if (valueDouble >= 140 && valueDouble < 200) {
        points = ((200 - valueDouble) * 100) / (200 - 140);
      } else if (valueDouble >= 200) {
        points = 0;
      }
    } else if (type == "Colesterol Total") {
      if (valueDouble < 150) {
        points = 100;
      } else if (valueDouble >= 150 && valueDouble <= 169) {
        points = ((169 - valueDouble) * 100) / (169 - 150);
      } else if (valueDouble >= 170) {
        points = 0;
      }
    } else if (type == "LDLc") {
      if (valueDouble < 100) {
        points = 100;
      } else if (valueDouble > 100 && valueDouble >= 129) {
        points = ((129 - valueDouble) * 100) / (129 - 100);
      } else if (valueDouble >= 130) {
        points = 0;
      }
    } else if (type == "ALT") {
      if (valueDouble < 40) {
        points = 0;
      } else {
        points = 100;
      }
    } else if (type == "HDLc") {
      if (valueDouble >= 45) {
        points = 100;
      } else {
        points = 0;
      }
    } else if (type == "Triglicerideos") {
      if (valueDouble < 100) {
        points = 100;
      } else if (valueDouble >= 100 && valueDouble < 129) {
        points = ((129 - valueDouble) * 100) / (129 - 100);
      } else if (valueDouble >= 130) {
        points = 0;
      }
    }

    return points;
  }
}
