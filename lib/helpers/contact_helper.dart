import 'dart:async';
import 'package:agenda_contatos/constants/contants_string.dart';
import 'package:agenda_contatos/models/contact_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contactsnew.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE ${ContantsData().contactTable}(${ContantsData().idColumn} INTEGER PRIMARY KEY,"
          " ${ContantsData().nameColumn} TEXT, ${ContantsData().emailColumn} TEXT,"
          "${ContantsData().phoneColumn}TEXT,");
    });
  }

  Future<Contact> saveContact(Contact contact) async {
    Database? dbContact = await (db);
    contact.id = await dbContact!.insert(
        ContantsData().contactTable, contact.toMap() as Map<String, Object?>);
    return contact;
  }

  Future<Contact?> getContact(int id) async {
    Database? dbContact = await (db);
    List<Map> maps = await dbContact!.query(ContantsData().contactTable,
        columns: [
          ContantsData().idColumn,
          ContantsData().nameColumn,
          ContantsData().emailColumn,
          ContantsData().phoneColumn,

        ],
        where: "${ContantsData().idColumn} = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Contact.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContact(int? id) async {
    Database? dbContact = await (db);
    return await dbContact!.delete(
      ContantsData().contactTable,
      where: "${ContantsData().idColumn} = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateContact(Contact contact) async {
    Database? dbContact = await (db);
    return await dbContact!.update(
        ContantsData().contactTable, contact.toMap() as Map<String, Object?>,
        where: "${ContantsData().idColumn} = ?", whereArgs: [contact.id]);
  }

  Future<List<Contact>> getAllContacts() async {
    Database? dbContact = await (db);
    String sql;
    sql = ("SELECT * FROM ${ContantsData().contactTable}");

    var result = await dbContact?.rawQuery(sql);

    List<Contact> list = result!.map((item) {
      return Contact.fromMap(item);
    }).toList();

    print(result);
    return list;
  }

  Future<int?> getNumber() async {
    Database? dbContact = await (db);
    return Sqflite.firstIntValue(await dbContact!
        .rawQuery("SELECT COUNT(*) FROM ${ContantsData().contactTable}"));
  }

  Future close() async {
    Database? dbContact = await (db);
    dbContact!.close();
  }
}
