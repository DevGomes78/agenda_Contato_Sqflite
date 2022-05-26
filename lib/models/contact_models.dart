import 'package:agenda_contatos/constants/contants_string.dart';

class Contact {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? img;

  Contact();

  Contact.fromMap(Map map) {
    id = map[ContantsData().idColumn];
    name = map[ContantsData().nameColumn];
    email = map[ContantsData().emailColumn];
    phone = map[ContantsData().phoneColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      ContantsData().nameColumn: name,
      ContantsData().emailColumn: email,
      ContantsData().phoneColumn: phone,
    };
    if (id != null) {
      map[ContantsData().idColumn] = id;
    }
    return map;
  }
}
