import 'package:flutter_with_user_crud/Classes/Employee.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import 'dart:async';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  //create Database
  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'employee.db'),
        onCreate: (db, version) async {
          await db.execute(
              '''CREATE TABLE employees (useremail TEXT PRIMARY KEY,firstName TEXT ,lastName TEXT ,nicNo TEXT, password TEXT )''');
        }, version: 1);
  }

  addNewEmployee(Employee newEmployee) async {


    final db = await database;

    var res = await db?.rawInsert(
        '''INSERT INTO employees (useremail,firstName,lastName,nicNo,password) VALUES (?,?,?,?,?)''',
        [
          newEmployee.email,
          newEmployee.firstName,
          newEmployee.lastname,
          newEmployee.nic,
          newEmployee.password
        ]);

    return res;
  }

  Future<dynamic> getUser(String email,String password) async{
    final db = await database;
    var res = await db?.rawQuery('''SELECT* from employees WHERE useremail = '$email' AND password='$password' ''');

    if (res?.length == 0) {
      return null;
    }
    else{
      var resMap = res![0];
      return resMap.isNotEmpty ? resMap :null;
    }
  }

  Future<bool> isValidLogin(String email,String password) async{
    final db = await database;
    var res = await db?.rawQuery('''SELECT * from employees WHERE useremail = '$email' AND password='$password' ''');
    if (res?.length == 1) {
      return true;
    }
    else{
      return false;
    }
  }

}



